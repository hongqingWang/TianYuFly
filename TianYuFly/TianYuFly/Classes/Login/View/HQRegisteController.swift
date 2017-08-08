//
//  HQRegisteController.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/7/31.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQRegisteController: HQLoginBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - 私有控件
    /// 底部背景图片
    fileprivate lazy var backImageView: UIImageView = UIImageView(hq_imageName: "background")
    /// Logo
    fileprivate lazy var logoImageView: UIImageView = UIImageView(hq_imageName: "logo_01")
    /// 手机号
    fileprivate lazy var phoneTextField: UITextField = UITextField(hq_placeholder: "请输入手机号", border: .roundedRect)
    /// 获取验证码按钮
    fileprivate lazy var verifyCodeButton: HQButton = HQButton(hq_title: "获取验证码", fontSize: 16, normalBackColor: UIColor.hq_buttonBackgroundColor, highBackColor: UIColor.hq_buttonHighBackgroundColor, size: CGSize(width: UIScreen.hq_screenWidth() * 0.4, height: height))
    /// 验证码
    fileprivate lazy var verifyCodeTextField: UITextField = UITextField(hq_placeholder: "请输入验证码", border: .roundedRect)
    /// 提交按钮
    fileprivate lazy var submitButton: UIButton = UIButton(hq_title: "提交", normalBackColor: UIColor.hq_buttonBackgroundColor, highBackColor: UIColor.hq_buttonHighBackgroundColor, size: CGSize(width: UIScreen.hq_screenWidth() - margin * 2, height: height))
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
}

// MARK: - UI
extension HQRegisteController {
    
    fileprivate func setupUI() {
        
        view.addSubview(backImageView)
        view.addSubview(logoImageView)
        view.addSubview(phoneTextField)
        view.addSubview(verifyCodeTextField)
        view.addSubview(verifyCodeButton)
        view.addSubview(submitButton)
        
        verifyCodeButton.addTarget(self, action: #selector(getVerifyCode), for: .touchUpInside)
        submitButton.addTarget(self, action: #selector(submit), for: .touchUpInside)
        
        backImageView.frame = view.bounds
        logoImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).multipliedBy(0.33)
        }
        phoneTextField.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(margin)
            make.right.equalTo(view).offset(-margin)
            make.height.equalTo(height)
            make.centerY.equalTo(view).multipliedBy(0.72)
        }
        verifyCodeTextField.snp.makeConstraints { (make) in
            make.top.equalTo(phoneTextField.snp.bottom).offset(margin - 5)
            make.left.equalTo(phoneTextField)
            make.right.equalTo(view).offset(-145)
            make.height.equalTo(phoneTextField)
        }
        verifyCodeButton.snp.makeConstraints { (make) in
            make.left.equalTo(verifyCodeTextField.snp.right).offset(margin / 2)
            make.right.equalTo(view).offset(-margin)
            make.centerY.equalTo(verifyCodeTextField)
            make.height.equalTo(verifyCodeTextField)
        }
        submitButton.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(margin / 2)
            make.right.equalTo(view).offset(-margin / 2)
            make.height.equalTo(verifyCodeTextField)
            make.centerY.equalTo(view).multipliedBy(1.52)
        }
    }
}
