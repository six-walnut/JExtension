//
//  APP_Config.swift
//  DemoSwift
//
//  Created by mac on 2020/5/26.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import Foundation

let LJScreenWidth: CGFloat = UIScreen.main.bounds.width
let LJScreenHeight: CGFloat = UIScreen.main.bounds.height
/** **** 项目navi和tab配置 *** */
let isIphoneX_XS = LJScreenWidth == 375 && LJScreenHeight == 812 ? true : false
let isIphoneXR_XSMax = LJScreenWidth == 414 && LJScreenHeight == 896 ? true : false
let isFullScreen = isIphoneX_XS || isIphoneXR_XSMax
let LJ_StatusBar_Height: CGFloat = isFullScreen ? 44 : 20
let LJ_Navi_Height: CGFloat = LJ_StatusBar_Height + 44
let LJ_Tabbar_Height: CGFloat = isFullScreen ? (49+34) : 49
let LJ_TabbarSafeBottomMargin: CGFloat = isFullScreen ? 34 : 0

protocol NibLoadable {

}
extension NibLoadable where Self : UIView {
    static func loadFromNib(_ nibname : String? = nil) -> Self {
        let loadName = nibname == nil ? "\(self)" : nibname!
        return Bundle.main.loadNibNamed(loadName, owner: nil, options: nil)?.first as! Self
    }
}

@objc protocol StoryboardLoadable {}

extension StoryboardLoadable where Self: UIViewController {
    /// 提供 加载方法
    static func loadStoryboard() -> Self {
        return UIStoryboard(name: "\(self)", bundle: nil).instantiateViewController(withIdentifier: "\(self)") as! Self
    }
    static func loadStoryboard(name:String) -> Self {
        print(self)
        return UIStoryboard(name: name, bundle: nil).instantiateViewController(withIdentifier: "\(self)") as! Self
    }
}
