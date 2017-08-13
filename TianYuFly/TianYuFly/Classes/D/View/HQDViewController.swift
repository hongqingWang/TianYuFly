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

    fileprivate lazy var listViewModel = HQDListViewModel()
    
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
extension HQDViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.dList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HQDCellId, for: indexPath) as! HQDCell
        
        let viewModel = listViewModel.dList[indexPath.row]
        
        cell.viewModel = viewModel
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {}
}

// MARK: - UI
extension HQDViewController {
    
    override func setupTableView() {
        super.setupTableView()
        
        tableView?.register(HQDCell.classForCoder(), forCellReuseIdentifier: HQDCellId)
        tableView?.rowHeight = 66
    }
}
