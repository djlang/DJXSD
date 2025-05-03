import { CommonNavbar } from 'basic'

@Entry
@Component
struct CarInfo {

  build() {
    Column() {
      CommonNavbar({title: "车辆信息"})
      Column(){
        Image($r("app.media.big_car"))
          .width('100%')
          .height(150)
          .backgroundImageSize(ImageSize.Auto)
          .borderRadius(8)
        InfoDetail()
        .backgroundColor($r('app.color.white'))
        .borderRadius(8)
        .margin({top: 15})
      }
      .margin({top: 15,left: 15,right: 15})

    }
    .backgroundColor($r('app.color.background_page'))
    .height('100%')
    .width('100%')
  }
}

@Component
struct InfoDetail {
  build() {
    Column(){
      InfoItem({title: '车辆信息',number: '000000000'})
      InfoItem({title: '车牌号',number: '粤A12345'})
      InfoItem({title: '车型',number: '厢式货车'})
      InfoItem({title: '所属机构',number: '广东中转站'})
      InfoItem({title: '载重',number: '2.7吨'})
    }

  }
}

@Component
struct InfoItem {
  title: string = ''
  number: string = ''
  build() {
    Row(){
      Text(this.title)
        .fontSize(15)
        .fontColor($r('app.color.text_secondary'))
      Text(this.number)
        .fontSize(15)
        .fontColor($r('app.color.text_primary'))
    }
    .padding({left: 10,right: 10})
    .height(44)
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}