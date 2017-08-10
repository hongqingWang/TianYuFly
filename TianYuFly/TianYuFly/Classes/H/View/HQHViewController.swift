//
//  HQHViewController.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/7/28.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

fileprivate let avatarCellId = "HQAvatarCell"
fileprivate let cellId = "HQHCell"
fileprivate let logoutCellId = "HQHLogoutCell"

class HQHViewController: HQBaseViewController {
    
    /// 标题和英文标题字典数组
    fileprivate var cellArray: [[String: AnyObject]]?
    fileprivate lazy var listViewModel = HQHListViewModel()
    
    var avatarCell: HQAvatarCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonPath = Bundle.main.path(forResource: "me.json", ofType: nil)
        let data = NSData(contentsOfFile: jsonPath!)
        guard let array = try? JSONSerialization.jsonObject(with: data! as Data, options: []) as? [[String: AnyObject]]
            else {
                return
        }
        cellArray = array
    }
    
    override func loadData() {
        listViewModel.loadProfileInfo(pullup: self.isPullup) { (isSuccess, shouldRefresh) in
            
            self.refreshControl?.endRefreshing()
            self.isPullup = false
            
            // MARK: - 在这里处理接收到数据的业务逻辑
            let viewModel = self.listViewModel.hList[0]
            
            self.avatarCell?.viewModel = viewModel
            
            if shouldRefresh {
                self.tableView?.reloadData()
            }
        }
    }
}

// MARK: - UITabelViewDataSource
extension HQHViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return listViewModel.hList.count

        if section == 0 || section == 2 {
            return 1
        } else {
            return cellArray?.count ?? 0
//            return listViewModel.hList.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HQHCell
////        print("aaaa\(listViewModel.hList)")
//        let viewModel = listViewModel.hList[indexPath.row]
//        cell.viewModel = viewModel
//        return cell
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: avatarCellId, for: indexPath) as! HQAvatarCell
            
            avatarCell = cell
            
            //            print("aaaa\(listViewModel.hList)")
//            let viewModel = listViewModel.hList[indexPath.section]
//            cell.viewModel = viewModel
            return cell
            
        }
        if indexPath.section == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: logoutCellId, for: indexPath)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HQHCell
        cell.titleLabel.text = cellArray?[indexPath.row]["title"] as? String
        cell.englishLabel.text = cellArray?[indexPath.row]["englishTitle"] as? String
        return cell
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
}

// MARK: - UITableViewDelegate
extension HQHViewController {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 74
        } else if indexPath.section == 2 {
            return 100
        } else {
            return 54
        }
    }
}

// MARK: - UI
extension HQHViewController {
    
    override func setupTableView() {
        super.setupTableView()
        
        tableView?.register(HQAvatarCell.classForCoder(), forCellReuseIdentifier: avatarCellId)
        tableView?.register(HQHCell.classForCoder(), forCellReuseIdentifier: cellId)
        tableView?.register(HQLogoutCell.classForCoder(), forCellReuseIdentifier: logoutCellId)
        tableView?.tableFooterView = UIView()
        tableView?.showsVerticalScrollIndicator = false
        tableView?.separatorStyle = .none
    }
}
