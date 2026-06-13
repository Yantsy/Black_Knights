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