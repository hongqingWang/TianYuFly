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

// MARK: - Target Action
extension HQEViewController {
    
    /// 查看证书
    @objc fileprivate func lookCertificate() {
    
        let vc = HQELookCertificateController()
        vc.navItem.title = "训练证书"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    /// 上传图片
    @objc fileprivate func uploadPhoto() {
        
        let vc = HQELookCertificateController()
        vc.navItem.title = "训练资料详情"
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UITableViewDelegate
extension HQEViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.eList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HQECell
        
        cell.certificateButton.addTarget(self, action: #selector(lookCertificate), for: .touchUpInside)
        cell.dataButton.addTarget(self, action: #selector(uploadPhoto), for: .touchUpInside)
        
        let viewModel = listViewModel.eList[indexPath.row]
        
        cell.viewModel = viewModel
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
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
