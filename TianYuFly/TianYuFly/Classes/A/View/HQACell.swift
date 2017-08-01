//
//  HQACell.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/1.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQACell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI
extension HQACell {
    
    fileprivate func setupUI() {
        backgroundColor = UIColor.hq_randomColor()
    }
}
