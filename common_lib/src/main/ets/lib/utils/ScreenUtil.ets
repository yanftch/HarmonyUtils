/**
 * Author : yanfeng
 * Desc : 屏幕相关工具类
 */
import { display } from '@kit.ArkUI'

export class ScreenUtil {
  /**
   * 获取屏幕宽度
   */
  static getScreenWidth(): number {
    return display.getDefaultDisplaySync().width
  }

  /**
   * 获取屏幕高度
   */
  static getScreenHeight(): number {
    return display.getDefaultDisplaySync().height
  }

  /**
   * 获取屏幕是否是竖屏
   */
  static isScreenPortrait(): boolean {
    return display.Orientation.PORTRAIT == display.getDefaultDisplaySync().orientation
  }

  /**
   * 获取屏幕是否是横屏
   */
  static isScreenLandscape(): boolean {
    return display.Orientation.LANDSCAPE == display.getDefaultDisplaySync().orientation
  }

  /**
   * 是否可折叠设备
   */
  static isFoldable(): boolean {
    return display.isFoldable();
  }

  /**
   * 获取挖孔屏、刘海屏、瀑布屏等不可用屏幕区域信息。使用callback异步回调。建议应用布局规避该区域。
   */
  static async getCutoutRect(): Promise<display.Rect> {
    let cutoutInfo = await display.getDefaultDisplaySync().getCutoutInfo()
    return cutoutInfo.boundingRects[0]
  }

  /**
   * 接上：不可用部分的高度
   */
  static async getCutoutRectHeight(): Promise<number> {
    let cutoutInfo = await display.getDefaultDisplaySync().getCutoutInfo()
    if (cutoutInfo.boundingRects[0]) {
      return cutoutInfo.boundingRects[0].height
    }
    return 0
  }
}
 