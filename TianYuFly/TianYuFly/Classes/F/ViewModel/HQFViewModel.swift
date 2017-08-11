//
//  HQFViewModel.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/11.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import Foundation

class HQFViewModel: CustomStringConvertible {
    
    var model: HQFModel
    
    init(model: HQFModel) {
        self.model = model
    }
    
    var description: String {
        return model.yy_modelDescription()
    }
}
