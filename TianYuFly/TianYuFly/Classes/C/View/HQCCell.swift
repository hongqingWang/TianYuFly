//
//  HQCCell.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/7.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQCCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.hq_randomColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
