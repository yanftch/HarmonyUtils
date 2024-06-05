import Constants from '../Constants'

@Preview
@Component
export default struct ClassNameView {
  className?: string = "111"
  @Prop isSelected: boolean = false
  onItemClick = () => {
  }

  build() {
    Row() {
      Text(this.className)
        .fontSize($r('app.float.fp_16'))
        .textAlign(TextAlign.Start)
        .width(Constants.FULL_PERCENT)
        .fontColor(this.isSelected ? $r("app.color.ct1_85") : $r("app.color.ct1_60"))
        .onClick(this.onItemClick)
    }
    .backgroundColor(this.isSelected ? Color.White : $r("app.color.color_F1F3F5"))
    .height($r('app.float.vp_40'))
    .padding({left: $r("app.float.vp_10")})
    .width(Constants.FULL_PERCENT)
  }
}
 