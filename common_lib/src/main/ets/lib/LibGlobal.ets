/**
 * 全局初始化，需要在UIAbility的onWindowStageCreate方法中调用LibGlobal的init方法初始化
 */
import { common } from '@kit.AbilityKit'

export class LibGlobal {
  private static context: common.UIAbilityContext

  private constructor() {
  }

  private static instance: LibGlobal

  public static getInstance() {
    if (!LibGlobal.instance) {
      LibGlobal.instance = new LibGlobal()
    }
    return LibGlobal.instance
  }

  public init(context: common.UIAbilityContext) {
    LibGlobal.context = context
  }
}
 