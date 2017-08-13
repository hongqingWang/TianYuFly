//
//  HQDModel.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/13.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQDModel: NSObject {

    /// 微博ID
    var id: Int64 = 0
    /// 微博信息内容
    var text: String?
    var idstr: String?
    /// 图片icon
    var bmiddle_pic: String?
    
    //    var user: HQAaModel?
    
    override var description: String {
        
        return yy_modelDescription()
    }
}
