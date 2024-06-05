import { DateUtil } from '../utils/DateUtil';

@Preview
@Component
export struct MainPage {
  @State message: string = 'Hello World';
  @State message2: string = ' ';
  @State message3: string = ' ';

  aboutToAppear(): void {
    let current: Date = new Date()
    this.message = DateUtil.formatTimestamp(current.getTime(), "yyyy-MM-dd")
    this.message2 = DateUtil.formatTimestamp(current.getTime(), "yyyy-MM-dd HH:mm:ss")

  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(20)
          .margin({ top: 10 })
        Text(this.message2)
          .fontSize(20)
          .margin({ top: 10 })
        Text(this.message3)
          .fontSize(20)
          .margin({ top: 10 })
      }
      .width('100%')
    }
    .height('100%')
  }
}
