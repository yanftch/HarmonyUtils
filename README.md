在Harmony开发过程中，需要用到许多工具类，如与系统交互、获取基本信息等等，为了方便查找和快速使用，因此整理了如下工具类集合
便于快速开发鸿蒙应用~


源码地址：https://github.com/yanftch/common-utils


# 整体介绍


| 模块         | 描述                        |
|------------|---------------------------|
| AppUtil    | APP基础配置工具，如跳转系统设置页面等      |
| DateUtil   | 日期对象相关操作，比如格式转换、获取时间等     |
|            |                           |
|            |                           |
|            |                           |
|            |                           |
|            |                           |
|            |                           |
|            |                           |
| ScreenUtil | 屏幕数据获取相关，比如屏幕宽/高、状态栏高度获取等 |

# 功能模块具体明细

## AppUtil

| 方法                                                                      | 作用            |
|-------------------------------------------------------------------------|---------------|
| init(context: common.UIAbilityContext, windowStage: window.WindowStage) | 全局初始化         |
| startSettingsAbility(context: common.UIAbilityContext)                  | 拉起设置应用的主界面    |
| startPermissionAbility(bundleName: string)                              | 拉起设置应用的权限设置页面 |
| startSettingsAbilityFor(context: common.UIAbilityContext, uri: string)  | 拉起设置应用的常用界面   |
| startSettingsAbilityForWifi                                             | 拉起wifi设置页面    |
| startSettingsAbilityForBlueTooth                                        | 拉起蓝牙设置页面      |
| startSettingsAbilityForNFC                                              | 拉起NFC页面       |
| startSettingsAbilityForNotify                                           | 拉起通知和状态栏      |
| startSettingsAbilityForDevice                                           | 拉起关于本机界面      |
| startMMSAbility(userName: string, phone: string)                        | 拉起短信界面        |
| startCallAbility(phone: string)                                         | 拉起拨号界面        |
| startBrowsableAbility(url: string)                                      | 拉起浏览器应用       |
| startAppStoreDetailAbility(bundleName: string)                          | 拉起应用市场界面      |
| startCameraPicker                                                       | 拉起相机界面        |

## DateUtil

| 方法                                                 | 作用                                   |
|----------------------------------------------------|--------------------------------------|
| getToday()                                         | 获取当前日期                               |
| getTimestamp()                                     | 获取当前时间戳(单位：ms)                       |
| getMonth()                                         | 获取当前月份                               |
| getYear()                                          | 获取当前年份                               |
| getDayOfMonth()                                    | 获取当前日期(当前月中的第几天)                     |
| getDayOfWeek()                                     | 获取当前日期(当周中的第几天)                      |
| formatTimestamp(timestamp: number, format: string) | 将时间戳格式化为指定字符串格式,例如格式化为 yyyy-MM-dd 格式 |
| formatDate(date: Date, format: string)             | 将Date对象格式化为字符串                       |
| changeStr2Timestamp(dateString: string)            | 将字符串格式转换成时间戳                         |
| changeStr2Date(dateString: string)                 | 将字符串格式转换成Date对象                      |

## ScreenUtil

| 方法                    | 作用                      |
|-----------------------|-------------------------|
| getScreenWidth()      | 获取屏幕宽度                  |
| getScreenHeight()     | 获取屏幕高度                  |
| isScreenPortrait()    | 获取屏幕是否是竖屏               |
| isScreenLandscape()   | 获取屏幕是否是横屏               |
| isFoldable()          | 是否可折叠设备                 |
| getCutoutRect()       | 获取挖孔屏、刘海屏、瀑布屏等不可用屏幕区域信息 |
| getCutoutRectHeight() | 接上：不可用部分的高度             |

