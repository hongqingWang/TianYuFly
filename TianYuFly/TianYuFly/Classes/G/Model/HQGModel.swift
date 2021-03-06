//
//  HQGModel.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/10.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQGModel: NSObject {

    /*
     `Int`类型,在`64`位的机器是`64`位,在`32`位的机器是`32`位
     如果不写明`Int 64`在 iPad 2 / iPhone 5/5c/4s/4 都无法正常运行
     */
    /// 微博ID
    var id: Int64 = 0
    /// 微博信息内容
    var text: String?
    /// 姓名
    var idstr: String?
    /// 图片icon
    var bmiddle_pic: String?
    
    //    var user: HQAaModel?
    
    override var description: String {
        
        return yy_modelDescription()
    }
}
