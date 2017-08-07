//
//  HQCDetailViewController.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/7.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

fileprivate let cellId = "HQCDetailCell"

class HQCDetailViewController: HQBaseViewController {
    
    var viewModel: HQCViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(viewModel?.model.text)
    }
}

// MARK: - UITableViewDataSource
extension HQCDetailViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HQCDetailCell
        
        cell.viewModel = viewModel
        
        return cell
    }
}

// MARK: - UI
extension HQCDetailViewController {
    
    override func setupTableView() {
        super.setupTableView()
        
        tableView?.register(HQCDetailCell.classForCoder(), forCellReuseIdentifier: cellId)
        tableView?.estimatedRowHeight = 300
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.separatorStyle = .none
    }
}
