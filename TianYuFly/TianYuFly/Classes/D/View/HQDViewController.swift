//
//  HQDViewController.swift
//  HQSwiftMVVM
//
//  Created by 王红庆 on 2017/7/5.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

fileprivate let HQDCellId = "HQDCellId"

class HQDViewController: HQBaseViewController {

    

}

// MARK: - UI
extension HQDViewController {
    
    override func setupTableView() {
        super.setupTableView()
        
        tableView?.register(HQDCell.classForCoder(), forCellReuseIdentifier: HQDCellId)
    }
}
