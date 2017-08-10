
//
//  HQGListViewModel.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/8/10.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import Foundation

/// 上拉刷新的最大次数
fileprivate let maxPullupTryTimes = 3

class HQGListViewModel {
    
    lazy var gList = [HQGViewModel]()
    
    /// 上拉刷新错误次数
    fileprivate var pullupErrorTimes = 0
    
    func loadData(pullup: Bool, completion: @escaping (_ isSuccess: Bool, _ shouldRefresh: Bool) -> ()) {
        
        if pullup && pullupErrorTimes > maxPullupTryTimes {
            
            completion(true, false)
            return
        }
        
        // 取出微博中已经加载的第一条微博(最新的一条微博)的`since_id`进行比较,对下拉刷新做处理
        let since_id = pullup ? 0 : (gList.first?.model.id ?? 0)
        // 上拉刷新,取出数组的最后一条微博`id`
        let max_id = !pullup ? 0 : (gList.last?.model.id ?? 0)
        
        HQNetWorkManager.shared.gList(since_id: since_id, max_id: max_id) { (list, isSuccess) in
            
            // 如果网络请求失败,直接执行完成回调
            if !isSuccess {
                completion(false, false)
            }
            
            // 遍历字典数组,字典->视图模型,将视图模型添加到数组
            var array = [HQGViewModel]()
            
            for dict in list ?? [] {
                // 初始化模型
                let model = HQGModel()
                
                // 字典转模型
                model.yy_modelSet(with: dict)
                
                // 使用`普通模型`创建`视图模型`
                let viewModel = HQGViewModel(model: model)
                
                // 将视图模型添加到数组
                array.append(viewModel)
            }
            
            print("刷新到 \(array.count) 条数据 \(array)")
            
            // FIXME: 拼接数据
            if pullup {
                // 上拉刷新结束后,将数据拼接在数组的末尾
                self.gList += array
                
            } else {
                // 下拉刷新结束后,将数据拼接在数组的最前面
                self.gList = array + self.gList
            }
            
            if pullup && array.count == 0 {
                
                self.pullupErrorTimes += 1
                print("这是第 \(self.pullupErrorTimes) 次 加载到 0 条数据")
                completion(isSuccess, false)
                
            } else {
                completion(isSuccess, true)
            }
        }
    }
}
