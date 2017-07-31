//
//  HQLoginView.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/7/31.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

fileprivate let margin: CGFloat = 16
fileprivate let buttonHeight: CGFloat = 40

class HQLoginView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        setupUI()
//        backgroundColor = UIColor.yellow
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 私有控件
    fileprivate lazy var logoImageView: UIImageView = UIImageView(hq_imageName: "logo")
    fileprivate lazy var accountTextField: UITextField = UITextField(hq_placeholder: "13122223333")
    fileprivate lazy var carve01: UIView = {
        let carve = UIView()
        carve.backgroundColor = UIColor.lightGray
        return carve
    } ()
    lazy var passwordTextField: UITextField = UITextField(hq_placeholder: "123456", isSecureText: true)
    fileprivate lazy var carve02: UIView = {
        let carve = UIView()
        carve.backgroundColor = UIColor.lightGray
        return carve
    }()
    lazy var loginButton: UIButton = UIButton(hq_title: "登录111", normalBackColor: UIColor.orange, highBackColor: UIColor.hq_color(withHex: 0xB5751F), size: CGSize(width: UIScreen.hq_screenWidth() - (margin * 2), height: buttonHeight))
}

// MARK: - 设置登录控制器界面
extension HQLoginView {
    
    fileprivate func setupUI() {
        
        addSubview(logoImageView)
        addSubview(accountTextField)
        addSubview(carve01)
        addSubview(passwordTextField)
        addSubview(carve02)
        addSubview(loginButton)
        
        logoImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(margin * 7)
            make.centerX.equalTo(self)
        }
        accountTextField.snp.makeConstraints { (make) in
            make.top.equalTo(logoImageView.snp.bottom).offset(margin * 2)
            make.left.equalTo(self).offset(margin)
            make.right.equalTo(self).offset(-margin)
            make.height.equalTo(buttonHeight)
        }
        carve01.snp.makeConstraints { (make) in
            make.left.equalTo(accountTextField)
            make.bottom.equalTo(accountTextField)
            make.right.equalTo(self)
            make.height.equalTo(0.5)
        }
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(accountTextField.snp.bottom)
            make.left.equalTo(accountTextField)
            make.right.equalTo(accountTextField)
            make.height.equalTo(accountTextField)
        }
        carve02.snp.makeConstraints { (make) in
            make.left.equalTo(carve01)
            make.bottom.equalTo(passwordTextField)
            make.right.equalTo(carve01)
            make.height.equalTo(carve01)
        }
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(margin * 2)
            make.left.equalTo(passwordTextField)
            make.right.equalTo(passwordTextField)
            make.height.equalTo(passwordTextField)
        }
    }
}
