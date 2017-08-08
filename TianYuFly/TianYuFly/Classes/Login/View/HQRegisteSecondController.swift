//
//  HQRegisteSecondController.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/1.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQRegisteSecondController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        navigationItem.title = "注册"
//        navigationItem.leftBarButtonItem = UIBarButtonItem(hq_title: "返回", target: self, action: #selector(back), isBack: true)
        
        setupUI()
    }
    // MARK: - 私有控件
    /// 描述`Label`
    fileprivate lazy var descLabel: UILabel = UILabel(hq_title: "设定你的用户名密码", color: UIColor.lightGray)
    /// 登录名
    fileprivate lazy var accountTextField: UITextField = UITextField(hq_placeholder: "登录名", border: .roundedRect)
    /// 密码
    fileprivate lazy var passwordTextField: UITextField = UITextField(hq_placeholder: "密码", border: .roundedRect, isSecureText: true)
    /// 注册按钮
    lazy var registeButton: UIButton = UIButton(hq_title: "注册", normalBackColor: UIColor.orange, highBackColor: UIColor.hq_color(withHex: 0xB5751F), size: CGSize(width: UIScreen.hq_screenWidth() - margin * 2, height: height))
}

// MARK: - Target Action
extension HQRegisteSecondController {
    
    /// 提交
    @objc fileprivate func registe() {
        print(accountTextField.text ?? "")
        print(passwordTextField.text ?? "")
        
        navigationController?.popToRootViewController(animated: true)
    }
    @objc fileprivate func back() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UI
extension HQRegisteSecondController {
    
    fileprivate func setupUI() {
        
        view.addSubview(descLabel)
        view.addSubview(accountTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registeButton)
        
        registeButton.addTarget(self, action: #selector(registe), for: .touchUpInside)
        
        descLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(64 + margin)
            make.left.equalTo(view).offset(margin)
        }
        accountTextField.snp.makeConstraints { (make) in
            make.top.equalTo(descLabel.snp.bottom).offset(margin)
            make.left.equalTo(descLabel)
            make.right.equalTo(view).offset(-margin)
            make.height.equalTo(height)
        }
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(accountTextField.snp.bottom).offset(margin)
            make.left.equalTo(accountTextField)
            make.right.equalTo(accountTextField)
            make.height.equalTo(accountTextField)
        }
        registeButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(margin * 2)
            make.left.equalTo(passwordTextField)
            make.right.equalTo(passwordTextField)
            make.height.equalTo(passwordTextField)
        }
    }
}
