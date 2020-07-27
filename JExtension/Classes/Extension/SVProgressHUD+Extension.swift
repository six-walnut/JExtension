//
//  SVProgressHUD+Extension.swift
//  FindNumber
//
//  Created by 靖核 on 2020/6/29.
//  Copyright © 2020 靖核. All rights reserved.
//

import Foundation
import SVProgressHUD

extension SVProgressHUD{
    /// 显示文字
    static func showInfo(string:String?) {
        SVProgressHUD.showInfo(withStatus: string)
        SVProgressHUD.setBackgroundLayerColor(UIColor.black)
    }
    ///状态显示 加载动画
    static func showStatus(string:String?){
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.setDefaultAnimationType(.native)
        SVProgressHUD.show(withStatus: string)
    }
    static func showWithNativeType(){
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.setDefaultAnimationType(.native)
        SVProgressHUD.show()
    }
}
