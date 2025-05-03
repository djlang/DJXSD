import { AdvertClass, UserSettingClass } from 'basic'
import { window } from '@kit.ArkUI'

@Entry
@Component
struct Start {
  // @State adObj: AdvertClass = {
  //   adTime: 5,
  //   showAd: false,
  //   adImage: $r("app.media.start")
  // }
  @State adObj: AdvertClass = {} as AdvertClass
  @State timer: number = -1

  aboutToAppear(): void {
    const setting = new UserSettingClass(getContext())
    this.adObj = setting.getUserAd() as AdvertClass

    this.countDown()
  }

  countDown() {
   this.timer = setInterval(() => {
      if (this.adObj.adTime === 0) {
        clearInterval(this.timer)
        this.closeWin()
        return
      }
      this.adObj.adTime--
    },1000)

  }
  closeWin(){
    window.findWindow("ad_window").destroyWindow()
  }


  aboutToDisappear(): void {
    clearInterval(this.timer)
  }

  build() {
    Stack({alignContent: Alignment.TopEnd}){
      Image($r('app.media.start')).objectFit(ImageFit.Cover)
      Text( this.adObj.adTime + '秒后跳过')
        .padding(8)
        .fontSize(14)
        .height(30)
        .borderRadius(15)
        .backgroundColor($r('app.color.background_page'))
        .margin({right: 14,top: 20})
        .onClick(() => {
          this.closeWin()
        })

    }
    .height('100%')
    .width('100%')
  }
}