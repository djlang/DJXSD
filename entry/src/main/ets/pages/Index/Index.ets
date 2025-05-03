import { TabsClass } from 'basic';
import Message from './Message/Message';
import My from './My/My';
import Task from './Task/Task';

@Entry
@Component
struct Index {
  @State tabsData: TabsClass[] = [
    {
      title: "首页",
      icon: $r("app.media.ic_tab_btn_task"),
      name: "task"
    },
    {
      title: "消息",
      icon: $r("app.media.ic_tab_btn_mess_nor"),
      name: "message"
    },
    {
      title: "我的",
      icon: $r("app.media.ic_tab_btn_mine_nor"),
      name: "my"
    }
  ]
  @State currentIndex: number = 0
  @Builder
  getTabBarStyle(item: TabsClass) {
    Column(){
      Image(item.icon)
        .width(20).height(20)
        .fillColor( item.name == this.tabsData[this.currentIndex].name ? $r("app.color.primary") : $r("app.color.text_secondary"))
      Text(item.title)
        .height(24)
        .fontColor(item.name == this.tabsData[this.currentIndex].name ? $r("app.color.primary") : $r("app.color.text_secondary"))
    }

  }

  build() {
    Column() {
      Tabs({barPosition: BarPosition.End, index: $$this.currentIndex}){
        ForEach( this.tabsData, (item: TabsClass) => {
          TabContent(){
            if (item.name === 'task') {
              Task()
            }else if (item.name === 'message'){
              Message()
            }else {
              My()
            }

          }.tabBar(this.getTabBarStyle(item))
        })
      }
      .animationDuration(500)
    }
    .height('100%')
    .width('100%')
  }
}

