//
//  HQJViewController.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/7/28.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

fileprivate let cellId = "HQJCell"
fileprivate let cellNormalId = "cellNormalId"

class HQJViewController: HQBaseViewController {

    fileprivate lazy var titleArr: Array = ["应用介绍", "天羽介绍", "承建商介绍"]
}

extension HQJViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: cellNormalId, for: indexPath)
            cell.textLabel?.text = titleArr[indexPath.row - 1]
            return cell
        }
    }
}

// MARK: - UI
extension HQJViewController {
    
    override func setupTableView() {
        super.setupTableView()
        
        tableView?.register(HQJCell.classForCoder(), forCellReuseIdentifier: cellId)
        tableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellNormalId)
        tableView?.tableFooterView = UIView()
        tableView?.isScrollEnabled = false
    }
}
