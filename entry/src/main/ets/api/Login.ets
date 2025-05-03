import { Http } from "basic"
import { AccountFormModel, UserInfoModel } from "../models/User";


export const loginApi = (data: AccountFormModel): Promise<string> => {
  return Http.post<string>("/login/account", data);
}

export const getUerInfoApi = ():Promise<UserInfoModel> => {
  return Http.get<UserInfoModel>("/users")
}