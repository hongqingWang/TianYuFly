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
    
    /// token
//    var accessToken: String? = "2.00It5tsGKXtWQEfb6d3a2738ImMUAD"
    var accessToken: String? = "2.00It5tsGQ6eDJE4ecbf2d825DCpbBD"
    
    /// 用户微博`id`
    var uid: String? = "6307922850"
    
    /// 用户登录标记(计算型属性)
    var userLogon: Bool {
        return accessToken != nil
    }
    
    /// 带`token`的网络请求方法
    func tokenRequest(method: HQHTTPMethod = .GET, URLString: String, parameters: [String: AnyObject]?, completion: @escaping (_ json: Any?, _ isSuccess: Bool)->()) {
        
        guard let token = accessToken else {
            
            // FIXME: 发送通知,提示用户登录
            print("没有 token 需要重新登录")
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
    func request(method: HQHTTPMethod = .GET, URLString: String, parameters: [String: AnyObject]?, completion: @escaping (_ json: Any?, _ isSuccess: Bool)->()) {
        
        let success = { (task: URLSessionDataTask, json: Any?)->() in
            completion(json, true)
        }
        
        let failure = { (task: URLSessionDataTask?, error: Error)->() in
            
            if (task?.response as? HTTPURLResponse)?.statusCode == 403 {
                print("token 过期了")
                
                // FIXME: 发送通知,提示用户再次登录
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
