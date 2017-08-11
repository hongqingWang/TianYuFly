//
//  HQELookCertificateController.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/11.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQELookCertificateController: HQBaseViewController {
    
    var viewModel: HQEViewModel?
}

// MARK: - UI
extension HQELookCertificateController {
    
    override func setupTableView() {
        super.setupTableView()
        
        let newView = HQELookCertificateView()
        newView.frame = CGRect(x: 0, y: navHeight, width: UIScreen.hq_screenWidth(), height: UIScreen.hq_screenHeight() - navHeight)
        view.insertSubview(newView, belowSubview: navigationBar)
    }
}
