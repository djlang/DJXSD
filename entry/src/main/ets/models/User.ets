//登录接口请求参数
export interface AccountFormModel {
  /**
   * 登录账号
   */
  account: string;
  /**
   * 登录密码
   */
  password: string;

}

//用户信息返回数据类型
export interface UserInfoModel {
  avatar: string;
  name: string;
  number: string;
  phone: string;
}
