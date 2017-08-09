//
//  HQHViewModel.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/9.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import Foundation

class HQHViewModel: CustomStringConvertible {
    
    var model = HQHModel()
    
    init(model: HQHModel) {
        self.model = model
    }
    
    var description: String {
        return model.yy_modelDescription()
    }
}
