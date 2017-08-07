//
//  HQKViewController.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/7/28.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQKViewController: HQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}

extension HQKViewController {
    
    override func setupTableView() {
        super.setupTableView()
        
        view = UIView(frame: CGRect(x: 0, y: 64, width: UIScreen.hq_screenWidth(), height: 100))
        view.backgroundColor = UIColor.red
    }
}
