
//封装方法
import { preferences } from "@kit.ArkData";
import { AdvertClass } from "../models/Advert";
import { JSON } from "@kit.ArkTS";

export const defaultAd: AdvertClass = {
  adTime : 6,
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
    return preferences.getPreferencesSync(this.context, {name: "setting"})
  }
  //存储广告页数据
  setUserAd(ad: AdvertClass) {
    const store = this.getStore()
    //存储数据
    store.putSync("setting_ad",JSON.stringify(ad))
    //写入磁盘
    store.flush()
  }

  //获取数据
  getUserAd() {
    //获取仓库
    const store = this.getStore()
    //获取广告数据
    return JSON.parse(store.getSync("setting_ad", JSON.stringify(defaultAd)) as string)
  }

}