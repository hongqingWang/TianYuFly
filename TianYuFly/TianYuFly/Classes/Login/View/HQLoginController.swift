//
//  HQLoginController.swift
//  HQSwiftMVVM
//
//  Created by 王红庆 on 2017/7/25.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit
import SnapKit
import SVProgressHUD

fileprivate let margin: CGFloat = 16.0
fileprivate let height: CGFloat = 40.0

class HQLoginController: HQBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor.white
        
        setupUI()
    }
    
    // MARK: - 私有控件
    /// Logo
    fileprivate lazy var logoImageView: UIImageView = UIImageView(hq_imageName: "logo")
    /// 帐号
    fileprivate lazy var accountTextField: UITextField = UITextField(hq_placeholder: "13122223333")
    fileprivate lazy var carve01: UIView = {
        let carve = UIView()
        carve.backgroundColor = UIColor.lightGray
        return carve
    } ()
    /// 密码
    fileprivate lazy var passwordTextField: UITextField = UITextField(hq_placeholder: "123456", isSecureText: true)
    fileprivate lazy var carve02: UIView = {
        let carve = UIView()
        carve.backgroundColor = UIColor.lightGray
        return carve
    }()
    /// 登录按钮
    fileprivate lazy var loginButton: UIButton = UIButton(hq_title: "登录", normalBackColor: UIColor.orange, highBackColor: UIColor.hq_color(withHex: 0xB5751F), size: CGSize(width: UIScreen.hq_screenWidth() - (margin * 2), height: height))
    /// 注册按钮
    lazy var registeButton: UIButton = UIButton(hq_title: "新用户注册", fontSize: 14, normalColor: UIColor.orange, highlightedColor: UIColor.lightGray)
    /// 忘记密码按钮
    lazy var forgetPwdButton: UIButton = UIButton(hq_title: "忘记密码", fontSize: 14, normalColor: UIColor.orange, highlightedColor: UIColor.lightGray)
}

// MARK: - Target Action
extension HQLoginController {

    /// 登录
    @objc fileprivate func login() {
        
        HQNetWorkManager.shared.loadAccessToken(account: accountTextField.text ?? "", password: passwordTextField.text ?? "") { (isSuccess) in
            
            if !isSuccess {
                
                SVProgressHUD.showInfo(withStatus: "网络请求失败")
                
            } else {
                
                // 发送登录成功的通知
                NotificationCenter.default.post(
                    name: NSNotification.Name(rawValue: HQUserLoginSuccessNotification),
                    object: nil)
                // 关闭窗口
                dismiss(animated: true, completion: nil)
            }
        }
    }
//    /// 登录
//    @objc fileprivate func login() {
//        
//        HQNetWorkManager.shared.loadAccessToken(account: accountTextField.text ?? "", password: passwordTextField.text ?? "")
//
//    }
    /// 注册
    @objc fileprivate func registe() {
        
        let vc = HQRegisteController()
        vc.navItem.title = "注册"
        navigationController?.pushViewController(vc, animated: true)
    }
    /// 忘记密码
    @objc fileprivate func forgetPassword() {
        
        let vc = HQForgetPasswordController()
        vc.navItem.title = "忘记密码"
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UI
extension HQLoginController {
    
    fileprivate func setupUI() {
        
        view.addSubview(logoImageView)
        view.addSubview(accountTextField)
        view.addSubview(carve01)
        view.addSubview(passwordTextField)
        view.addSubview(carve02)
        view.addSubview(loginButton)
        view.addSubview(registeButton)
        view.addSubview(forgetPwdButton)
        
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        registeButton.addTarget(self, action: #selector(registe), for: .touchUpInside)
        forgetPwdButton.addTarget(self, action: #selector(forgetPassword), for: .touchUpInside)
        
        logoImageView.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(margin * 7)
            make.centerX.equalTo(view)
        }
        accountTextField.snp.makeConstraints { (make) in
            make.top.equalTo(logoImageView.snp.bottom).offset(margin * 2)
            make.left.equalTo(view).offset(margin)
            make.right.equalTo(view).offset(-margin)
            make.height.equalTo(height)
        }
        carve01.snp.makeConstraints { (make) in
            make.left.equalTo(accountTextField)
            make.bottom.equalTo(accountTextField)
            make.right.equalTo(view)
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
        registeButton.snp.makeConstraints { (make) in
            make.top.equalTo(loginButton.snp.bottom).offset(margin)
            make.left.equalTo(loginButton)
        }
        forgetPwdButton.snp.makeConstraints { (make) in
            make.top.equalTo(registeButton)
            make.right.equalTo(loginButton)
        }
    }
}
