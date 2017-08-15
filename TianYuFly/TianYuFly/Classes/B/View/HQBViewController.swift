//
//  HQBViewController.swift
//  HQSwiftMVVM
//
//  Created by 王红庆 on 2017/7/5.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

fileprivate let HQBCellId = "HQBCellId"
fileprivate let HQBTableHeaderViewId = "HQBTableHeaderViewId"

class HQBViewController: HQBaseViewController {

    fileprivate lazy var listViewModel = HQBListViewModel()
    
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
extension HQBViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.bList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HQBCellId, for: indexPath) as! HQBCell
        
        let viewModel = listViewModel.bList[indexPath.row]
        
        cell.viewModel = viewModel
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {}
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HQBTableHeaderViewId)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
}

// MARK: - UI
extension HQBViewController {
    
    override func setupTableView() {
        super.setupTableView()
        
        tableView?.register(HQBCell.classForCoder(), forCellReuseIdentifier: HQBCellId)
        tableView?.register(HQBTableHeaderView.classForCoder(), forHeaderFooterViewReuseIdentifier: HQBTableHeaderViewId)
    }
}
