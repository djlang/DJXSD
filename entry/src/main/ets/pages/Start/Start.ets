@Entry
@Component
struct Start {
  @State message: string = 'Hello World';

  build() {
    Stack({alignContent: Alignment.TopEnd}){
      Image($r('app.media.start')).objectFit(ImageFit.Cover)
      Text('5秒后跳过')
        .padding(8)
        .fontSize(14)
        .height(30)
        .borderRadius(15)
        .backgroundColor($r('app.color.background_page'))
        .margin({right: 14})
    }
    .height('100%')
    .width('100%')
  }
}