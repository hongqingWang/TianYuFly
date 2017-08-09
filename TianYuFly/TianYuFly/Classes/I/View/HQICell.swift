//
//  HQICell.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/9.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQICell: UITableViewCell {

    // MARK: - 私有控件
    /// 标题
    lazy var titleLabel: UILabel = UILabel(hq_title: "消息提醒音", fontSize: 14, color: UIColor.hq_titleTextColor)
    /// 英文标题
    lazy var englishLabel: UILabel = UILabel(hq_title: "message Sound", fontSize: 12, color: UIColor.hq_lightTextColor)
    /// 消息提示开关
    lazy var messageSwitch: UISwitch = UISwitch()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI
extension HQICell {
    
    fileprivate func setupUI() {
        
        addSubview(titleLabel)
        addSubview(englishLabel)
        addSubview(messageSwitch)
        
        messageSwitch.isHidden = true
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(margin)
            make.centerY.equalTo(self).multipliedBy(0.8)
        }
        englishLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalTo(titleLabel)
        }
        messageSwitch.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-margin)
            make.centerY.equalTo(self)
        }
    }
}
