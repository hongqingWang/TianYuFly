//
//  HQCommon.swift
//  HQSwiftMVVM
//
//  Created by 王红庆 on 2017/7/25.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

// MARK: - 全局通知定义
/// 用户需要登录通知
let HQUserShouldLoginNotification = "HQUserShouldLoginNotification"
/// 用户登录成功通知
let HQUserLoginSuccessNotification = "HQUserLoginSuccessNotification"


// MARK: - 常量
/// 边距
let margin: CGFloat = 16.0
/// Button 高度
let height: CGFloat = 40.0
/// Banner 纵坐标
let loopViewY: CGFloat = 0
/// Banner 高度
let loopViewHeight: CGFloat = 147
/// Banner 底部间距
let loopViewBottomMargin: CGFloat = 17


// MARK: - 请求接口 URLString

/// (C)消息列表
let CListUrlString = "https://api.weibo.com/2/statuses/home_timeline.json"
