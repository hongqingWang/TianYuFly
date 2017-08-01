//
//  HQRegisteController.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/7/31.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQRegisteController: HQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navItem.leftBarButtonItem = UIBarButtonItem(hq_title: "返回", target: self, action: #selector(back), isBack: true)
        
        setupUI()
    }
    // MARK: - 私有控件
    
}

// MARK: - Target Action
extension HQRegisteController {
    
    @objc fileprivate func back() {
        
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UI
extension HQRegisteController {
    
    fileprivate func setupUI() {
        
    }
}
