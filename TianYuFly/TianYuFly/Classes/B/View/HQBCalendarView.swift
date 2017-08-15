//
//  HQBCalendarView.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/15.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQBCalendarView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HQBCalendarView {
    
    fileprivate func setupUI() {
        backgroundColor = UIColor.red
    }
}
