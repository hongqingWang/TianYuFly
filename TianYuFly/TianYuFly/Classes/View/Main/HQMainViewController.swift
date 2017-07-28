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
        title = "天羽飞训"
        
        let collectionView = HQPartCollectionView()
        collectionView.delegate = self
        
        array = collectionView.partArray
        
        view.addSubview(loopView)
        view.addSubview(collectionView)
    }
    
    /// Banner
    fileprivate lazy var loopView: UIView = {
       
        let view = UIView()
        view.backgroundColor = UIColor.hq_randomColor()
        view.frame = CGRect(x: 0, y: loopViewY, width: UIScreen.hq_screenWidth(), height: loopViewHeight)
        return view
    }()
}

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
