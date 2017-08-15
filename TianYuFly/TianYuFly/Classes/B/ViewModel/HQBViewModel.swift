//
//  HQBViewModel.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/15.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import Foundation

class HQBViewModel: CustomStringConvertible {
    
    var model: HQBModel
    
    init(model: HQBModel) {
        self.model = model
    }
    
    var description: String {
        return model.description
    }
}
