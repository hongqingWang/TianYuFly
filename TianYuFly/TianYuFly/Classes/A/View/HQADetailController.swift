//
//  HQADetailController.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/4.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQADetailController: HQBaseViewController {

    /// 接收上一个页面的`viewModel`的属性
    var viewModel: HQAaViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(viewModel?.model.text ?? "")
    }
}

// MARK: - UI
extension HQADetailController {
    
    override func setupTableView() {
        super.setupTableView()
        
        
    }
}
