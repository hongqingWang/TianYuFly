//
//  HQGViewModel.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/10.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import Foundation

class HQGViewModel: CustomStringConvertible {
    
    var model: HQGModel
    
    init(model: HQGModel) {
        self.model = model
    }
    
    var description: String {
        return model.yy_modelDescription()
    }
}
