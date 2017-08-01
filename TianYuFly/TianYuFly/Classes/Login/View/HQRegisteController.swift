//
//  HQRegisteController.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/7/31.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

fileprivate let margin: CGFloat = 16.0
fileprivate let height: CGFloat = 40.0

class HQRegisteController: HQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navItem.leftBarButtonItem = UIBarButtonItem(hq_title: "返回", target: self, action: #selector(back), isBack: true)
        
        setupUI()
    }
    // MARK: - 私有控件
    /// 手机号
    fileprivate lazy var phoneTextField: UITextField = UITextField(hq_placeholder: "手机号", border: .roundedRect)
    /// 获取验证码按钮
    fileprivate lazy var verifyCodeButton: HQButton = HQButton(hq_title: "获取验证码", fontSize: 14, normalBackColor: UIColor.orange, highBackColor: UIColor.hq_color(withHex: 0xB5751F), size: CGSize(width: UIScreen.hq_screenWidth() * 0.4, height: height))
    /// 验证码
    fileprivate lazy var verifyCodeTextField: UITextField = UITextField(hq_placeholder: "验证码", border: .roundedRect)
    /// 提交按钮
    lazy var submitButton: UIButton = UIButton(hq_title: "提交", normalBackColor: UIColor.orange, highBackColor: UIColor.hq_color(withHex: 0xB5751F), size: CGSize(width: UIScreen.hq_screenWidth() - margin * 2, height: height))
}

// MARK: - Target Action
extension HQRegisteController {
    
    /// 提交
    @objc fileprivate func submit() {
        print(phoneTextField.text ?? "")
        print(verifyCodeTextField.text ?? "")
        
        let vc = HQRegisteSecondController()
        navigationController?.pushViewController(vc, animated: true)
    }
    /// 获取验证码
    @objc fileprivate func getVerifyCode() {
        verifyCodeButton.timeDown(time: 60)
    }
    @objc fileprivate func back() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UI
extension HQRegisteController {
    
    fileprivate func setupUI() {
        
        view.addSubview(phoneTextField)
        view.addSubview(verifyCodeButton)
        view.addSubview(verifyCodeTextField)
        view.addSubview(submitButton)
        
        verifyCodeButton.addTarget(self, action: #selector(getVerifyCode), for: .touchUpInside)
        submitButton.addTarget(self, action: #selector(submit), for: .touchUpInside)
        
        phoneTextField.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(64 + margin)
            make.left.equalTo(view).offset(margin)
            make.width.equalTo(UIScreen.hq_screenWidth() * 0.6)
            make.height.equalTo(height)
        }
        verifyCodeButton.snp.makeConstraints { (make) in
            make.left.equalTo(phoneTextField.snp.right).offset(margin / 2)
            make.right.equalTo(view).offset(-margin)
            make.centerY.equalTo(phoneTextField)
            make.height.equalTo(phoneTextField)
        }
        verifyCodeTextField.snp.makeConstraints { (make) in
            make.top.equalTo(phoneTextField.snp.bottom).offset(margin)
            make.left.equalTo(phoneTextField)
            make.right.equalTo(verifyCodeButton)
            make.height.equalTo(phoneTextField)
        }
        submitButton.snp.makeConstraints { (make) in
            make.top.equalTo(verifyCodeTextField.snp.bottom).offset(margin * 2)
            make.left.equalTo(verifyCodeTextField)
            make.right.equalTo(verifyCodeTextField)
            make.height.equalTo(verifyCodeTextField)
        }
    }
}
