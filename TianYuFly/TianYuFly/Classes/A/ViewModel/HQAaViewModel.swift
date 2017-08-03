//
//  HQAaViewModel.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/3.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import Foundation

class HQAaViewModel: CustomStringConvertible {
    
    var model: HQAModel
    
    init(model: HQAModel) {
        self.model = model
    }
    
    var description: String {
        return model.yy_modelDescription()
    }
}
