//
//  HQBTableHeaderView.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/15.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQBTableHeaderView: UITableViewHeaderFooterView {

    
    fileprivate lazy var titleLabel: UILabel = UILabel(hq_title: "aaa", fontSize: 14, color: UIColor.hq_titleTextColor)
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HQBTableHeaderView {
    
    fileprivate func setupUI() {
        
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(margin)
            make.centerY.equalTo(self)
        }
    }
}
