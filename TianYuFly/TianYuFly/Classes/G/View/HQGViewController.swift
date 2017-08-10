//
//  HQGViewController.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/7/28.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

fileprivate let cellId = "HQGCell"

class HQGViewController: HQBaseViewController {

    fileprivate lazy var listViewModel = HQGListViewModel()
    
    override func loadData() {
        listViewModel.loadData(pullup: self.isPullup) { (isSuccess, shouldRefresh) in
            
            self.refreshControl?.endRefreshing()
            self.isPullup = false
            
            if shouldRefresh {
                self.tableView?.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension HQGViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.gList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HQGCell
        
        let viewModel = listViewModel.gList[indexPath.row]
        
        cell.viewModel = viewModel
        
        return cell
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
}

// MARK: - UI
extension HQGViewController {
    
    override func setupTableView() {
        super.setupTableView()
        
        tableView?.register(HQGCell.classForCoder(), forCellReuseIdentifier: cellId)
        tableView?.rowHeight = 54
        tableView?.tableFooterView = UIView()
    }
}
