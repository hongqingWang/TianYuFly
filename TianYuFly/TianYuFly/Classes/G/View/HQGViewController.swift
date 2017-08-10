//
//  HQGViewController.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/7/28.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

fileprivate let cellId = "HQGCell"

class HQGViewController: HQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

// MARK: - UITableViewDataSource
extension HQGViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        return cell
    }
}

// MARK: - UI
extension HQGViewController {
    
    override func setupTableView() {
        super.setupTableView()
        
        tableView?.register(HQGCell.classForCoder(), forCellReuseIdentifier: cellId)
        tableView?.rowHeight = 54
        tableView?.tableFooterView = UIView()
    }
}
