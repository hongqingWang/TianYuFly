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
    
    /// 头像 Cell
    fileprivate var avatarCell: HQAvatarCell?
    
    /// 性别 Label
    fileprivate var genderLabel: UILabel?
    /// 机构名称 Label
    fileprivate var organizationLabel: UILabel?
    /// 职位 Label
    fileprivate var positionLabel: UILabel?
    /// 技术级别 Label
    fileprivate var techRankLabel: UILabel?
    /// 手机号码 Label
    fileprivate var phoneLabel: UILabel?
    /// 邮箱地址 Label
    fileprivate var mailLabel: UILabel?
    
    fileprivate var logoutCell: HQLogoutCell?
    
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
            
            self.genderLabel?.text = viewModel.model.idstr
            self.organizationLabel?.text = viewModel.model.text
            self.positionLabel?.text = viewModel.model.idstr
            self.techRankLabel?.text = viewModel.model.text
            self.phoneLabel?.text = viewModel.model.idstr
            self.mailLabel?.text = viewModel.model.text
            
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

        if section == 0 || section == 2 {
            return 1
        } else {
            return cellArray?.count ?? 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: avatarCellId, for: indexPath) as! HQAvatarCell
            avatarCell = cell
            return cell
            
        }
        if indexPath.section == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: logoutCellId, for: indexPath) as! HQLogoutCell
            logoutCell = cell
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HQHCell
        cell.titleLabel.text = cellArray?[indexPath.row]["title"] as? String
        cell.englishLabel.text = cellArray?[indexPath.row]["englishTitle"] as? String
        
        if indexPath.row == 0 {
            genderLabel = cell.detailLabel
        } else if indexPath.row == 1 {
            organizationLabel = cell.detailLabel
        } else if indexPath.row == 2 {
            positionLabel = cell.detailLabel
        } else if indexPath.row == 3 {
            techRankLabel = cell.detailLabel
        } else if indexPath.row == 4 {
            phoneLabel = cell.detailLabel
        } else if indexPath.row == 5 {
            mailLabel = cell.detailLabel
        } else {
            cell.detailLabel.isHidden = true
        }
        
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
