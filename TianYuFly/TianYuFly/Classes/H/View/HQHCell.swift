//
//  HQHCell.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/9.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQHCell: UITableViewCell {
    
    var viewModel: HQHViewModel? {
        didSet {
            
            titleLabel.text = "\(viewModel?.model.id)"
        }
    }
    
    
    lazy var titleLabel: UILabel = UILabel(hq_title: "性别", fontSize: 14, color: UIColor.hq_titleTextColor)
    lazy var englishLabel: UILabel = UILabel(hq_title: "Gender", fontSize: 12, color: UIColor.hq_lightTextColor)
    /// 详解介绍
    fileprivate lazy var detailLabel: UILabel = UILabel(hq_title: "男", fontSize: 14, color: UIColor.hq_titleTextColor)
    fileprivate lazy var lineView: UIView = UIView.hq_line
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HQHCell {
    
    fileprivate func setupUI() {
        
        addSubview(titleLabel)
        addSubview(englishLabel)
        addSubview(detailLabel)
        addSubview(lineView)
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(margin)
            make.centerY.equalTo(self).multipliedBy(0.8)
        }
        englishLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalTo(titleLabel)
        }
        detailLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(margin * 8)
            make.centerY.equalTo(self)
        }
        lineView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(margin)
            make.bottom.equalTo(self)
            make.right.equalTo(self)
            make.height.equalTo(1)
        }
    }
}
