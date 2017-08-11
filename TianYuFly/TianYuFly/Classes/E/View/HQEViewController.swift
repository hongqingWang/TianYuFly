//
//  HQEViewController.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/7/28.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

fileprivate let cellId = "HQECell"

class HQEViewController: HQBaseViewController {

    fileprivate lazy var listViewModel = HQEListViewModel()
    
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

// MARK: - UITableViewDelegate
extension HQEViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.eList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HQECell
        
        let viewModel = listViewModel.eList[indexPath.row]
        
        cell.viewModel = viewModel
        
        return cell
    }
}

// MARK: - UI
extension HQEViewController {
    
    override func setupTableView() {
        super.setupTableView()
        
        tableView?.register(HQECell.classForCoder(), forCellReuseIdentifier: cellId)
        tableView?.rowHeight = 74
    }
}
