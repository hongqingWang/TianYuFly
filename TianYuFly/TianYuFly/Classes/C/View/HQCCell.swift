//
//  HQCCell.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/7.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQCCell: UITableViewCell {
    
    var viewModel: HQCViewModel? {
        didSet {
            iconImageView.hq_setImage(urlString: viewModel?.model.bmiddle_pic, placeholderImage: UIImage(named: "placeholder_icon"))
            titleLabel.text = "\(String(describing: viewModel?.model.id))"
            detailLable.text = viewModel?.model.text
        }
    }
    
    // MARK: - Property
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
extension HQCCell {
    
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
