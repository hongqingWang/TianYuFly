//
//  HQACell.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/1.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

fileprivate let margin: CGFloat = 16.0
fileprivate let height: CGFloat = 40.0

class HQACell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - 懒加载控件
    /// 图片
    lazy var iconImageView: UIImageView = UIImageView(hq_imageName: "")
    /// 标题
    lazy var titleLabel: UILabel = UILabel(hq_title: "飞行训练酒店安排", fontSize: 14, color: UIColor.darkGray)
    /// 描述
    lazy var detailLable: UILabel = UILabel (hq_title: "您参加的XX训练酒店安排为：XX月XX日到YY月YY日在海口XX酒店。地址：海口XX路某号。酒店房型为标准间。前台电话", fontSize: 12, color: UIColor.lightGray)
}

// MARK: - UI
extension HQACell {
    
    fileprivate func setupUI() {
        
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(detailLable)
        
        iconImageView.backgroundColor = UIColor.red
        detailLable.numberOfLines = 2
        
        iconImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(margin)
            make.centerY.equalTo(self)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(iconImageView)
            make.left.equalTo(iconImageView.snp.right).offset(margin / 2)
        }
        detailLable.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(margin / 4)
            make.left.equalTo(titleLabel)
            make.right.equalTo(self).offset(0)
        }
    }
}
