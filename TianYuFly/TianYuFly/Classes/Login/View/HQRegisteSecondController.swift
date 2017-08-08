//
//  HQRegisteSecondController.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/1.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQRegisteSecondController: HQLoginBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "注册"
        
        setupUI()
    }
    // MARK: - 私有控件
    /// 底部背景图片
    fileprivate lazy var backImageView: UIImageView = UIImageView(hq_imageName: "background")
    /// Logo
    fileprivate lazy var logoImageView: UIImageView = UIImageView(hq_imageName: "logo_01")
    /// 登录名
    fileprivate lazy var accountTextField: UITextField = UITextField(hq_placeholder: "请输入登录名", border: .roundedRect)
    /// 密码
    fileprivate lazy var passwordTextField: UITextField = UITextField(hq_placeholder: "请输入密码", border: .roundedRect, isSecureText: true)
    /// 注册按钮
    lazy var registeButton: UIButton = UIButton(hq_title: "注册", normalBackColor: UIColor.hq_buttonBackgroundColor, highBackColor: UIColor.hq_buttonHighBackgroundColor, size: CGSize(width: UIScreen.hq_screenWidth() - margin * 2, height: height))
}

// MARK: - Target Action
extension HQRegisteSecondController {
    
    /// 提交
    @objc fileprivate func registe() {
        print(accountTextField.text ?? "")
        print(passwordTextField.text ?? "")
        
        navigationController?.popToRootViewController(animated: true)
    }
}

// MARK: - UI
extension HQRegisteSecondController {
    
    fileprivate func setupUI() {
        
        view.addSubview(backImageView)
        view.addSubview(logoImageView)
        view.addSubview(accountTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registeButton)
        
        registeButton.addTarget(self, action: #selector(registe), for: .touchUpInside)
        
        backImageView.frame = view.bounds
        logoImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).multipliedBy(0.33)
        }
        accountTextField.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(margin)
            make.right.equalTo(view).offset(-margin)
            make.height.equalTo(height)
            make.centerY.equalTo(view).multipliedBy(0.72)
        }
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(accountTextField.snp.bottom).offset(margin - 5)
            make.left.equalTo(accountTextField)
            make.right.equalTo(accountTextField)
            make.height.equalTo(accountTextField)
        }
        registeButton.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(margin / 2)
            make.right.equalTo(view).offset(-margin / 2)
            make.height.equalTo(height)
            make.centerY.equalTo(view).multipliedBy(1.52)

        }
    }
}
