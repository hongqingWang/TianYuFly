//
//  HQADetaiCell.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/4.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQADetaiCell: UITableViewCell {
    
    // MARK: - Property
    fileprivate lazy var textView: UITextView = UITextView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI
extension HQADetaiCell {
    
    fileprivate func setupUI() {
        
        addSubview(textView)
        
        textView.snp.makeConstraints { (make) in
//            make.top.equalTo(<#T##other: ConstraintRelatableTarget##ConstraintRelatableTarget#>)
        }
    }
}
