//
//  HQPartCell.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/7/27.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQPartCell: UICollectionViewCell {
    
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    var text: String? {
        didSet {
            label.text = text
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 图片
    fileprivate lazy var imageView: UIImageView = UIImageView(hq_imageName: "")
    /// 标题
    fileprivate lazy var label: UILabel = UILabel(hq_title: "")
}

// MARK: - 界面布局
extension HQPartCell {
    
    func setupUI() {
        
        addSubview(imageView)
        addSubview(label)
        
        imageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).multipliedBy(0.8)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        label.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).multipliedBy(1.5)
        }
    }
}
