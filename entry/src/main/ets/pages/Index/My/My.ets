import { MyInfoClass } from "basic"
import IcardItem from "basic/src/main/ets/components/IcardItem"
import { getUerInfoApi } from "../../../api"
import { UserInfoModel } from "../../../models/User"
import router from "@ohos.router"

@Entry
@Component
export default struct My {
  @State userInfo: UserInfoModel = {} as UserInfoModel

  aboutToAppear(): void {
    this.getUserInfo()
  }

   async getUserInfo() {
    try {
      this.userInfo = await getUerInfoApi()
      AlertDialog.show({
        message: JSON.stringify(this.userInfo)
      })

    } catch (e) {
      console.log('error',e)
    }
  }
  build() {
    Column() {
      Column() {
        Image(this.userInfo.avatar)
          .height(68).width(68).borderRadius(34)
        Text(this.userInfo.name)
          .fontSize(16)
          .fontWeight(400)
          .lineHeight(20)
          .margin({ top: 20, bottom: 10 })
          .fontColor($r("app.color.white"))
        Text(`司机编号:${this.userInfo.number}`)
          .fontSize(14)
          .fontWeight(200)
          .lineHeight(20)
          .margin({ bottom: 10 })
          .fontColor($r("app.color.white"))
        Text(`手机号: ${this.userInfo.phone}`)
          .fontSize(14)
          .fontWeight(200)
          .lineHeight(20)
          .fontColor($r("app.color.white"))
      }
      .backgroundImage($r("app.media.bg_page_my"))
      .height(258)
      .width('100%')
      .backgroundImageSize(ImageSize.Cover)
      .justifyContent(FlexAlign.Center)
      .margin({ bottom: -25 })

      MyTaskDate()
      ListView()

    }
    .backgroundColor($r("app.color.background_page"))
    .align(Alignment.Top)
    .height('100%').width("100%")
  }
}


@Component
struct MyTaskDate {
  build() {
    Column() {
      Text('- 本月任务 -')
        .fontSize(16)
        .margin({ bottom: 8 })
        .fontColor($r("app.color.text_secondary"))
      Row({ space: 15 }) {
        DetailView({ num: "18", title: "任务总量" })
        DetailView({ num: "16", title: "完成务量" })
        DetailView({ num: "398", title: "运输里程(km)" })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)
    }
    .height(115)
    .margin({right: 15, left: 15, bottom: 15})
    .padding(15)
    .backgroundColor(Color.White)
    .borderRadius(8)
  }
}

@Component
struct DetailView {
  @Prop num: string = ''
  @Prop title: string = ''

  build() {
    Column() {
      Text(this.num)
        .fontSize(18)
        .fontColor($r("app.color.text_primary"))
        .lineHeight(25)
        .margin({top:10,bottom:12})
      Text(this.title)
        .fontSize(16)
        .fontColor($r("app.color.text_primary"))
    }
  }
}

@Component
struct ListView {
  build() {
    Column(){
      IcardItem({title: "车辆信息",onClickItem(){router.pushUrl({url:'pages/Index/My/CarInfo'})}})
      IcardItem({title: "任务数据"})
      IcardItem({title: "系统设置",isShowBottom: false,onClickItem(){
        router.pushUrl({url: 'pages/Index/My/SettingPage'})
      }})
    }
    .margin({right: 15, left: 15})
    .padding({right: 18, left: 18})
    .backgroundColor($r("app.color.white"))
    .borderRadius(8)
  }
}



