//
//  HQFViewController.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/7/28.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

fileprivate let cellId = "HQFCell"

class HQFViewController: HQBaseViewController {

    fileprivate lazy var listViewModel = HQFListViewModel()
    
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

// MARK: - TableViewDataSource
extension HQFViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.fList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HQFCell
        
        let viewModel = listViewModel.fList[indexPath.row]
        
        cell.viewModel = viewModel
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
}

// MARK: - UI
extension HQFViewController {
    
    override func setupTableView() {
        super.setupTableView()
        
        tableView?.register(HQFCell.classForCoder(), forCellReuseIdentifier: cellId)
        tableView?.rowHeight = 54
    }
}
