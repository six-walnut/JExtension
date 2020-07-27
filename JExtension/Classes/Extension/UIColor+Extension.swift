//
//  UIColor+Extension.swift
//  FindNumber
//
//  Created by 靖核 on 2020/6/16.
//  Copyright © 2020 靖核. All rights reserved.
//

import UIKit

extension UIColor {
    // MARK:- HexString以#、0X开头
    class func colorWithHexColorString(_ color: String, alpha: CGFloat) -> UIColor {
        let whitespace = NSCharacterSet.whitespacesAndNewlines
        var cString = color.trimmingCharacters(in: whitespace).uppercased()
        
        let len = cString.count
        
        if len < 6 {
            return UIColor.clear
        }
        
        
        if cString.hasPrefix("0X") {
            
            cString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 2))
        }
        
        
        if cString.hasPrefix("#") {
            let start = cString.index(cString.startIndex, offsetBy: 1)
            cString = cString.substring(from: start)
        }
        
        
        if cString.count != 6 {
            return UIColor.clear
        }
        
        var range: NSRange = NSMakeRange(0, 2)
        
        
        let myNSString = cString as NSString
        
        let rString = myNSString.substring(with: range)
        
        range.location = 2
        let gString = myNSString.substring(with: range)
        
        range.location = 4
        let bString = myNSString.substring(with: range)
        
        
        var r: UInt32 = 0
        var g: UInt32 = 0
        var b: UInt32 = 0
        
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        //        print("r:\(r)--g:\(g)--b:\(b)")
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
        
        
    }
    
    class func colorWithHexColorString(_ color: String) -> UIColor {
        
        return colorWithHexColorString(color, alpha: 1.0)
        
    }
    
    
    
}
extension CALayer {
    @IBInspectable
        var borderUIColor: UIColor {
            get {
                return UIColor(cgColor: self.borderColor!)
            } set {
                self.borderColor = newValue.cgColor
            }
        }
    
}
