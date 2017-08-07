//
//  HQPartCollectionView.swift
//  TianYuFly
//
//  Created by 王红庆 on 2017/7/27.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

fileprivate let HQPartCellIdentifier = "HQPartCellIdentifier"

class HQPartCollectionView: UICollectionView {
    
    /// 标题和图片字典数组
    var partArray: [[String: AnyObject]]?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        
        let frame = CGRect(x: 0, y: loopViewY + loopViewHeight, width: UIScreen.hq_screenWidth(), height: UIScreen.hq_screenHeight() - loopViewHeight - loopViewY)
        
        super.init(frame: frame, collectionViewLayout: HQPartViewLayout())
        
        register(HQPartCell.classForCoder(), forCellWithReuseIdentifier: HQPartCellIdentifier)
        backgroundColor = UIColor.hq_color(withHex: 0xEDEDED)
        
        dataSource = self
        
        let partJsonPath = Bundle.main.path(forResource: "part.json", ofType: nil)
        let data = NSData(contentsOfFile: partJsonPath!)
        guard let array = try? JSONSerialization.jsonObject(with: data! as Data, options: []) as? [[String: AnyObject]]
            else {
                return
        }
        partArray = array
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UICollectionViewDataSource
extension HQPartCollectionView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return partArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HQPartCellIdentifier, for: indexPath) as! HQPartCell
        
        cell.image = UIImage(named: (partArray?[indexPath.item]["imageName"] as? String)!)
        cell.text = partArray?[indexPath.item]["title"] as? String
        
        return cell
    }
}
