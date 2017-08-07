//
//  HQADetailController.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/4.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

fileprivate let cellId = "HQADetaiCell"

class HQADetailController: HQBaseViewController {

    /// 接收上一个页面的`viewModel`的属性
    var viewModel: HQAViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(viewModel?.model.text ?? "")
    }
}

// MARK: - UITableViewDataSource
extension HQADetailController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HQADetaiCell
        
        cell.viewModel = viewModel
        
        return cell
        
    }
}

// MARK: - UI
extension HQADetailController {
    
    override func setupTableView() {
        super.setupTableView()
        
        tableView?.register(HQADetaiCell.classForCoder(), forCellReuseIdentifier: cellId)
        tableView?.estimatedRowHeight = 300
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.separatorStyle = .none
    }
}
