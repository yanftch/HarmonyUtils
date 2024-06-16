import { ClassBean } from '../bean/ClassBean'
import { ClassFunctionGroupBean } from '../bean/ClassFunctionGroupBean'
import { FunctionBean } from '../bean/FunctionBean'

class ClassNameViewModel {
  getData(): Array<ClassBean> {
    let resultList: Array<ClassBean> = []
    let parentId = -1
    ALL_DATA.forEach((item: ClassFunctionGroupBean) => {
      // 类名
      if (parentId !== item.parentId) {
        let classBean: ClassBean = new ClassBean(item.parentId, item.parentName, item.parentName, [])
        resultList.push(classBean)
      }
      // 方法名
      let functionBean: FunctionBean = new FunctionBean(item.parentId, item.parentName, item.childId, item.childName, item.toastMessage)
      resultList[resultList.length-1].functionNameList.push(functionBean)
      parentId = item.parentId
    })

    return resultList
  }
}

let classNameViewModel = new ClassNameViewModel()

export default classNameViewModel as ClassNameViewModel

const parentId_AppUtil = 0
const parentId_DateUtil = 1
const parentId_ScreenUtil = 2

const ALL_DATA: ClassFunctionGroupBean[] = [
  new ClassFunctionGroupBean(parentId_AppUtil, "AppUtil", 1, "startSettingsAbility", "拉起设置应用的主界面"),
  new ClassFunctionGroupBean(parentId_AppUtil, "AppUtil", 2, "startPermissionAbility", "拉起设置应用的权限设置页面"),
  new ClassFunctionGroupBean(parentId_AppUtil, "AppUtil", 3, "startSettingsAbilityForWifi", "拉起wifi设置页面"),
  new ClassFunctionGroupBean(parentId_AppUtil, "AppUtil", 4, "startSettingsAbilityForBlueTooth", "拉起蓝牙设置页面"),
  new ClassFunctionGroupBean(parentId_AppUtil, "AppUtil", 5, "startSettingsAbilityForNFC", "拉起NFC页面"),
  new ClassFunctionGroupBean(parentId_AppUtil, "AppUtil", 6, "startSettingsAbilityForNotify", "拉起通知和状态栏"),
  new ClassFunctionGroupBean(parentId_AppUtil, "AppUtil", 7, "startSettingsAbilityForDevice", "拉起关于本机界面"),
  new ClassFunctionGroupBean(parentId_AppUtil, "AppUtil", 8, "startMMSAbility", "拉起短信界面"),
  new ClassFunctionGroupBean(parentId_AppUtil, "AppUtil", 9, "startCallAbility", "拉起拨号界面"),
  new ClassFunctionGroupBean(parentId_AppUtil, "AppUtil", 10, "startBrowsableAbility", "拉起浏览器应用"),
  new ClassFunctionGroupBean(parentId_AppUtil, "AppUtil", 11, "startAppStoreDetailAbility", "拉起应用市场界面"),
  new ClassFunctionGroupBean(parentId_AppUtil, "AppUtil", 12, "startCameraPicker", "拉起相机界面"),
  new ClassFunctionGroupBean(parentId_AppUtil, "AppUtil", 13, "getAppVersionCode", "获取应用版本号"),
  new ClassFunctionGroupBean(parentId_AppUtil, "AppUtil", 14, "getAppVersionName", "获取应用版本名"),
  new ClassFunctionGroupBean(parentId_AppUtil, "AppUtil", 15, "getAppBundleName", "获取应用bundleName"),

  new ClassFunctionGroupBean(parentId_DateUtil, "DateUtil", 1, "getToday", "今日(date)"),
  new ClassFunctionGroupBean(parentId_DateUtil, "DateUtil", 2, "getTimestamp", "时间戳是"),
  new ClassFunctionGroupBean(parentId_DateUtil, "DateUtil", 3, "getYear", "当前年份是"),
  new ClassFunctionGroupBean(parentId_DateUtil, "DateUtil", 4, "getMonth", "当前月份是"),
  new ClassFunctionGroupBean(parentId_DateUtil, "DateUtil", 5, "getDayOfMonth", "当前是月份中的第几天"),
  new ClassFunctionGroupBean(parentId_DateUtil, "DateUtil", 6, "getDayOfWeek", "一周的第几天"),
  new ClassFunctionGroupBean(parentId_DateUtil, "DateUtil", 7, "getFormatDate", "时间戳格式化为字符串"),
  new ClassFunctionGroupBean(parentId_DateUtil, "DateUtil", 8, "changeStr2Timestamp", "字符串转成时间戳"),
  new ClassFunctionGroupBean(parentId_DateUtil, "DateUtil", 9, "changeStr2Date", "将字符串格式转换成Date对象"),
  new ClassFunctionGroupBean(parentId_DateUtil, "DateUtil", 10, "formatDate", "将Date对象格式化为字符串"),

  new ClassFunctionGroupBean(parentId_ScreenUtil, "ScreenUtil", 1, "getScreenWidth", "获取屏幕宽度"),
  new ClassFunctionGroupBean(parentId_ScreenUtil, "ScreenUtil", 1, "getScreenHeight", "获取屏幕高度"),
  new ClassFunctionGroupBean(parentId_ScreenUtil, "ScreenUtil", 3, "isScreenPortrait", "获取屏幕是否是竖屏"),
  new ClassFunctionGroupBean(parentId_ScreenUtil, "ScreenUtil", 4, "isScreenLandscape", "获取屏幕是否是横屏"),
  new ClassFunctionGroupBean(parentId_ScreenUtil, "ScreenUtil", 5, "isFoldable", "是否可折叠设备"),





]
 