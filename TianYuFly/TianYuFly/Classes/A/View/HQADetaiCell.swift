//
//  HQADetaiCell.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/4.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQADetaiCell: UITableViewCell {
    
    var viewModel: HQAaViewModel? {
        didSet {
            label.text = viewModel?.model.text
        }
    }
    
    // MARK: - Property
    /// 详细信息
    fileprivate lazy var label: UILabel = UILabel(hq_spaceText: "您参加的XX训练酒店安排为：海口XX酒店。\n住宿日期范围：XX月XX日到YY月YY日。\n酒店房型：标准间。\n地址：海口XX路某号。\n前台电话089866666666\n酒店简介信息：XXXX\nXXXX\nXXXXX")
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI
extension HQADetaiCell {
    
    fileprivate func setupUI() {
        
        addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(margin)
            make.left.equalTo(self).offset(margin)
            make.right.equalTo(self).offset(-margin)
            make.bottom.equalTo(self)
        }
    }
}
