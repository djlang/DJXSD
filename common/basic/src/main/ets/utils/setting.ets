
//封装方法
import { preferences } from "@kit.ArkData";
import { AdvertClass } from "../models/Advert";
import { JSON } from "@kit.ArkTS";
import { TOKEN_KEY, XSD_SETTING, XSD_SETTING_AD } from "../constants";


export const defaultAd: AdvertClass = {
  adTime : 1,
  showAd: true,
  adImage: $r('app.media.start')
}


// 存储数据

// 获取

export class UserSettingClass {
  // 首选项---> 仓库
  context: Context
  constructor(context: Context) {
    this.context = context

  }
  //创建仓库
  getStore(){
    return preferences.getPreferencesSync(this.context, {name: XSD_SETTING})
  }
  //存储广告页数据
  setUserAd(ad: AdvertClass) {
    const store = this.getStore()
    //存储数据
    store.putSync(XSD_SETTING_AD,JSON.stringify(ad))
    //写入磁盘
    store.flush()
  }

  //获取数据
  getUserAd() {
    //获取仓库
    const store = this.getStore()
    //获取广告数据
    return JSON.parse(store.getSync(XSD_SETTING_AD, JSON.stringify(defaultAd)) as string)
  }

  setUserToken(token: string) {
    const store = this.getStore()
    //存储数据
    store.putSync(TOKEN_KEY,JSON.stringify(token))
    //写入磁盘
    store.flush()

  }

  getUserToken(): string{
    const store = this.getStore()
    return store.getSync(TOKEN_KEY, "") as string
  }

}