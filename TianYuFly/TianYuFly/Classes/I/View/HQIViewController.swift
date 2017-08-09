//
//  HQIViewController.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/7/28.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

fileprivate let cellId = "HQICell"

class HQIViewController: HQBaseViewController {

    /// 标题数组
    fileprivate lazy var titleArray: Array = ["消息提示音", "清理应用缓存"]
    /// 英文标题数组
    fileprivate lazy var englishTitleArray: Array = ["message Sound", "Clear cache"]
}

// MARK: - UITableViewDataSource
extension HQIViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HQICell
        
        cell.titleLabel.text = titleArray[indexPath.row]
        cell.englishLabel.text = englishTitleArray[indexPath.row]
        
        if indexPath.row == 0 {
            cell.messageSwitch.isHidden = false
        }
        
        return cell
    }
}

// MARK: - UI
extension HQIViewController {
    
    override func setupTableView() {
        super.setupTableView()
        tableView?.register(HQICell.classForCoder(), forCellReuseIdentifier: cellId)
        tableView?.tableFooterView = UIView()
        tableView?.isScrollEnabled = false
        tableView?.rowHeight = 54
    }
}
