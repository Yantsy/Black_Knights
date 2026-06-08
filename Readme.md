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