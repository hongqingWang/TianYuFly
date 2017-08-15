//
//  HQBViewController.swift
//  HQSwiftMVVM
//
//  Created by 王红庆 on 2017/7/5.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

fileprivate let HQBCellId = "HQBCellId"

class HQBViewController: HQBaseViewController {

    
}

// MARK: - UITableViewDataSource
extension HQBViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HQBCellId, for: indexPath) as! HQBCell
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {}
}

// MARK: - UI
extension HQBViewController {
    
    override func setupTableView() {
        super.setupTableView()
        
        tableView?.register(HQBCell.classForCoder(), forCellReuseIdentifier: HQBCellId)
    }
}
