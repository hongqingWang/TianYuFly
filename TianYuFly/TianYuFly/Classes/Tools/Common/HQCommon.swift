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
let margin: CGFloat = 20
/// Button 高度
let height: CGFloat = 44
/// Banner 纵坐标
let loopViewY: CGFloat = 0
/// Banner 高度
let loopViewHeight: CGFloat = 147
/// Banner 底部间距
let loopViewBottomMargin: CGFloat = 5
/// 首页 item 宽度
let itemW: CGFloat = (UIScreen.hq_screenWidth() - 2) / 3
/// 首页 item 高度
let itemH: CGFloat = 100
/// 导航栏高度
let navHeight: CGFloat = 64



// MARK: - 请求接口 URLString
/// (C)消息列表
let CListUrlString = "https://api.weibo.com/2/statuses/home_timeline.json"
/// (E)训练记录
let EListUrlString = "https://api.weibo.com/2/statuses/home_timeline.json"
/// (F)满意度调查
let FListUrlString = "https://api.weibo.com/2/statuses/home_timeline.json"
/// (G)考试成绩
let GListUrlString = "https://api.weibo.com/2/statuses/home_timeline.json"
/// (H)我的信息
let HListUrlString = "https://api.weibo.com/2/statuses/home_timeline.json"
