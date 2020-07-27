//
//  UIImage+Extension.swift
//  FindNumber
//
//  Created by 靖核 on 2020/6/19.
//  Copyright © 2020 靖核. All rights reserved.
//

import UIKit
extension UIImage{
    class func Create(size:CGSize,color : UIColor,alpha:CGFloat? = 1) -> UIImage{
           UIGraphicsBeginImageContext(size)
           color.setFill()
           let bounds = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
           UIRectFill(bounds)
           UIImage().draw(in: bounds, blendMode: CGBlendMode.destinationIn, alpha: alpha ?? 1)
           let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
           UIGraphicsEndImageContext()
           return tintedImage!
       }
    
}
