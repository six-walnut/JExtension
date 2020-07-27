//
//  UIViewController+Extension.swift
//  CallRecording
//
//  Created by 靖核 on 2020/7/14.
//  Copyright © 2020 靖核. All rights reserved.
//

import UIKit

extension UIViewController{
    func showAlert(title:String,sure:(()->())? = nil) {
        let sheet = UIAlertController(title: "", message: title, preferredStyle: .actionSheet)
        let ok = UIAlertAction(title: "Delete", style: .destructive) { action in
            sure?()
               }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { action in
        }
        sheet.addAction(ok)
        sheet.addAction(cancel)
        UIApplication.shared.keyWindow?.rootViewController?.present(sheet, animated: true, completion: nil)
    }
}
