//
//  HQDViewModel.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/13.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import Foundation

class HQDViewModel: CustomStringConvertible {
    
    var model: HQDModel
    
    init(model: HQDModel) {
        self.model = model
    }
    
    var description: String {
        return model.description
    }
}
