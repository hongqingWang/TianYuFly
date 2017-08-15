//
//  HQBCell.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/15.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQBCell: UITableViewCell {

    var viewModel: HQBViewModel? {
        didSet {
            titleLabel.text = viewModel?.model.idstr
            subTitleLabel.text = viewModel?.model.text
        }
    }
    
    /// 标题
    fileprivate lazy var titleLabel: UILabel = UILabel(hq_title: "5月16日", fontSize: 14, color: UIColor.hq_titleTextColor)
    fileprivate lazy var detailLabel: UILabel = UILabel(hq_title: "点击查看详情", fontSize: 12, color: UIColor.hq_lightTextColor)
    /// 副标题
    fileprivate lazy var subTitleLabel: UILabel = UILabel(hq_title: "10:00-12:00 海口 模拟机训练 A330 复训", fontSize: 12, color: UIColor.hq_lightTextColor)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HQBCell {
    
    fileprivate func setupUI() {
        
        addSubview(titleLabel)
        addSubview(detailLabel)
        addSubview(subTitleLabel)
        
        subTitleLabel.numberOfLines = 2
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(margin)
            make.centerY.equalTo(self)
        }
        detailLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-margin)
        }
        subTitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.right).offset(margin)
            make.right.equalTo(detailLabel.snp.left).offset(-margin)
            make.centerY.equalTo(self)
        }
    }
}
