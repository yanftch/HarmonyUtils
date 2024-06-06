import { ClassBean } from '../bean/ClassBean';
import { FunctionBean } from '../bean/FunctionBean';
import Constants from '../Constants';
import ClassNameView from '../view/ClassNameView';
import FunctionNameView from '../view/FunctionNameView';
import ClassNameViewModel from '../viewmodel/ClassNameViewModel';
import { promptAction } from '@kit.ArkUI';
import { AppUtil } from 'common_lib/Index';

@Entry
@Component
struct IndexPage {
  // 列表数据源
  private list: Array<ClassBean> = new Array()
  // class当前选中的ID
  @State currentClassNameId: number = 0
  private classNameScroller: Scroller = new Scroller();
  private functionNameScroller: Scroller = new Scroller();
  @State message: string = "验证方法"

  aboutToAppear(): void {
    this.list = ClassNameViewModel.getData()
    console.log("debug_IndexPage: list.length = " + this.list.length)
  }

  /**
   * 切换事件
   */
  changeClassName(index: number, isClassName: boolean) {
    console.log("debug_IndexPage:changeClassName => index=" + index + ", currentClassNameId=" + this.currentClassNameId + ", isClassName=" + isClassName)
    if (this.currentClassNameId !== index) {
      this.currentClassNameId = index
      if (isClassName) {
        this.functionNameScroller.scrollToIndex(index)
      } else {
        this.classNameScroller.scrollToIndex(index)
      }
    }
  }

  async aFunc() {
    let name = await AppUtil.getAppBundleName()
    console.log("debug_IndexPage: name = " + name)
    this.message = name + ""
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .onClick(() => {
            this.aFunc()
        })
      Row() {
        // className
        List({ scroller: this.classNameScroller }) {
          ForEach(this.list, (item: ClassBean, index: number) => {
            ClassNameView({
              className: item.className, isSelected: this.currentClassNameId === index,
              onItemClick: () => {
                this.changeClassName(index, true)
              }
            })

          }, (item: ClassBean) => item.className + ":" + this.currentClassNameId)
        }
        .scrollBar(BarState.Off)
        .backgroundColor($r('app.color.color_0D182431'))
        .height(Constants.FULL_PERCENT)
        .width('40%')

        // functionName
        List({ scroller: this.functionNameScroller }) {
          ForEach(this.list, (item: ClassBean) => {
            ListItemGroup({ header: this.ClassNameHeader(item.className), space: 6 }) {
              ForEach(item.functionNameList, (funItem: FunctionBean, index: number) => {
                ListItem() {
                  FunctionNameView({
                    functionNameBeanString: JSON.stringify(funItem), onItemClick: () => {
                      import('common_lib').then((ns: ESObject) => {
                        try {
                          let className: string | undefined = item.className
                          let functionName: string | undefined = funItem.functionName
                          if (className && functionName) {
                            let result: object = ns[className][functionName]()
                            let toastMessage: string | undefined = funItem.toastMessage
                            console.log("debug_IndexPage: functionName ItemClick = " + result)
                            if (toastMessage) {
                              promptAction.showToast({ message: "执行结果：[" + toastMessage + "] => " + result })
                            } else {
                              promptAction.showToast({ message: "执行结果：" + result })
                            }
                          }
                        } catch (e) {
                          console.log("debug_Index: e = " + JSON.stringify(e))
                        }
                      });
                    }
                  })
                }
              }, (funcItem: FunctionBean) => `${funcItem.id}`)
            }
          }, (item: ClassBean) => `${item.id}`)
        }
        .sticky(StickyStyle.Header)
        .onScrollIndex((index: number) => this.changeClassName(index, false))
        .scrollBar(BarState.Off)
        .height(Constants.FULL_PERCENT)
        .width('60%')
      }
    }
    .backgroundColor($r("app.color.color_0D182431"))
    .width(Constants.FULL_PERCENT)
    .height(Constants.FULL_PERCENT)
  }

  /**
   * 分组的标题
   */
  @Builder
  ClassNameHeader(name: string) {
    Row() {
      Text(name)
        .fontSize($r('app.float.fp_24'))
        .fontColor($r('app.color.ct1_85'))
        .fontWeight(FontWeight.Medium)
    }
    .padding({ left: $r('app.float.vp_10') })
    .height($r('app.float.vp_40'))
    .backgroundColor($r("app.color.ct1_40"))
    .width(Constants.FULL_PERCENT)
  }
}