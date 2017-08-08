//
//  HQLoginBaseController.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/8.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQLoginBaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        // 设置导航栏透明色
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        // 除去导航栏下方阴影(一条分割线)
        navigationController?.navigationBar.shadowImage = UIImage()
        // 设置导航栏标题颜色
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.hq_color(withHex: 0x27334D)]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(hq_title: "", target: self, action: #selector(back), isBack: true)
    }
}

// MARK: - Target Action
extension HQLoginBaseController {
    
//    /// 提交
//    @objc fileprivate func submit() {
//        print(phoneTextField.text ?? "")
//        print(verifyCodeTextField.text ?? "")
//        
//        let vc = HQRegisteSecondController()
//        navigationController?.pushViewController(vc, animated: true)
//    }
//    /// 获取验证码
//    @objc fileprivate func getVerifyCode() {
//        verifyCodeButton.timeDown(time: 60)
//    }
    @objc fileprivate func back() {
        navigationController?.popViewController(animated: true)
    }
}
