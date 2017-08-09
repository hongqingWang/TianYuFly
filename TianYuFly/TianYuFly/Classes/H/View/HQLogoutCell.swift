//
//  HQLogoutCell.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/9.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQLogoutCell: UITableViewCell {

    lazy var logoutButton: UIButton = UIButton(hq_title: "登出", fontSize: 14, normalBackColor: UIColor.hq_buttonBackgroundColor, highBackColor: UIColor.hq_buttonHighBackgroundColor, size: CGSize(width: UIScreen.hq_screenWidth() - margin * 2, height: height))
    
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
extension HQLogoutCell {
    
    fileprivate func setupUI() {
        
        addSubview(logoutButton)
        
        logoutButton.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(margin)
            make.right.equalTo(self).offset(-margin)
            make.height.equalTo(height)
            make.centerY.equalTo(self)
        }
    }
}
