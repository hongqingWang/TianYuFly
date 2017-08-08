//
//  HQColor.swift
//  HQSwiftMVVM
//
//  Created by 王红庆 on 2017/7/7.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// 标题字体颜色
    open class var hq_titleTextColor: UIColor {
        get {
            return UIColor.hq_color(withHex: 0x25396E)
        }
    }
    /// 普通字体颜色
    open class var hq_lightTextColor: UIColor {
        get {
            return UIColor.lightGray
        }
    }
    /// 分割线颜色
    open class var hq_lineColor: UIColor {
        get {
            return UIColor.hq_color(withHex: 0xDFE6F9)
        }
    }
    /// Button 背景颜色
    open class var hq_buttonBackgroundColor: UIColor {
        get {
            return UIColor.hq_color(withHex: 0xE23348)
        }
    }
    /// Button 高亮状态背景颜色
    open class var hq_buttonHighBackgroundColor: UIColor {
        get {
            return UIColor.hq_color(withHex: 0xB82234)
        }
    }
    
    /// 随机色
    ///
    /// - Returns: 随机的颜色
    class func hq_randomColor() -> UIColor {
        
        let r = CGFloat(arc4random() % 256) / 255.0
        let g = CGFloat(arc4random() % 256) / 255.0
        let b = CGFloat(arc4random() % 256) / 255.0
        
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    /// 十六进制颜色
    ///
    /// - Parameter withHex: 0xFFFFFF
    /// - Returns: color
    class func hq_color(withHex: UInt32) -> UIColor {
        
        let r = ((CGFloat)((withHex & 0xFF0000) >> 16)) / 255.0
        let g = ((CGFloat)((withHex & 0xFF00) >> 8)) / 255.0
        let b = ((CGFloat)(withHex & 0xFF)) / 255.0
        
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    /// 0~255 颜色
    ///
    /// - Parameters:
    ///   - withRed: red(0~255)
    ///   - green: green(0~255)
    ///   - blue: blue(0~255)
    /// - Returns: color
    class func hq_color(withRed: UInt8, green: UInt8, blue: UInt8) -> UIColor {
        
        let r = CGFloat(withRed) / 255.0
        let g = CGFloat(green) / 255.0
        let b = CGFloat(blue) / 255.0
        
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}
