import { AdvertClass } from 'basic'

@Entry
@Component
struct Start {
  @State adObj: AdvertClass = {
    adTime: 5,
    showAd: false
  }
  @State timer: number = -1

  aboutToAppear(): void {
    this.countDown()

  }

  countDown() {
   this.timer = setInterval(() => {
      if (this.adObj.adTime === 0) {
        clearInterval(this.timer)
        return
      }
      this.adObj.adTime--
    },1000)

  }

  aboutToDisappear(): void {
    clearInterval(this.timer)
  }

  build() {
    Stack({alignContent: Alignment.TopEnd}){
      Image($r('app.media.start')).objectFit(ImageFit.Cover)
      Text(this.adObj.adTime + '秒后跳过')
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