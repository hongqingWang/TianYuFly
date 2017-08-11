//
//  HQFResearchController.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/11.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit
import WebKit
import SVProgressHUD

class HQFResearchController: HQBaseViewController {

    fileprivate lazy var webView = WKWebView()
    
    override func loadData() {
        
        let url = URL(string: "http://www.baidu.com")
        
        let request = URLRequest(url: url!)
        
        webView.load(request)
    }
}

// MARK: - WKNavigationDelegate
extension HQFResearchController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        SVProgressHUD.show()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        SVProgressHUD.dismiss()
    }
}

// MARK: - UI
extension HQFResearchController {
    override func setupTableView() {
        
        webView.frame = CGRect(x: 0, y: navHeight, width: UIScreen.hq_screenWidth(), height: UIScreen.hq_screenHeight() - navHeight)
        webView.navigationDelegate = self
        view.insertSubview(webView, belowSubview: navigationBar)
    }
}
