//
//  HQCViewController.swift
//  HQSwiftMVVM
//
//  Created by 王红庆 on 2017/7/5.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

fileprivate let cellId = "HQCCell"

class HQCViewController: HQBaseViewController {

    fileprivate lazy var listViewModel = HQCListViewModel()
    
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
extension HQCViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.cList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HQCCell
        
        let viewModel = listViewModel.cList[indexPath.row]
        
        cell.viewModel = viewModel
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension HQCViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let viewModel = listViewModel.cList[indexPath.row]
        let vc = HQCDetailViewController()
        vc.navItem.title = "\(viewModel.model.id)"
        vc.viewModel = viewModel
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UI
extension HQCViewController {
    
    override func setupTableView() {
        super.setupTableView()
        
        tableView?.register(HQCCell.classForCoder(), forCellReuseIdentifier: cellId)
        tableView?.rowHeight = 66
    }
}
