//
//  HQKViewController.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/7/28.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit
import WebKit

class HQKViewController: HQBaseViewController {
    
    fileprivate lazy var webView = WKWebView()
    
    override func loadData() {
        
        let url = Bundle.main.url(forResource: "trainguide.html", withExtension: nil)
        let request = URLRequest(url: url!)
        webView.load(request)
    }
}

// MARK: - UI
extension HQKViewController {
    
    override func setupTableView() {
        super.setupTableView()
        
        webView.frame = CGRect(x: 0, y: navHeight, width: UIScreen.hq_screenWidth(), height: UIScreen.hq_screenHeight() - navHeight)
        view.addSubview(webView)
    }
}
