import { Http } from "basic"
import { AccountFormModel } from "../models/User";


export const loginApi = (data: AccountFormModel): Promise<string> => {
  return Http.post<string>("/login/account", data);
}