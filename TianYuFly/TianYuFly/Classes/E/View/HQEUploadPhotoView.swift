//
//  HQEUploadPhotoView.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/12.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQEUploadPhotoView: UIView {
    
    var viewModel: HQEViewModel? {
        didSet {
            titleLabel.text = viewModel?.model.idstr
            photoImageView.hq_setNormalImage(urlString: viewModel?.model.bmiddle_pic, placeholderImage: UIImage(named: "avatar_default"))
        }
    }
    
    /// 标题
    fileprivate lazy var titleLabel: UILabel = UILabel(hq_title: "理论训练 A320 初始改装训练证书", fontSize: 14, color: UIColor.hq_titleTextColor)
    fileprivate lazy var backView: UIView = UIView()
    /// 证书图片
    fileprivate lazy var photoImageView: UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        /*
         下面这两句话是解决这个问题的
         Property 'self.viewModel' not initialized at super.init call
         */
        let model = HQEModel()
        viewModel = HQEViewModel(model: model)
        
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI
extension HQEUploadPhotoView {
    
    fileprivate func setupUI() {
        
        addSubview(titleLabel)
        addSubview(backView)
        backView.addSubview(photoImageView)
        
        photoImageView.contentMode = .scaleAspectFit
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(margin)
        }
        backView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalTo(self)
            make.bottom.equalTo(self)
            make.right.equalTo(self)
        }
        photoImageView.snp.makeConstraints { (make) in
            make.margins.equalTo(backView)
        }
    }
}
