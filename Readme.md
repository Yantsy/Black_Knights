文明六MOD

记录错误一：PlayerColors中不需要定义TextColor,不然会导致颜色和设定颜色对不上

记录错误二：AssetsEditor直接生成的FallbackLeaders.artdef，部分参数会填错，这两个参数应该名称应和xlp文件保持一致

```xml
<Element ...>
    <!--...-->
    	<m_XLPPath text="LeaderFallbacks.xlp"/>
		<m_BLPPackage text="LeaderFallbacks"/>
    <!--...-->
<Element/>
```

记录错误三：ICON的命名规则尽量遵循：ICON+文明/领袖/建筑/改良设施/区域...变量名原则，否则可能会导致图标不显示
```
ICON_DISTRIC_XXXX
```

记录错误四：特色区域中的特色建筑不显示，原因在于前置区域不能写特色区域而是要写被它替代的原区域
```xml
	<Types>
		<Row Type="DISTRICT_BLACK_KNIGHTS_COMMAND" Kind="KIND_DISTRICT"/>
	</Types>
	<DistrictReplaces>
		<Row CivUniqueDistrictType="DISTRICT_BLACK_KNIGHTS_COMMAND" ReplacesDistrictType="DISTRICT_GOVERNMENT"/>
	</DistrictReplaces>

<!--错误写法，PrereqDistrict="DISTRICT_BLACK_KNIGHTS_COMMAND"-->
	<Buildings>
		<Row BuildingType="BUILDING_BLACK_KNIGHTS_FOREIGN_MINISTRY" Name="LOC_BUILDING_BLACK_KNIGHTS_FOREIGN_MINISTRY_NAME" Description="LOC_BUILDING_BLACK_KNIGHTS_FOREIGN_MINISTRY_DESCRIPTION"
			 PrereqDistrict="DISTRICT_BLACK_KNIGHTS_COMMAND" Cost="290" AdvisorType="ADVISOR_GENERIC" Maintenance="2" UnlocksGovernmentPolicy="True" GovernmentTierRequirement="Tier2"
			 TraitType="TRAIT_CIVILIZATION_BUILDING_BLACK_KNIGHTS_FOREIGN_MINISTRY"/>
	</Buildings>

<!--正确写法，PrereqDistrict="DISTRICT_GOVERNMENT"-->
	<Buildings>
		<Row BuildingType="BUILDING_BLACK_KNIGHTS_FOREIGN_MINISTRY" Name="LOC_BUILDING_BLACK_KNIGHTS_FOREIGN_MINISTRY_NAME" Description="LOC_BUILDING_BLACK_KNIGHTS_FOREIGN_MINISTRY_DESCRIPTION"
			 PrereqDistrict="DISTRICT_GOVERNMENT" Cost="290" AdvisorType="ADVISOR_GENERIC" Maintenance="2" UnlocksGovernmentPolicy="True" GovernmentTierRequirement="Tier2"
			 TraitType="TRAIT_CIVILIZATION_BUILDING_BLACK_KNIGHTS_FOREIGN_MINISTRY"/>
	</Buildings>
```

记录错误五：替代市政广场的特色建筑不加总督点数

实现加总督点数的Modifier应该使用MODIFIER_PLAYER_ADJUST_GOVERNOR_POINTS，然后将它注册到DistrictModifiers中，而非仿照官方实现市政广场加总督点数的做法：使用MODIFIER_ALL_PLAYERS_ADJUST_GOVERNOR_POINTS，然后注册到GameModifiers，原因未知。这对于市政广场中的特色建筑也是同理。
```xml
<!--正确写法-->
	<Modifiers>
		<Row>
			<ModifierId>BLACK_KNIGHTS_COMMAND_GRANT_PLAYER_GOVERNOR_POINTS</ModifierId>
			<ModifierType>MODIFIER_PLAYER_ADJUST_GOVERNOR_POINTS</ModifierType>
		</Row>
	</Modifiers>
		<ModifierArguments>
		<Row>
			<ModifierId>BLACK_KNIGHTS_COMMAND_GRANT_PLAYER_GOVERNOR_POINTS</ModifierId>
			<Name>Delta</Name>
			<Value>1</Value>
		</Row>
	</ModifierArguments>
	<!--将Modifier注册到建筑-->
	<DistrictModifiers>
			<DistrictType>DISTRICT_BLACK_KNIGHTS_COMMAND</DistrictType>
			<ModifierId>BLACK_KNIGHTS_COMMAND_GRANT_PLAYER_GOVERNOR_POINTS</ModifierId>
		</Row>
	</DistrictModifiers>
```