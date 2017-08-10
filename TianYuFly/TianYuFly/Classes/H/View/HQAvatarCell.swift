//
//  HQAvatarCell.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/9.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQAvatarCell: UITableViewCell {
    
    var viewModel: HQHViewModel? {
        didSet {
            nameLabel.text = viewModel?.model.idstr
        }
    }
    
    /// 头像
    fileprivate lazy var avatarImageView: UIImageView = UIImageView(hq_imageName: "avatar_default")
    /// 姓名
    fileprivate lazy var nameLabel: UILabel = UILabel(hq_title: "王红庆", fontSize: 14, color: UIColor.hq_titleTextColor)
    fileprivate lazy var userLabel: UILabel = UILabel(hq_title: "用户", fontSize: 12, color: UIColor.hq_titleTextColor)
    fileprivate lazy var englishLabel: UILabel = UILabel(hq_title: "ID", fontSize: 12, color: UIColor.hq_lightTextColor)
    /// 用户ID
    fileprivate lazy var userIDLabel: UILabel = UILabel(hq_title: "hongq-wang", fontSize: 14, color: UIColor.hq_titleTextColor)
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

// MARK: - UI
extension HQAvatarCell {
    
    fileprivate func setupUI() {
        
        addSubview(avatarImageView)
        addSubview(nameLabel)
        addSubview(userLabel)
        addSubview(englishLabel)
        addSubview(userIDLabel)
        addSubview(lineView)
        
        avatarImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(margin)
            make.centerY.equalTo(self)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(avatarImageView)
            make.left.equalTo(avatarImageView.snp.right).offset(margin / 2)
        }
        englishLabel.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel)
            make.bottom.equalTo(avatarImageView).offset(margin / 4)
        }
        userLabel.snp.makeConstraints { (make) in
            make.left.equalTo(englishLabel)
            make.bottom.equalTo(englishLabel.snp.top)
        }
        userIDLabel.snp.makeConstraints { (make) in
            make.left.equalTo(userLabel.snp.right).offset(margin)
            make.centerY.equalTo(userLabel.snp.bottom)
        }
        lineView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(margin)
            make.bottom.equalTo(self)
            make.right.equalTo(self)
            make.height.equalTo(1)
        }
    }
}
