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

}

// MARK: - UITableViewDataSource
extension HQDViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HQDCellId, for: indexPath) as! HQDCell
        
        return cell
    }
}

// MARK: - UI
extension HQDViewController {
    
    override func setupTableView() {
        super.setupTableView()
        
        tableView?.register(HQDCell.classForCoder(), forCellReuseIdentifier: HQDCellId)
        tableView?.rowHeight = 66
    }
}
