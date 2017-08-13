//
//  HQECell.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/11.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQECell: UITableViewCell {
    
    var viewModel: HQEViewModel? {
        didSet {
            titleLabel.text = "\(viewModel?.model.idstr ?? "")"
            timeLabel.text = "训练周期 \(viewModel?.model.idstr ?? "")"
            certificateButton.setTitle("\(viewModel?.model.idstr ?? "")", for: .normal)
            resultLable.text = "训练成绩 : \(viewModel?.model.idstr ?? "")"
            dataButton.setTitle("\(viewModel?.model.idstr ?? "")", for: .normal)
        }
    }
    
    /// 训练项目
    fileprivate lazy var titleLabel: UILabel = UILabel(hq_title: "理论训练 A320 初始改装", fontSize: 13, color: UIColor.hq_titleTextColor)
    /// 训练周期
    fileprivate lazy var timeLabel: UILabel = UILabel(hq_title: "训练周期 2017-5-1X －2017-5-XX", fontSize: 11, color: UIColor.hq_lightTextColor)
    fileprivate lazy var certificateLable: UILabel = UILabel (hq_title: "训练证书 :", fontSize: 11, color: UIColor.hq_lightTextColor)
    /// 训练证书
    lazy var certificateButton: UIButton = UIButton(hq_title: "已印发", fontSize: 11, normalColor: UIColor.hq_titleTextColor, highlightedColor: UIColor.hq_lightTextColor)
    /// 训练成绩
    fileprivate lazy var resultLable: UILabel = UILabel (hq_title: "训练成绩 : XXXXX", fontSize: 11, color: UIColor.hq_lightTextColor)
    fileprivate lazy var dataLable: UILabel = UILabel (hq_title: "训练资料 : ", fontSize: 11, color: UIColor.hq_lightTextColor)
    /// 训练资料
    lazy var dataButton: UIButton = UIButton(hq_title: "未上传，点击上传", fontSize: 11, normalColor: UIColor.hq_titleTextColor, highlightedColor: UIColor.hq_lightTextColor)
    
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
extension HQECell {
    
    fileprivate func setupUI() {
        
        addSubview(titleLabel)
        addSubview(timeLabel)
        addSubview(certificateLable)
        addSubview(certificateButton)
        addSubview(resultLable)
        addSubview(dataLable)
        addSubview(dataButton)
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(margin / 2)
            make.left.equalTo(self).offset(margin)
        }
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(margin / 4)
            make.left.equalTo(titleLabel)
        }
        certificateLable.snp.makeConstraints { (make) in
            make.top.equalTo(timeLabel.snp.bottom).offset(margin / 4)
            make.left.equalTo(timeLabel)
        }
        certificateButton.snp.makeConstraints { (make) in
            make.left.equalTo(certificateLable.snp.right).offset(margin / 4)
            make.centerY.equalTo(certificateLable)
        }
        resultLable.snp.makeConstraints { (make) in
            make.centerX.equalTo(self).multipliedBy(1.4)
            make.centerY.equalTo(timeLabel)
        }
        dataLable.snp.makeConstraints { (make) in
            make.left.equalTo(resultLable)
            make.centerY.equalTo(certificateLable)
        }
        dataButton.snp.makeConstraints { (make) in
            make.left.equalTo(dataLable.snp.right).offset(margin / 4)
            make.centerY.equalTo(dataLable)
        }
    }
}
