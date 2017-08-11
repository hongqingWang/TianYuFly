//
//  HQNetWorkManager+Extension.swift
//  HQSwiftMVVM
//
//  Created by 王红庆 on 2017/7/18.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import Foundation

// MARK: - Banner 模块网络请求
extension HQNetWorkManager {
    
    
}

// MARK: - A(吃住行)模块网络请求
extension HQNetWorkManager {
    
    /// 微博数据字典数组
    ///
    /// - Parameters:
    ///   - since_id: 返回ID比since_id大的微博（即比since_id时间晚的微博），默认为0
    ///   - max_id: 返回ID小于或等于max_id的微博，默认为0
    ///   - completion: 微博字典数组/是否成功
    func statusList(since_id: Int64 = 0, max_id: Int64 = 0, completion: @escaping (_ list: [[String: AnyObject]]?, _ isSuccess: Bool) -> ()) {
        
        let urlString = "https://api.weibo.com/2/statuses/home_timeline.json"
        
        // `swift`中,`Int`可以转换成`Anybject`,但是`Int 64`不行
        let para = [
            "since_id": "\(since_id)",
            "max_id": "\(max_id > 0 ? (max_id - 1) : 0)"
        ]
        
        tokenRequest(URLString: urlString, parameters: para as [String: AnyObject]) { (json, isSuccess) in
            /*
             从`json`中获取`statuses`字典数组
             如果`as?`失败,`result = nil`
             */
            let result = (json as AnyObject)["statuses"] as? [[String: AnyObject]]
            completion(result, isSuccess)
        }
    }
    
    /// 未读微博数量
    ///
    /// - Parameter completion: unreadCount
    func unreadCount(completion: @escaping (_ count: Int) -> ()) {
        
        guard let uid = userAccount.uid else {
            return
        }
        
        let urlString = "https://rm.api.weibo.com/2/remind/unread_count.json"
        
        let para = ["uid": uid]
        
        tokenRequest(URLString: urlString, parameters: para as [String : AnyObject]) { (json, isSuccess) in
            
            let dict = json as? [String: AnyObject]
            let count = dict?["status"] as? Int
            
            completion(count ?? 0)
        }
    }
}

// MARK: - B(训练计划)模块网络请求
extension HQNetWorkManager {
    
    
}

// MARK: - C(消息)模块网络请求
extension HQNetWorkManager {
    
    func cList(since_id: Int64 = 0, max_id: Int64 = 0, completion: @escaping (_ list: [[String: AnyObject]]?, _ isSuccess: Bool) -> ()) {
        
        let urlString = CListUrlString
        
        // `swift`中,`Int`可以转换成`Anybject`,但是`Int 64`不行
        let para = [
            "since_id": "\(since_id)",
            "max_id": "\(max_id > 0 ? (max_id - 1) : 0)"
        ]
        
        tokenRequest(URLString: urlString, parameters: para as [String: AnyObject]) { (json, isSuccess) in
            /*
             从`json`中获取`statuses`字典数组
             如果`as?`失败,`result = nil`
             */
            let result = (json as AnyObject)["statuses"] as? [[String: AnyObject]]
            completion(result, isSuccess)
        }
    }
}

// MARK: - D(在线学习)模块网络请求
extension HQNetWorkManager {
    
    
}

// MARK: - E(训练记录上传)模块网络请求
extension HQNetWorkManager {
    
    func eList(since_id: Int64 = 0, max_id: Int64 = 0, completion: @escaping (_ list: [[String: AnyObject]]?, _ isSuccess: Bool) -> ()) {
        
        let urlString = EListUrlString
        
        // `swift`中,`Int`可以转换成`Anybject`,但是`Int 64`不行
        let para = [
            "since_id": "\(since_id)",
            "max_id": "\(max_id > 0 ? (max_id - 1) : 0)"
        ]
        
        tokenRequest(URLString: urlString, parameters: para as [String: AnyObject]) { (json, isSuccess) in
            /*
             从`json`中获取`statuses`字典数组
             如果`as?`失败,`result = nil`
             */
            let result = (json as AnyObject)["statuses"] as? [[String: AnyObject]]
            completion(result, isSuccess)
        }
    }
}

