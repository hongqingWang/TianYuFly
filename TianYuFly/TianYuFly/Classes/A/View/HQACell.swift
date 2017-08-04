//
//  HQACell.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/1.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQACell: UITableViewCell {
    
    var viewModel: HQAaViewModel? {
        didSet {
            titleLabel.text = viewModel?.model.user?.screen_name
            detailLable.text = viewModel?.model.text
            iconImageView.hq_setImage(urlString: viewModel?.model.user?.profile_image_url, placeholderImage: UIImage(named: "placeholder_icon"))
        }
    }
    
    // MARK: - 懒加载控件
    /// 图片
    fileprivate lazy var iconImageView: UIImageView = UIImageView(hq_imageName: "")
    /// 标题
    fileprivate lazy var titleLabel: UILabel = UILabel(hq_title: "", fontSize: 14, color: UIColor.hq_titleTextColor)
    /// 描述
    fileprivate lazy var detailLable: UILabel = UILabel (hq_title: "", fontSize: 12, color: UIColor.hq_textColor)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI
extension HQACell {
    
    fileprivate func setupUI() {
        
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(detailLable)
        
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
            make.top.equalTo(titleLabel.snp.bottom).offset(margin / 2)
            make.left.equalTo(titleLabel)
            make.right.equalTo(self).offset(-margin / 4)
        }
    }
}
