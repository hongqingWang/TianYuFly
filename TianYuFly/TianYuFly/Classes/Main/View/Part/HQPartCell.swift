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
    
    // MARK: - Property
    /// 图片
    fileprivate lazy var imageView: UIImageView = UIImageView(hq_imageName: "")
    /// 标题
    fileprivate lazy var label: UILabel = UILabel(hq_title: "", fontSize: 13, color: UIColor.hq_titleTextColor)
    /// 英文标题
    lazy var englishLabel: UILabel = UILabel(hq_title: "", fontSize: 11, color: UIColor.hq_lightTextColor)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI
extension HQPartCell {
    
    func setupUI() {
        
        addSubview(imageView)
        addSubview(label)
        addSubview(englishLabel)
        
        imageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).multipliedBy(0.7)
        }
        label.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).multipliedBy(1.35)
        }
        englishLabel.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.bottom)
            make.centerX.equalTo(label)
        }
    }
}
