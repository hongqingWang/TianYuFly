//
//  HQMainViewController.swift
//  HQSwiftMVVM
//
//  Created by 王红庆 on 2017/7/5.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit


fileprivate let HQPartCellIdentifier = "HQPartCellIdentifier"
fileprivate let loopViewY: CGFloat = 64
fileprivate let loopViewHeight: CGFloat = 180

class HQMainViewController: HQBaseViewController {
    
    /// 标题和图片字典数组
    var array: [[String: AnyObject]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        setupNormalView()
        /*
         写在这里控制台会有警告
         Unbalanced calls to begin/end appearance transitions for <TianYuFly.HQNavigationController: 0x7ffea4824600>
         */
        HQNetWorkManager.shared.userLogon ? () : initLoginViewController()
        title = "天羽飞训"
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//    /*
//     解决下面的警告问题,但是页面就不能被`dismiss`了
//     Unbalanced calls to begin/end appearance transitions for <TianYuFly.HQNavigationController: 0x7ffea4824600>
//     */
//        HQNetWorkManager.shared.userLogon ? () : initLoginViewController()
//    }
    
    /// Banner
    fileprivate lazy var loopView: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor.hq_randomColor()
        view.frame = CGRect(x: 0, y: loopViewY, width: UIScreen.hq_screenWidth(), height: loopViewHeight)
        return view
    }()
    
    // MARK: - Login
    @objc fileprivate func login(n: Notification) {
        
        print("用户登录通知 \(n)")
        let nav = UINavigationController(rootViewController: HQLoginController())
        present(nav, animated: true, completion: nil)
    }
    
    
    func setupNormalView() {
        
        let collectionView = HQPartCollectionView()
        collectionView.delegate = self

        array = collectionView.partArray

        view.addSubview(loopView)
        view.addSubview(collectionView)

        NotificationCenter.default.addObserver(self, selector: #selector(login), name: NSNotification.Name(rawValue: HQUserShouldLoginNotification), object: nil)
    }
    
    func initLoginViewController() {
        
        let nav = UINavigationController(rootViewController: HQLoginController())
        /*
         用此方法会有下面的警告
         Presenting view controllers on detached view controllers is discouraged <TianYuFly.HQMainViewController: 0x7ffea46061b0>
         */
//        present(nav, animated: false, completion: nil)
        /*
         解决控制台警告的问题
         */
        UIApplication.shared.delegate?.window??.rootViewController?.present(nav, animated: false, completion: nil)
    }
}

//override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
//    let touch = touches.anyObject() as UITouch
//    let point = touch.locationInView(self.view)
//    
//    if(testView.tag==100){
//        println("Tag 100")
//        testView.removeFromSuperview()
//    }
//    else{
//        println("tag not found")
//    }
//    
//}
//
//override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
//    let touch = touches.anyObject() as UITouch
//    let point = touch.locationInView(self.view)
//    
//    if let viewWithTag = self.view.viewWithTag(100) {
//        println("Tag 100")
//        viewWithTag.removeFromSuperview()
//    }
//    else {
//        println("tag not found")
//    }
//}

// MARK: - UICollectionViewDelegate
extension HQMainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.item {
        case 0:
            let vc = HQAViewController()
            vc.navItem.title = array?[indexPath.item]["title"] as? String
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = HQBViewController()
            vc.navItem.title = array?[indexPath.item]["title"] as? String
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = HQCViewController()
            vc.navItem.title = array?[indexPath.item]["title"] as? String
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = HQDViewController()
            vc.navItem.title = array?[indexPath.item]["title"] as? String
            navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = HQEViewController()
            vc.navItem.title = array?[indexPath.item]["title"] as? String
            navigationController?.pushViewController(vc, animated: true)
        case 5:
            let vc = HQFViewController()
            vc.navItem.title = array?[indexPath.item]["title"] as? String
            navigationController?.pushViewController(vc, animated: true)
        case 6:
            let vc = HQGViewController()
            vc.navItem.title = array?[indexPath.item]["title"] as? String
            navigationController?.pushViewController(vc, animated: true)
        case 7:
            let vc = HQHViewController()
            vc.navItem.title = array?[indexPath.item]["title"] as? String
            navigationController?.pushViewController(vc, animated: true)
        case 8:
            let vc = HQIViewController()
            vc.navItem.title = array?[indexPath.item]["title"] as? String
            navigationController?.pushViewController(vc, animated: true)
        case 9:
            let vc = HQJViewController()
            vc.navItem.title = array?[indexPath.item]["title"] as? String
            navigationController?.pushViewController(vc, animated: true)
        case 10:
            let vc = HQKViewController()
            vc.navItem.title = array?[indexPath.item]["title"] as? String
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}
