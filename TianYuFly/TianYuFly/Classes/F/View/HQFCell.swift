//
//  HQFCell.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/11.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQFCell: UITableViewCell {

    var viewModel: HQFViewModel? {
        didSet {
            titleLabel.text = viewModel?.model.idstr
            commitLabel.text = "调查表 \(viewModel?.model.idstr ?? "")"
            timeLabel.text = "完成时间 \(viewModel?.model.idstr ?? "")"
        }
    }
    
    fileprivate lazy var titleLabel: UILabel = UILabel(hq_title: "理论训练 A320 初始改装满意度调查", fontSize: 14, color: UIColor.hq_titleTextColor)
    fileprivate lazy var commitLabel: UILabel = UILabel(hq_title: "调查表 : 未提交", fontSize: 12, color: UIColor.hq_titleTextColor)
    fileprivate lazy var timeLabel: UILabel = UILabel(hq_title: "完成时间 2017-05-12 12:12:12", fontSize: 12, color: UIColor.hq_titleTextColor)
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI
extension HQFCell {
    
    fileprivate func setupUI() {
        
        addSubview(titleLabel)
        addSubview(commitLabel)
        addSubview(timeLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(margin / 2)
            make.left.equalTo(self).offset(margin)
        }
        commitLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(margin / 4)
            make.left.equalTo(titleLabel)
        }
        timeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.centerX)
            make.centerY.equalTo(commitLabel)
        }
    }
}
