//
//  HQMainView.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/7/27.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

fileprivate let loopViewHeight: CGFloat = 180

class HQMainView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 轮播图父视图
    fileprivate lazy var loopView: UIView = UIView()
}

extension HQMainView {
    
    func setupUI() {
        
//        backgroundColor = UIColor.yellow
        addSubview(loopView)
        
        loopView.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(64)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.height.equalTo(loopViewHeight)
        }
    }
}