// MARK: - F(满意度调查)模块网络请求
extension HQNetWorkManager {
    
    func fList(since_id: Int64 = 0, max_id: Int64 = 0, completion: @escaping (_ list: [[String: AnyObject]]?, _ isSuccess: Bool) -> ()) {
        
        let urlString = FListUrlString
        
        // `swift`中,`Int`可以转换成`Anybject`,但是`Int 64`不行
        let para = [
            "since_id": "\(since_id)",
            "max_id": "\(max_id > 0 ? (max_id - 1) : 0)"
        ]
        
        tokenRequest(URLString: urlString, parameters: para as [String: AnyObject]) { (json, isSuccess) in
            /*
             从`json`中获取`statuses`字典数组
             如果`as?`失败,`result = nil`
             */
            let result = (json as AnyObject)["statuses"] as? [[String: AnyObject]]
            completion(result, isSuccess)
        }
    }
}

// MARK: - G(考试成绩)模块网络请求
extension HQNetWorkManager {
    
    func gList(since_id: Int64 = 0, max_id: Int64 = 0, completion: @escaping (_ list: [[String: AnyObject]]?, _ isSuccess: Bool) -> ()) {
        
        let urlString = GListUrlString
        
        // `swift`中,`Int`可以转换成`Anybject`,但是`Int 64`不行
        let para = [
            "since_id": "\(since_id)",
            "max_id": "\(max_id > 0 ? (max_id - 1) : 0)"
        ]
        
        tokenRequest(URLString: urlString, parameters: para as [String: AnyObject]) { (json, isSuccess) in
            /*
             从`json`中获取`statuses`字典数组
             如果`as?`失败,`result = nil`
             */
            let result = (json as AnyObject)["statuses"] as? [[String: AnyObject]]
            completion(result, isSuccess)
        }
    }
}

// MARK: - H(我的信息)模块网络请求
extension HQNetWorkManager {
    
    func hList(since_id: Int64 = 0, max_id: Int64 = 0, completion: @escaping (_ list: [[String: AnyObject]]?, _ isSuccess: Bool) -> ()) {
        
        let urlString = HListUrlString
        
        // `swift`中,`Int`可以转换成`Anybject`,但是`Int 64`不行
        let para = [
            "since_id": "\(since_id)",
            "max_id": "\(max_id > 0 ? (max_id - 1) : 0)"
        ]
        
        tokenRequest(URLString: urlString, parameters: para as [String: AnyObject]) { (json, isSuccess) in
            /*
             从`json`中获取`statuses`字典数组
             如果`as?`失败,`result = nil`
             */
            
            let result = (json as AnyObject)["statuses"] as? [[String: AnyObject]]
            completion(result, isSuccess)
        }
    }
}

// MARK: - I(系统设置)模块网络请求
extension HQNetWorkManager {
    
    
}

// MARK: - J(关于我们)模块网络请求
extension HQNetWorkManager {
    
    
}

// MARK: - K(训练指南)模块网络请求
extension HQNetWorkManager {
    
    
}

// MARK: - 请求`Token`
extension HQNetWorkManager {
    
    /// 根据`帐号`和`密码`获取`Token`
    ///
    /// - Parameters:
    ///   - account: account
    ///   - password: password
    ///   - completion: 完成回调
    func loadAccessToken(account: String, password: String, completion: (_ isSuccess: Bool) -> ()) {
        
        // 从`bundle`加载`data`
        let path = Bundle.main.path(forResource: "userAccount.json", ofType: nil)
        let data = NSData(contentsOfFile: path!)
        
        // 从`Bundle`加载配置的`userAccount.json`
        guard let dict = try? JSONSerialization.jsonObject(with: data! as Data, options: []) as? [String: AnyObject]
            else {
                return
        }
        
        // 直接用字典设置`userAccount`的属性
        self.userAccount.yy_modelSet(with: dict ?? [:])
        
        self.userAccount.saveAccount()
        
        // 完成回调
        completion(true)
    }
}
