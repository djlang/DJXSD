
@Component
export default struct IcardItem {
  title: string = '信息'
  imageStr: ResourceStr = $r("app.media.ic_btn_more")
  isShowImage: boolean = true
  isShowDesc: boolean = false
  isShowBottom: boolean = true
  @Prop desc: string = '描述'

  onClickItem: () => void = () => {}

  build() {
    Row(){
      Text(this.title)
        .fontSize(16)
        .fontWeight(400)
        .fontColor($r("app.color.text_primary"))
        .layoutWeight(1)
      Row(){
        if (this.isShowDesc){
          Text(this.desc)
            .fontSize(14)
            .fontWeight(400)
            .fontColor($r("app.color.text_secondary"))
        }
        if (this.isShowImage) {
          Image(this.imageStr)
            .width(25).height(25)
        }
      }

    }
    .height(50)
    .width("100%")
    .border({
      width: {
        bottom: this.isShowBottom ? 1 : 0
      },
      color: $r("app.color.background_divider")
    })
    .onClick(() => {
      this.onClickItem()
    })

  }
}