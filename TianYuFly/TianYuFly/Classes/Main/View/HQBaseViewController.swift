//
//  HQBaseViewController.swift
//  HQSwiftMVVM
//
//  Created by 王红庆 on 2017/7/5.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQBaseViewController: UIViewController {
    
    /// 用户不登录就不显示`tableView`
    var tableView: UITableView?
    /// 刷新控件
    var refreshControl: UIRefreshControl?
    /// 上拉刷新标记
    var isPullup = false
    
    /// 自定义导航条
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.hq_screenWidth(), height: 64))
    /// 自定义导航条目 - 以后设置导航栏内容,统一使用`navItem`
    lazy var navItem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         取消自动缩进,当导航栏遇到`scrollView`的时候,一般都要设置这个属性
         默认是`true`,会使`scrollView`向下移动`20`个点
         */
        automaticallyAdjustsScrollViewInsets = false
        
        setupUI()
        
        HQNetWorkManager.shared.userLogon ? loadData() : ()
        
        // 监听登录成功的通知
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(loginSuccess),
            name: NSNotification.Name(rawValue: HQUserLoginSuccessNotification),
            object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(
            self,
            name: NSNotification.Name(rawValue: HQUserLoginSuccessNotification),
            object: nil)
    }
    
    /// 加载数据,具体的实现由子类负责
    func loadData() {
        // 如果子类不实现任何方法,默认关闭刷新控件
        refreshControl?.endRefreshing()
    }
    
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
}

// MARK: - Target Action
extension HQBaseViewController {
    
    /// 登录成功
    @objc fileprivate func loginSuccess(n: Notification) {
        print("登录成功 \(n)")
        
//        navItem.leftBarButtonItem = nil
//        navItem.rightBarButtonItem = nil
        
        // 在访问`view`的`getter`时,如果`view` == nil,会调用`loadView()`->`viewDidLoad()`
        view = nil
        
        // 注销通知,因为重新执行`viewDidLoad()`会再次注册通知
        NotificationCenter.default.removeObserver(
            self,
            name: NSNotification.Name(rawValue: HQUserLoginSuccessNotification),
            object: nil)
    }
}

// MARK: - UI
extension HQBaseViewController {
    
    fileprivate func setupUI() {
        
        view.backgroundColor = UIColor.white
        setupNavigationBar()
        
        HQNetWorkManager.shared.userLogon ? setupTableView() : setupLoginView()
    }
    
    /// 设置 TableView
    func setupTableView() {
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.insertSubview(tableView!, belowSubview: navigationBar)
        
        // 设置数据源和代理,子类可以直接实现数据源方法
        tableView?.dataSource = self
        tableView?.delegate = self
        
        tableView?.contentInset = UIEdgeInsets(top: navigationBar.bounds.height,
                                               left: 0,
                                               bottom: 0,
//                                               bottom: tabBarController?.tabBar.bounds.height ?? 49,
                                               right: 0)
        tableView?.scrollIndicatorInsets = tableView!.contentInset
        // 设置刷新控件
        refreshControl = UIRefreshControl()
        tableView?.addSubview(refreshControl!)
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
    }
    
    /// 设置访客视图
    fileprivate func setupLoginView() {
        
    }
    
    /// 设置导航条
    fileprivate func setupNavigationBar() {
        
        view.addSubview(navigationBar)
        navigationBar.items = [navItem]
        // 设置`navigationBar`的渲染颜色
        navigationBar.barTintColor = UIColor.hq_color(withHex: 0xF6F6F6)
        
//        // 设置导航栏透明色
//        navigationBar.setBackgroundImage(UIImage(), for: .default)
//        
//        // 除去导航栏下方阴影(一条分割线)
//        navigationBar.shadowImage = UIImage()
        
        // 设置导航栏`title`的颜色
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.darkGray]
        // 设置系统`leftBarButtonItem`渲染颜色
        navigationBar.tintColor = UIColor.orange
    }
}

// MARK: - UITableViewDataSource
extension HQBaseViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    /*
     基类只是实现方法,子类负责具体的实现
     子类的数据源方法不需要`super`
     返回`UITableViewCell()`只是为了没有语法错误
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let row = indexPath.row
        let section = tableView.numberOfSections - 1
        
        if row < 0 || section < 0 {
            return
        }
        
        let count = tableView.numberOfRows(inSection: section)
        
        if row == (count - 1) && !isPullup {
            
            isPullup = true
            loadData()
        }
    }
}

// MARK: - UITableViewDelegate
extension HQBaseViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
