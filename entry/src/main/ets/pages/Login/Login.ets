import { AccountFormModel } from '../../models/User';
import { JSON } from '@kit.ArkTS';

@Entry
@Component
struct Login {
  @Styles
  inputStyle() {
    .backgroundColor(Color.White)
    .height(58)
    .border({width: {bottom: 1},color: $r("app.color.background_divider")})
    .borderRadius(0)
  }


  @State message: string = 'Hello World';
  @State accountForm: AccountFormModel = {
    account: "",
    password: ""
  }

  submitLogin() {
    AlertDialog.show({
      message: JSON.stringify(this.accountForm)
    })

  }

  getFormValidate() {
    if (this.accountForm.account && this.accountForm.password) {
      return true
    }else{
      return false
    }

  }
  build() {
    Column(){
      Text('小稍等')
        .height(28)
        .fontSize(18)
        .fontColor($r('app.color.text_primary'))
        .fontWeight(FontWeight.Bold)
        .margin({top: 20})
      Row(){
        Text('账号登录')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
        Row(){
          Text('手机号登录')
            .fontSize(18)
            .fontColor($r("app.color.primary"))
          Image($r("app.media.ic_angle"))
            .width(10).height(10)
        }
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({top: 30,bottom: 30})
      TextInput({placeholder: "请输入账号", text: $$this.accountForm.account})
        .inputStyle()

      TextInput({placeholder: "请输入密码", text: $$this.accountForm.password})
        .type(InputType.Password)
        .inputStyle()

      Button("登录").onClick(() => {
        this.submitLogin()

      })
        .backgroundColor(this.getFormValidate() ? $r("app.color.primary") : $r("app.color.primary_disabled"))
        .margin({top: 50})
        .width("90%")
        .enabled(this.getFormValidate())
    }
    .height('100%')
    .width('100%')
    .padding({right: 30, left: 30})

  }
}