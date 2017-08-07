//
//  HQCViewModel.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/7.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import Foundation

class HQCViewModel: CustomStringConvertible {
    
    var model: HQCModel
    
    init(model: HQCModel) {
        self.model = model
    }
    
    var description: String {
        return model.yy_modelDescription()
    }
}
