//
//  HQHModel.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/9.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQHModel: NSObject {

    /// 头像
    var bmiddle_pic: String?
    /// 姓名
    var idstr: String?
    /// 用户ID
    var id: Int64 = 0
    /// 性别
//    var favorited: Int64 = 0
    /// 机构名称、职位、技术级别、手机号码、邮箱地址
    var text: String?
    
    /// 图片icon
//    var bmiddle_pic: String?
    
    override var description: String {
        
        return yy_modelDescription()
    }
}
