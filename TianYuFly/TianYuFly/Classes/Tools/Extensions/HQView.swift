//
//  HQView.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/9.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

extension UIView {
    
    open class var hq_line: UIView {
        get {
        
            let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.hq_screenWidth() - 16, height: 1))
            view.backgroundColor = UIColor.hq_lineColor
            return view
        }
    }
}
