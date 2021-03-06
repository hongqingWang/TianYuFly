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
//            print("最后一条微博数据是 \(self.listViewModel.statusList.last?.text ?? "")")
            
            self.refreshControl?.endRefreshing()
            self.isPullup = false
            
            if shouldRefresh {
                self.tableView?.reloadData()
            }
        }
    }
}

// MARK: - Target Action
extension HQAViewController {
    
    @objc fileprivate func deleteToken() {
        HQNetWorkManager.shared.userAccount.token = "aa"
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true))
    }
}

// MARK: - UITableViewDataSource
extension HQAViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.aList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HQACell
        
        let viewModel = listViewModel.aList[indexPath.row]
        
        cell.viewModel = viewModel
        
        return cell
    }
    /// 重写此方法,为了滚动到最后一行不再请求加载数据
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
}

// MARK: - UITableViewDelegate
extension HQAViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let viewModel = listViewModel.aList[indexPath.row]
        let vc = HQADetailController()
        vc.navItem.title = viewModel.model.user?.screen_name
        vc.viewModel = viewModel
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UI
extension HQAViewController {
    
    /// 重写父类的方法
    override func setupTableView() {
        super.setupTableView()
        
        navItem.rightBarButtonItem = UIBarButtonItem(hq_title: "删除", target: self, action: #selector(deleteToken))
        
        tableView?.register(HQACell.classForCoder(), forCellReuseIdentifier: cellId)
        tableView?.rowHeight = 66
    }
}
