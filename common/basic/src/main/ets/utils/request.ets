
import axios, {AxiosError, AxiosResponse, InternalAxiosRequestConfig} from '@ohos/axios';
import { BASE_URL } from '../constants';
import { UserSettingClass } from '../../../../Index';

//创建实例对象
const  service = axios.create({
  baseURL: BASE_URL, //"https://slwl-api.itheima.net/driver",
  timeout: 10000,
})

//创建请求拦截器
service.interceptors.request.use((config: InternalAxiosRequestConfig) => {

  //获取token
  const  setting = new UserSettingClass(getContext())
  const  token = setting.getUserToken()
  console.log('====>token',token)
  if (token) {
    config.headers.Authorization = token //'eyJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIxMDI0NzM4NDc2ODAyNzk5NTUzIiwiYWNjb3VudCI6Inhic2owMDEiLCJuYW1lIjoi5ZGo5LiAIiwib3JnaWQiOjEwMjQ3MDQ4NDQ0ODY3NTY2NDEsInN0YXRpb25pZCI6MTAyNDcwNzUzNTg5MTk0NDc2OSwiYWRtaW5pc3RyYXRvciI6ZmFsc2UsImV4cCI6MTc0MDE4OTMyN30.zbyyGmDQU-1X-i9PWMd8mGNZpH4Uzuh-kZHEornf6o-bVHe77kPbKXkXw2ZN1uBpVYEauSio9qSsJXymB43zAg'
  }
  console.log('====>header',config.headers)
  return config;
}, (error: AxiosError) => {
  return Promise.reject(error);
});

//创建响应拦截器
service.interceptors.response.use((response:AxiosResponse) => {
  console.log('====>status',response.status)
  if (response.status === 200 && response.data.code === 200){
    return response.data.data
  }

},(error:AxiosError) => {
  console.log('====>err',error)
  return Promise.reject(error)
})

class Http {

  static get<T>(url: string, params?: object) {
    console.log('======>进入')
    return service.get<null, T>(url, { params })
  }

  static post<T>(url: string,data?: object) {
    return  service.post<null, T>(url,data)
  }

  static put<T>(url: string,data?: object) {
    return  service.put<null, T>(url,data)
  }

  static delete<T>(url: string,data?: object) {
    return  service.delete<null, T>(url,data)
  }
}

export { Http }