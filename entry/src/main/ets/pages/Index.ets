import { DateUtil } from 'common_lib'
import { HomeListItemBean } from '../bean/HomeListItemBean';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State message: string = 'test';
  private list: Array<HomeListItemBean> = new Array()

  aboutToAppear(): void {
    this.list.push(new HomeListItemBean("DateUtil.getToday()").append({
      className: "DateUtil",
      functionName: "getToday"
    }))
    this.list.push(new HomeListItemBean("DateUtil.getTimestamp()").append({
      className: "DateUtil",
      functionName: "getTimestamp"
    }))
    this.list.push(new HomeListItemBean("DateUtil.getMonth()").append({
      className: "DateUtil",
      functionName: "getMonth"
    }))
    this.list.push(new HomeListItemBean("DateUtil.getYear()").append({
      className: "DateUtil",
      functionName: "getYear"
    }))
    this.list.push(new HomeListItemBean("DateUtil.getDayOfMonth()").append({
      className: "DateUtil",
      functionName: "getDayOfMonth"
    }))
    this.list.push(new HomeListItemBean("DateUtil.getDayOfWeek()").append({
      className: "DateUtil",
      functionName: "getDayOfWeek"
    }))
  }

  build() {
    Row() {
      Column() {
        List() {
          ForEach(this.list, (item: HomeListItemBean, index: number) => {
            ListItem() {
              Text(item.title)
                .width('100%')
                .fontSize($r('app.float.fp_16'))
                .fontColor(Color.Black)
                .padding({
                  left: $r('app.float.vp_16'),
                  right: $r('app.float.vp_16'),
                  top: $r('app.float.vp_6'),
                  bottom: $r('app.float.vp_6')
                })
                .onClick(() => {
                  import('common_lib').then((ns: ESObject) => {
                    try {
                      let className: string | undefined = item.className
                      let functionName: string | undefined = item.functionName
                      if (className && functionName) {
                        let result: object = ns[className][functionName]()
                        console.log("debug_Index: today111111 = " + result)
                        promptAction.showToast({ message: "执行结果：" + result })
                      }
                    } catch (e) {
                      console.log("debug_Index: e" + JSON.stringify(e))
                    }
                  });
                })
            }
          }, (item: HomeListItemBean, index: number) => JSON.stringify(item) + ":" + index)
        }
        .listDirection(Axis.Vertical)
        .scrollBar(BarState.Off)
        .width('100%')
        .height('100%')
      }
      .width('100%')
    }
    .height('100%')
  }
}