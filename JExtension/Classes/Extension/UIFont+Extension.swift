//
//  UIFont+Extension.swift
//  FindNumber
//
//  Created by 靖核 on 2020/6/16.
//  Copyright © 2020 靖核. All rights reserved.
//

import UIKit

extension UIFont {
    ///细体
    class func pingFangSC_Light (size:CGFloat) -> UIFont {
        return  UIFont(descriptor: UIFontDescriptor(fontAttributes: [ UIFontDescriptor.AttributeName.name : "PingFangSC-Light" ]), size: size)
    }
    ///中黑
    class func pingFangSC_Medium (size:CGFloat) -> UIFont {
        return  UIFont(descriptor: UIFontDescriptor(fontAttributes: [ UIFontDescriptor.AttributeName.name : "PingFangSC-Medium" ]), size: size)
    }
    ///常规
    class func pingFangSC_Regular (size:CGFloat) -> UIFont {
        return  UIFont(descriptor: UIFontDescriptor(fontAttributes: [ UIFontDescriptor.AttributeName.name : "PingFangSC-Regular" ]), size: size)
    }
    ///中粗
    class func pingFangSC_Semibold (size:CGFloat) -> UIFont {
        return  UIFont(descriptor: UIFontDescriptor(fontAttributes: [ UIFontDescriptor.AttributeName.name : "PingFangSC-Semibold" ]), size: size)
    }
    ///纤细
    class func pingFangSC_Thin (size:CGFloat) -> UIFont {
        return  UIFont(descriptor: UIFontDescriptor(fontAttributes: [ UIFontDescriptor.AttributeName.name : "PingFangSC-Thin" ]), size: size)
    }
    ///极细
    class func pingFangSC_Ultralight (size:CGFloat) -> UIFont {
        return  UIFont(descriptor: UIFontDescriptor(fontAttributes: [ UIFontDescriptor.AttributeName.name : "PingFangSC-Ultralight" ]), size: size)
    }
    class func poppins_Blod (size:CGFloat) -> UIFont {
        return  UIFont(descriptor: UIFontDescriptor(fontAttributes: [ UIFontDescriptor.AttributeName.name : "Poppins" ]), size: size)
    }
}
