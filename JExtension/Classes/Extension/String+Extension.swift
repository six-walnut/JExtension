//
//  String+Extension.swift
//  FindNumber
//
//  Created by 靖核 on 2020/6/18.
//  Copyright © 2020 靖核. All rights reserved.
//

import UIKit
import CommonCrypto
//import SwiftyJSON

extension String{
    static let random_str_characters = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    ///随机一个10到18位的字符串
    static func randomStr() -> String{
        let len = arc4random() % 8 + 10
        var ranStr = ""
        for _ in 0..<len {
            let index = Int(arc4random_uniform(UInt32(random_str_characters.count)))
            ranStr.append(random_str_characters[random_str_characters.index(random_str_characters.startIndex, offsetBy: index)])
        }
        return ranStr
    }
    ///sha1编码
     func sha1() -> String {
            let data = self.data(using: String.Encoding.utf8)!
            var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
            CC_SHA1([UInt8](data), CC_LONG(data.count), &digest)
//            let resultBytes = Data(bytes: digest, count: Int(CC_SHA1_DIGEST_LENGTH))
//            let resultStr = resultBytes.base64EncodedString()
//            return resultStr
            //无需base64输出,装换为16进制字符串输出
            let output = NSMutableString(capacity: Int(CC_SHA1_DIGEST_LENGTH))
            for byte in digest {
                output.appendFormat("%02x", byte)
            }
            return output as String
        }
    func replacingOccurrencesForPhoneNumber() -> String {
        var phoneNub = self
        phoneNub =  phoneNub.replacingOccurrences(of: " ", with: "")
        phoneNub = phoneNub.replacingOccurrences(of: "(", with: "")
        phoneNub = phoneNub.replacingOccurrences(of: ")", with: "")
        phoneNub = phoneNub.replacingOccurrences(of: "（", with: "")
        phoneNub = phoneNub.replacingOccurrences(of: "）", with: "")
        phoneNub = phoneNub.replacingOccurrences(of: "+", with: "")
        phoneNub = phoneNub.replacingOccurrences(of: "-", with: "")
        return phoneNub
    }
    ///二进制转10进制
    func getDecimalByBinary() -> Int {
         var sum: Int = 0
         for c in self {
             let str = String(c)
             sum = sum * 2 + Int(str)!
         }
         return sum
    }
//    func getCountryPhonceCode(countryInfo:(_ code:String,_ name:String)->()){
//        if self.count == 2{
//            let path = Bundle.main.path(forResource: "LocalesModel", ofType: "json")
//            if let jsonPath = path {
//                let data = NSData(contentsOfFile: jsonPath)
//                let countryDic = try! JSON(data: data! as Data)
//                let countryArray = countryDic["locales"].arrayValue
//                for json in countryArray {
//                    if (json.dictionaryObject?["locale_code"] as? String ?? "").elementsEqual(self)  {
//                        countryInfo(json.dictionaryObject?["international_phone_area_code"] as? String ?? "+1",json.dictionaryObject?["locale_name"] as? String ?? "United States")
//                    }
//                }
//            }
//        }else{
//            countryInfo("+1","United States")
//        }
//    }
}
extension Bool{
    func toString() -> String {
        if self {
            return "1"
        }else{
            return "0"
        }
    }
}
