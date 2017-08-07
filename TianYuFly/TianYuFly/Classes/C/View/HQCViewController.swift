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

    

}

// MARK: - UITableViewDataSource
extension HQCViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        return cell
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
