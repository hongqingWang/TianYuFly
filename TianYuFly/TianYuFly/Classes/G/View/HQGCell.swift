//
//  HQGCell.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/10.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQGCell: UITableViewCell {

    var viewModel: HQGViewModel? {
        didSet {
            sujectLabel.text = "考试地点 : \(viewModel?.model.idstr ?? "")"
            areaLabel.text = "考试地点 : \(viewModel?.model.idstr ?? "")"
            timeLabel.text = "考试时间 : \(viewModel?.model.idstr ?? "")"
            resultLabel.text = "考试成绩 : \(viewModel?.model.idstr ?? "")"
        }
    }
    
    /// 考试科目
    fileprivate lazy var sujectLabel: UILabel = UILabel(hq_title: "考试科目 : A320ZZZ科目第一次考试", fontSize: 12, color: UIColor.hq_titleTextColor)
    /// 考试地点
    fileprivate lazy var areaLabel: UILabel = UILabel(hq_title: "考试地点 : 海口XXXX  ", fontSize: 12, color: UIColor.hq_titleTextColor)
    /// 考试时间
    fileprivate lazy var timeLabel: UILabel = UILabel(hq_title: "考试时间 : 2016-10-XX ", fontSize: 12, color: UIColor.hq_titleTextColor)
    /// 考试成绩
    fileprivate lazy var resultLabel: UILabel = UILabel(hq_title: "考试成绩 : 合格", fontSize: 12, color: UIColor.hq_titleTextColor)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI
extension HQGCell {
    
    fileprivate func setupUI() {
        
        addSubview(sujectLabel)
        addSubview(areaLabel)
        addSubview(timeLabel)
        addSubview(resultLabel)
        
        sujectLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(margin)
            make.centerY.equalTo(self).multipliedBy(0.7)
        }
        areaLabel.snp.makeConstraints { (make) in
            make.left.equalTo(sujectLabel)
            make.centerY.equalTo(self).multipliedBy(1.5)
        }
        timeLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self).multipliedBy(1.6)
            make.centerY.equalTo(sujectLabel)
        }
        resultLabel.snp.makeConstraints { (make) in
            make.left.equalTo(timeLabel)
            make.centerY.equalTo(areaLabel)
        }
    }
}
