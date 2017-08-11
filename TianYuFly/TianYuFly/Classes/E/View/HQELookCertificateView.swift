//
//  HQELookCertificateView.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/11.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQELookCertificateView: UIView {

//    var viewModel: HQEViewModel {
//        didSet {
//            
//        }
//    }
    // /Users/wanghongqing/Documents/07-天羽/02-Code/TianYuFly/TianYuFly/TianYuFly/Classes/E/View/HQELookCertificateView.swift:25:15: Property 'self.viewModel' not initialized at super.init call
    
    fileprivate lazy var titleLabel: UILabel = UILabel(hq_title: "理论训练 A320 初始改装训练证书", fontSize: 14, color: UIColor.hq_titleTextColor)
    fileprivate lazy var photoImageView: UIImageView = UIImageView()
//    (hq_imageName: "main_part_a")
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI
extension HQELookCertificateView {
    
    fileprivate func setupUI() {
        
        addSubview(titleLabel)
        addSubview(photoImageView)
        
        photoImageView.backgroundColor = UIColor.red
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(margin)
        }
        photoImageView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalTo(self)
            make.bottom.equalTo(self)
            make.right.equalTo(self)
        }
    }
}
