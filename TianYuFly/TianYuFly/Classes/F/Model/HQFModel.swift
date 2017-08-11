//
//  HQFModel.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/11.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQFModel: NSObject {

    var id: Int64 = 0
    var text: String?
    var idstr: String?
    
    override var description: String {
        
        return yy_modelDescription()
    }
}
