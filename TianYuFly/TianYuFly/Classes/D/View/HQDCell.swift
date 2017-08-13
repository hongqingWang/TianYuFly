//
//  HQDCell.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/13.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQDCell: UITableViewCell {

    fileprivate lazy var iconImageView: UIImageView = UIImageView(hq_imageName: "avatar_default")
    fileprivate lazy var titleLabel: UILabel = UILabel(hq_title: "A320 初始改装", fontSize: 14, color: UIColor.hq_titleTextColor)
    fileprivate lazy var subTitleLabel: UILabel = UILabel(hq_title: "XXXX 在线学习任务，完成度90%，点击学习", fontSize: 12, color: UIColor.hq_lightTextColor)
    fileprivate lazy var timeLabel: UILabel = UILabel(hq_title: "05-16", fontSize: 12, color: UIColor.hq_lightTextColor)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI
extension HQDCell {
    
    fileprivate func setupUI() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(timeLabel)
        
        iconImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(margin)
            make.centerY.equalTo(self)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(iconImageView).offset(margin / 4)
            make.left.equalTo(iconImageView.snp.right).offset(margin / 2)
        }
        subTitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.bottom.equalTo(iconImageView).offset(-margin / 4)
            make.right.equalTo(self).offset(-margin / 4)
        }
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(margin / 4)
            make.right.equalTo(self).offset(-margin / 4)
        }
    }
}
