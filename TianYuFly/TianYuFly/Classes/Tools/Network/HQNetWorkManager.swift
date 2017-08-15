//
//  HQNetWorkManager.swift
//  HQSwiftMVVM
//
//  Created by 王红庆 on 2017/7/14.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit
import AFNetworking

enum HQHTTPMethod {
    case GET
    case POST
}

class HQNetWorkManager: AFHTTPSessionManager {
    
    static let shared = HQNetWorkManager()
//    static let shared: HQNetWorkManager = {
//        
//        let instance = HQNetWorkManager()
//        instance.responseSerializer.acceptableContentTypes?.insert("text/plain")
//        return instance
//    }()
    
    lazy var userAccount = HQUserAccount()
    
    /// 用户登录标记(计算型属性)
    var userLogon: Bool {
        return userAccount.token != nil
    }
    
    /// 带`token`的网络请求方法
    func hq_tokenRequest(method: HQHTTPMethod = .POST, routeCodeString: String, parameters: [String: AnyObject]?, completion: @escaping (_ json: Any?, _ isSuccess: Bool) -> ()) {
        
        guard let token = userAccount.token else {
            
            // 发送通知,提示用户登录
            print("没有 token 需要重新登录")
            NotificationCenter.default.post(
                name: NSNotification.Name(rawValue: HQUserShouldLoginNotification),
                object: "aaa")
            completion(nil, false)
            return
        }
        
        var parameters = parameters
        
        if parameters == nil {
            parameters = [String: AnyObject]()
        }
        
        parameters!["access_token"] = token as AnyObject
        
        hq_request(routeCodeString: routeCodeString, parameters: parameters, completion: completion)
    }
    
    /// 封装 AFN 的 GET/POST 请求
    ///
    /// - Parameters:
    ///   - method: GET/POST
    ///   - URLString: URLString
    ///   - parameters: parameters
    ///   - completion: 完成回调(json, isSuccess)
    func hq_request(method: HQHTTPMethod = .POST, routeCodeString: String, parameters: [String: AnyObject]?, completion: @escaping (_ json: Any?, _ isSuccess: Bool) -> ()) {
        
        let success = { (task: URLSessionDataTask, json: Any?)->() in
            completion(json, true)
        }
        
        let failure = { (task: URLSessionDataTask?, error: Error)->() in
            
            if (task?.response as? HTTPURLResponse)?.statusCode == 403 {
                print("token 过期了")
                
                // FIXME: 发送通知,提示用户再次登录
                NotificationCenter.default.post(
                    name: NSNotification.Name(rawValue: HQUserShouldLoginNotification),
                    object: "bad token")
            }
            
            print("网络请求错误 \(error)")
            completion(nil, false)
        }
        
        var dict = [String: AnyObject]()
        var parameters = parameters
        
        if parameters == nil {
            parameters = [String: AnyObject]()
        }
        dict = [
            "routeCode": routeCodeString as AnyObject,
            "token": "TokenIsNotLogin" as AnyObject,
            "rsaKey": "RsaKey" as AnyObject,
            "rsaCode": "RsaCode" as AnyObject,
            "isCompression": "No" as AnyObject,
            "paramter": parameters as AnyObject
        ]
        print(dict)
        if method == .POST {
            post(HQBaseUrl, parameters: dict, progress: nil, success: success, failure: failure)
        } else {
            get(HQBaseUrl, parameters: dict, progress: nil, success: success, failure: failure)
        }
        
    }
    
    /// 带`token`的网络请求方法
    func tokenRequest(method: HQHTTPMethod = .GET, URLString: String, parameters: [String: AnyObject]?, completion: @escaping (_ json: Any?, _ isSuccess: Bool) -> ()) {
        
        guard let token = userAccount.token else {
            
            // 发送通知,提示用户登录
            print("没有 token 需要重新登录")
            NotificationCenter.default.post(
                name: NSNotification.Name(rawValue: HQUserShouldLoginNotification),
                object: "aaa")
            completion(nil, false)
            return
        }
        
        var parameters = parameters
        
        if parameters == nil {
            parameters = [String: AnyObject]()
        }
        
        parameters!["access_token"] = token as AnyObject
        
        request(URLString: URLString, parameters: parameters, completion: completion)
    }
    
    /// 封装 AFN 的 GET/POST 请求
    ///
    /// - Parameters:
    ///   - method: GET/POST
    ///   - URLString: URLString
    ///   - parameters: parameters
    ///   - completion: 完成回调(json, isSuccess)
    func request(method: HQHTTPMethod = .GET, URLString: String, parameters: [String: AnyObject]?, completion: @escaping (_ json: Any?, _ isSuccess: Bool) -> ()) {
        
        let success = { (task: URLSessionDataTask, json: Any?)->() in
            completion(json, true)
        }
        
        let failure = { (task: URLSessionDataTask?, error: Error)->() in
            
            if (task?.response as? HTTPURLResponse)?.statusCode == 403 {
                print("token 过期了")
                
                // FIXME: 发送通知,提示用户再次登录
                NotificationCenter.default.post(
                    name: NSNotification.Name(rawValue: HQUserShouldLoginNotification),
                    object: "bad token")
            }
            
            print("网络请求错误 \(error)")
            completion(nil, false)
        }
        
        if method == .GET {
            get(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
        } else {
            post(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
        }
        
    }
}
