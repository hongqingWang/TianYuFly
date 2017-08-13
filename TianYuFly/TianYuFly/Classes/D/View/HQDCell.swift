//
//  HQDCell.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/13.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQDCell: UITableViewCell {

    var viewModel: HQDViewModel? {
        didSet {
            /*
             这里如果用`avatar_default`这个图片就会在如果没有下载好图片的时候,显示这张图片.
             而这张图片又是比`UIImageView`我们自己设定的`50*50`大的很多的图片
             就会造成对图片拉伸,因此占位图片要保证和我们自己的`UIImageView`的尺寸一样
             */
            iconImageView.hq_setImage(urlString: viewModel?.model.bmiddle_pic, placeholderImage: UIImage(named: "avatar_default"))
            titleLabel.text = viewModel?.model.idstr
            subTitleLabel.text = viewModel?.model.idstr
            timeLabel.text = viewModel?.model.idstr
        }
    }
    
    fileprivate lazy var iconImageView: UIImageView = UIImageView(hq_imageName: "placeholder_icon")
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
