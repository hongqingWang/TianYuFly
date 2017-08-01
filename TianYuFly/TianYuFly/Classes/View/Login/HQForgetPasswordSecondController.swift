//
//  HQForgetPasswordSecondController.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/1.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

fileprivate let margin: CGFloat = 16.0
fileprivate let height: CGFloat = 40.0

class HQForgetPasswordSecondController: HQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navItem.title = "忘记密码"
        navItem.leftBarButtonItem = UIBarButtonItem(hq_title: "返回", target: self, action: #selector(back), isBack: true)
        
        setupUI()
    }
    // MARK: - 私有控件
    /// 描述`Label`
    fileprivate lazy var descLabel: UILabel = UILabel(hq_title: "输入你的新密码", color: UIColor.lightGray)
    /// 密码
    fileprivate lazy var passwordTextField: UITextField = UITextField(hq_placeholder: "新密码", border: .roundedRect)
    /// 注册按钮
    lazy var submitButton: UIButton = UIButton(hq_title: "提交", normalBackColor: UIColor.orange, highBackColor: UIColor.hq_color(withHex: 0xB5751F), size: CGSize(width: UIScreen.hq_screenWidth() - margin * 2, height: height))
}

// MARK: - Target Action
extension HQForgetPasswordSecondController {
    
    /// 提交
    @objc fileprivate func registe() {
        print(passwordTextField.text ?? "")
        
        navigationController?.popToRootViewController(animated: true)
    }
    @objc fileprivate func back() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UI
extension HQForgetPasswordSecondController {
    
    fileprivate func setupUI() {
        
        view.addSubview(descLabel)
        view.addSubview(passwordTextField)
        view.addSubview(submitButton)
        
        submitButton.addTarget(self, action: #selector(registe), for: .touchUpInside)
        
        descLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(64 + margin)
            make.left.equalTo(view).offset(margin)
        }
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(descLabel.snp.bottom).offset(margin)
            make.left.equalTo(descLabel)
            make.right.equalTo(view).offset(-margin)
            make.height.equalTo(height)
        }
        submitButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(margin * 2)
            make.left.equalTo(passwordTextField)
            make.right.equalTo(passwordTextField)
            make.height.equalTo(passwordTextField)
        }
    }
}
