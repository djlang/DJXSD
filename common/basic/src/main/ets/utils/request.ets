
import axios, {AxiosError, AxiosResponse, InternalAxiosRequestConfig} from '@ohos/axios';
import { data } from '@kit.TelephonyKit';
import { BASE_URL } from '../constants';

//创建实例对象
const  service = axios.create({
  baseURL: BASE_URL, //"https://slwl-api.itheima.net/driver",
  timeout: 10000,
})

//创建请求拦截器
service.interceptors.request.use((config: InternalAxiosRequestConfig) => {
  return config;
}, (error: AxiosError) => {
  return Promise.reject(error);
});

//创建响应拦截器
service.interceptors.response.use((response:AxiosResponse) => {
  if (response.status === 200 && response.data.code === 200){
    return response.data.data
  }

},(error:AxiosError) => {
  return Promise.reject(error)
})

class Http {

  static get<T>(url: string, params?: object) {
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