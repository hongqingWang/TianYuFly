//
//  HQPartViewLayout.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/7/27.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

fileprivate let itemW: CGFloat = (UIScreen.hq_screenWidth() - 3) / 4
fileprivate let itemH: CGFloat = itemW

class HQPartViewLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        
        itemSize = CGSize(width: itemW, height: itemH)
        minimumInteritemSpacing = 1
        minimumLineSpacing = 1
    }
}
