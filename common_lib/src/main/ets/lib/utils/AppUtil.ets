import { bundleManager, common, Want } from '@kit.AbilityKit';
import window from '@ohos.window';
import { BusinessError } from '@kit.BasicServicesKit';
import App from '@system.app';
import { call } from '@kit.TelephonyKit';
import { camera, cameraPicker } from '@kit.CameraKit';

/**
 * APP信息相关工具类，依赖UIAbilityContext，需要初始化。
 * 在UIAbility的onWindowStageCreate方法中调用init方法初始化
 */
export class AppUtil {
  private static context: common.UIAbilityContext
  private static windowStage: window.WindowStage

  static init(context: common.UIAbilityContext, windowStage: window.WindowStage) {
    AppUtil.context = context;
    AppUtil.windowStage = windowStage;
  }

  /**
   * 拉起设置应用的主界面
   */
  static startSettingsAbility(context: common.UIAbilityContext) {
    if (!context) {
      context = AppUtil.context
    }
    let want: Want = {
      bundleName: 'com.huawei.hmos.settings',
      abilityName: 'com.huawei.hmos.settings.MainAbility'
    };
    context.startAbility(want).then(() => {
      console.info('Start settings ability successfully.');
    }).catch((err: BusinessError) => {
      console.error(`Failed to startAbility. Code: ${err.code}, message: ${err.message}`);
    });
  }

  /**
   * 拉起设置应用的权限设置页面
   */
  static startPermissionAbility(bundleName: string) {
    if (!bundleName) {
      bundleName = "com.yanftch.commonutils"
    }
    AppUtil.context.startAbility({
      bundleName: 'com.huawei.hmos.settings',
      abilityName: 'com.huawei.hmos.settings.MainAbility',
      uri: 'application_info_entry',
      parameters: {
        pushParams: bundleName
      }
    });
  }

  // wifi
  public static wifi_entry = "wifi_entry"
  // 拉蓝牙
  public static bluetooth_entry = "bluetooth_entry"
  // NFC页
  public static nfc_settings = "nfc_settings"
  // 通知和状态栏
  public static systemui_notification_settings = "systemui_notification_settings"
  // 关于本机界面
  public static about_device = "about_device"

  /**
   * 拉起设置应用的常用界面
   */
  static startSettingsAbilityFor(context: common.UIAbilityContext, uri: string) {
    if (!context) {
      context = AppUtil.context
    }
    let want: Want = {
      bundleName: 'com.huawei.hmos.settings',
      abilityName: 'com.huawei.hmos.settings.MainAbility',
      // 根据”设置”应用配置的界面信息，选择不同的uri
      uri: uri,

    };
    context.startAbility(want).then(() => {
      console.info('Start settings ability successfully.');
    }).catch((err: BusinessError) => {
      console.error(`Failed to startAbility. Code: ${err.code}, message: ${err.message}`);
    });
  }

  /**
   * 拉起wifi设置页面
   */
  static startSettingsAbilityForWifi() {
    AppUtil.startSettingsAbilityFor(AppUtil.context, AppUtil.wifi_entry)
  }

  /**
   * 拉起蓝牙设置页面
   */
  static startSettingsAbilityForBlueTooth() {
    AppUtil.startSettingsAbilityFor(AppUtil.context, AppUtil.bluetooth_entry)
  }

  /**
   * 拉起NFC页面
   */
  static startSettingsAbilityForNFC() {
    AppUtil.startSettingsAbilityFor(AppUtil.context, AppUtil.nfc_settings)
  }

  /**
   * 拉起通知和状态栏
   */
  static startSettingsAbilityForNotify() {
    AppUtil.startSettingsAbilityFor(AppUtil.context, AppUtil.systemui_notification_settings)
  }

  /**
   * 拉起关于本机界面
   */
  static startSettingsAbilityForDevice() {
    AppUtil.startSettingsAbilityFor(AppUtil.context, AppUtil.about_device)
  }

