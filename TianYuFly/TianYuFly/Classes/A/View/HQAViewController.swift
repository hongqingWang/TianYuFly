//
//  HQAViewController.swift
//  HQSwiftMVVM
//
//  Created by 王红庆 on 2017/7/5.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

fileprivate let cellId = "HQACell"

class HQAViewController: HQBaseViewController {
    
    fileprivate lazy var listViewModel = HQAListViewModel()
    
    /// 加载数据
    override func loadData() {
        listViewModel.loadStatus(pullup: self.isPullup) { (isSuccess, shouldRefresh) in
            print("最后一条微博数据是 \(self.listViewModel.statusList.last?.text ?? "")")
            
            self.refreshControl?.endRefreshing()
            self.isPullup = false
            
            if shouldRefresh {
                self.tableView?.reloadData()
            }
        }
    }
}

// MARK: - tableViewDataSource
extension HQAViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.statusList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HQACell
//        cell.textLabel?.text = listViewModel.statusList[indexPath.row].text
        return cell
    }
}

// MARK: - Target Action
extension HQAViewController {
    
    @objc fileprivate func deleteToken() {
        HQNetWorkManager.shared.userAccount.token = "aaa"
    }
}

// MARK: - UI
extension HQAViewController {
    
    /// 重写父类的方法
    override func setupTableView() {
        super.setupTableView()
        
//        tableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellId)
        tableView?.register(HQACell.classForCoder(), forCellReuseIdentifier: cellId)
        tableView?.rowHeight = 66
    }
}
