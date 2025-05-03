import { CommonNavbar } from 'basic';
import { router } from '@kit.ArkUI';
import IcardItem from 'basic/src/main/ets/components/IcardItem';


@Entry
@Component
struct SettingPage {

  build() {
    Column() {
      CommonNavbar({title: '系统设置'})
      Column(){
        IcardItem({title: "换绑手机"})
        IcardItem({title: "修改密码"})
        IcardItem({title: "消息通知设置"})
        IcardItem({title: "清除缓存",isShowBottom: false})

      }
      .margin({top: 15,right: 15, left: 15})
      .padding({right: 18, left: 18})
      .backgroundColor($r("app.color.white"))
      .borderRadius(8)
      Column(){
        Text("退出")
          .height(50)
          .width('100%')
          .fontColor($r('app.color.text_primary'))
          .borderRadius(8)
          .textAlign(TextAlign.Center)
          .onClick(() => {
            router.back()
          })
      }
      .margin({top: 20,right: 15, left: 15})
      .padding({right: 18, left: 18})
      .backgroundColor($r("app.color.white"))
      .borderRadius(8)


    }
    .backgroundColor($r("app.color.background_page"))
    .height('100%')
    .width('100%')
  }
}