//
//  HQBModel.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/15.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQBModel: NSObject {

    var id: Int64 = 0
    var idstr: String?
    var text: String?
    
    override var description: String {
        return yy_modelDescription()
    }
}
