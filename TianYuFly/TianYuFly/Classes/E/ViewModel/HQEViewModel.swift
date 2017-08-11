//
//  HQEViewModel.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/11.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import Foundation

class HQEViewModel: CustomStringConvertible {
    
    var model: HQEModel
    
    init(model: HQEModel) {
        self.model = model
    }
    
    var description: String {
        return model.yy_modelDescription()
    }
}
