@Component
export struct CommonNavbar {
  @Prop title: string = "默认标题"; // 导航栏标题，默认值为“默认标题”
  // @Prop onBack?: () => void; // 返回按钮的点击事件处理函数（可选）
  @Prop rightActionText?: string; // 右侧操作按钮的文字内容（可选）
  @Prop onRightActionClick?: () => void; // 右侧操作按钮的点击事件处理函数（可选）

  build() {
    Row() {
      // 左侧返回按钮
      Image($r("app.media.ic_btn_nav_back")) // 返回图标
        .width(30).height(30)
        .margin({ right: 16 })


      // 中间标题
      Text(this.title)
        .fontSize(16)
        .fontColor($r('app.color.text_primary'))
        .fontWeight(600)
        .margin({ left: 16, right: 16 })
        .textAlign(TextAlign.Center)
        .layoutWeight(1)
    }
    .height(54) // 导航栏高度
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(Color.White) // 背景色
    .border({ width: 1, color: $r("app.color.background_page") }) // 底部边框
  }
}