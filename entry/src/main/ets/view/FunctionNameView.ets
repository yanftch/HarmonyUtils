import { FunctionBean } from '../bean/FunctionBean'
import Constants from '../Constants'

@Component
export default struct FunctionNameView {
  @Prop functionNameBeanString: string = ""
  functionNameBean?: FunctionBean
  onItemClick = () => {
  }
  aboutToAppear(): void {
    this.functionNameBean = JSON.parse(this.functionNameBeanString)
  }

  build() {
    Row() {
      Text(this.functionNameBean?.functionName)
        .fontSize($r('app.float.fp_16'))
        .fontColor($r("app.color.ct1_60"))
        .textAlign(TextAlign.Start)
    }
    .backgroundColor(Color.White)
    .padding({ left: $r('app.float.vp_10') })
    .onClick(this.onItemClick)
    .justifyContent(FlexAlign.Start)
    .width(Constants.FULL_PERCENT)
    .height($r('app.float.vp_30'))
  }
}
 