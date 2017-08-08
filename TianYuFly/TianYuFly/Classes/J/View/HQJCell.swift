//
//  HQJCell.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/8.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQJCell: UITableViewCell {

    // MARK: - 私有控件
    /// 应用图标
    fileprivate lazy var logoImageView: UIImageView = UIImageView(hq_imageName: "logo_01")
    /// 版本号
    fileprivate lazy var versionLabel: UILabel = UILabel(hq_title: "v1.0.0", fontSize: 14, color: UIColor.hq_titleTextColor)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension HQJCell {
    
    fileprivate func setupUI() {
        
        addSubview(logoImageView)
        addSubview(versionLabel)
        
        logoImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self).multipliedBy(0.8)
            make.centerY.equalTo(self)
            make.width.equalTo(50)
            make.height.equalTo(30)
        }
        versionLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self).multipliedBy(1.2)
            make.centerY.equalTo(self)
        }
    }
}