  /**
   * 拉起短信界面
   */
  static startMMSAbility(userName: string, phone: string): void {
    let contactInfo: Array<ModelContactInfo> = [{
      contactsName: userName,
      telephone: phone
    }];
    let want: Want = {
      bundleName: 'com.ohos.mms',
      abilityName: 'com.ohos.mms.MainAbility',
      parameters: {
        contactObjects: JSON.stringify(contactInfo),
        pageFlag: 'conversation'
      }
    };
    AppUtil.context.startAbility(want).then(() => {
      console.info('Start MMSAbility successfully.');
    }).catch((err: BusinessError) => {
      console.error(`Failed to startAbility. Code: ${err.code}, message: ${err.message}`);
    });
  }

  /**
   * 拉起拨号界面
   */
  static startCallAbility(phone: string) {
    let isSupport = call.hasVoiceCapability();
    if (!isSupport) {
      console.error('Not support voice capability.');
    }
    call.makeCall(phone, (err: BusinessError) => {
      if (err) {
        console.error(`Failed to make call. Code is ${err.code}, Message is ${err.message}`);
        return;
      }
      console.info('Succeeded in making call.');
    })
  }

  /**
   * 拉起浏览器应用
   */
  static startBrowsableAbility(url: string) {
    let want: Want = {
      action: 'ohos.want.action.viewData',
      entities: ['entity.system.browsable'],
      uri: url
    };
    AppUtil.context.startAbility(want)
      .then(() => {
        console.error('Start browsableAbility successfully.');
      })
      .catch((err: BusinessError) => {
        console.error(`Failed to startAbility. Code: ${err.code}, message: ${err.message}`);
      });
  }

  /**
   * 拉起应用市场界面
   */
  static startAppStoreDetailAbility(bundleName: string) {
    let want: Want = {
      action: 'ohos.want.action.appdetail',
      uri: 'store://appgallery.huawei.com/app/detail?id=' + 'C' + bundleName,
    };
    AppUtil.context.startAbility(want).then(() => {
      console.error('Start Ability successfully.');
    }).catch((err: BusinessError) => {
      console.error(`Failed to startAbility. Code: ${err.code}, message: ${err.message}`);
    });
  }

  /**
   * 拉起相机界面
   */
  static async startCameraPicker() {
    try {
      let pickerProfile: cameraPicker.PickerProfile = {
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_BACK
      };
      let pickerResult: cameraPicker.PickerResult = await cameraPicker.pick(AppUtil.context,
        [cameraPicker.PickerMediaType.PHOTO, cameraPicker.PickerMediaType.VIDEO], pickerProfile);
      console.log("the pick pickerResult is:" + JSON.stringify(pickerResult));
    } catch (error) {
      let err = error as BusinessError;
      console.error(`the pick call failed. error code: ${err.code}`);
    }
  }

  /**
   * 获取应用版本号
   */
  static async getAppVersionCode(): Promise<number> {
    let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
    let bundleInfo = await bundleManager.getBundleInfoForSelf(bundleFlags)
    let versionCode = bundleInfo.versionCode
    console.log("debug_AppUtil: versionCode=" + versionCode)
    return new Promise(resolve => {
      resolve(versionCode)
    })
  }

  /**
   * 获取应用版本名
   */
  static async getAppVersionName(): Promise<string> {
    let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
    let bundleInfo = await bundleManager.getBundleInfoForSelf(bundleFlags)
    let versionName = bundleInfo.versionName
    console.log("debug_AppUtil: versionName=" + versionName)
    return new Promise(resolve => {
      resolve(versionName)
    })
  }

  /**
   * 获取应用bundleName
   */
  static async getAppBundleName(): Promise<string> {
    let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
    let bundleInfo = await bundleManager.getBundleInfoForSelf(bundleFlags)
    let bundleName = bundleInfo.name
    console.log("debug_AppUtil: bundleName=" + bundleName)
    return new Promise(resolve => {
      resolve(bundleName)
    })
  }
}

interface ModelContactInfo {
  contactsName: string;
  telephone: string;
}