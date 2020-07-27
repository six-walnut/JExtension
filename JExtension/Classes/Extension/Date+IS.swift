//
//  Date+IS.swift
//  ImageSearch
//
//  Created by mac on 2020/6/3.
//  Copyright © 2020 mac. All rights reserved.
//
import Foundation
import UIKit

extension Date {
    
    /// 获取当前 秒级 时间戳 - 10位
    var timeStamp : String {
        let timeInterval: TimeInterval = self.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        return "\(timeStamp)"
    }
    
    /// 获取当前 毫秒级 时间戳 - 13位
    var milliStamp : String {
        let timeInterval: TimeInterval = self.timeIntervalSince1970
        let millisecond = CLongLong(round(timeInterval*1000))
        return "\(millisecond)"
    }
    //将时间戳转换为具体时间
    static func timeStampToStringDetail(_ timeStamp:String)->String {
        let string = NSString(string: timeStamp)
        var timeSta:TimeInterval = 0
        if string.length > 10 {
            timeSta = string.doubleValue/1000
        }else{
            timeSta = string.doubleValue 
        }
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="MM.dd.yyyy"
        let date = Date(timeIntervalSince1970: timeSta)
        return dfmatter.string(from: date)
    }
    //将时间转换为时间戳
    static func stringToTimeStamp(_ stringTime:String)->Int {
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        dfmatter.locale = Locale.current
        let date = dfmatter.date(from: stringTime)
        let dateStamp:TimeInterval = date!.timeIntervalSince1970
        let dateSt:Int = Int(dateStamp)
        return dateSt
    }
    /// 根据本地时区转换
    static func getLocalDateFormateUTCDate( _ utcStr:String)->String{
        let localISOFormatter = ISO8601DateFormatter()
        localISOFormatter.timeZone = TimeZone.current
        let localDate = localISOFormatter.date(from: utcStr)
        let dateStamp:TimeInterval = localDate!.timeIntervalSince1970
        let dateSt:Int = Int(dateStamp) * 1000
        return "\(dateSt)"
    }
    static func timeStampToString(timeStamp:String,fmatter:String)->String {
        let string =  NSString(string: NSString(string: timeStamp).substring(to: 10))
        let timeSta:TimeInterval = string.doubleValue
        let dfmatter = DateFormatter()
        dfmatter.dateFormat=fmatter
        let date = Date(timeIntervalSince1970: timeSta)
        return dfmatter.string(from: date)
    }
    static func timeStampToYYMMDDHHmmSS(_ timeStamp:String)->String {
        let string = NSString(string: timeStamp)
        var timeSta:TimeInterval = 0
        if string.length > 10 {
            timeSta = string.doubleValue/1000
        }else{
            timeSta = string.doubleValue
        }
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="yyyy-MM-dd HH:mm:ss"
        let date = Date(timeIntervalSince1970: timeSta)
        return dfmatter.string(from: date)
    }
//    //MARK: 时间字符串转date
//    static func timeStringToDate(_ dateStr:String) ->Date {
//        let dateFormatter = DateFormatter()
//        //        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
//        dateFormatter.dateFormat = "yyyy-MM-dd  HH:mm:ss"
//        let date
//            = dateFormatter.date(from: NSString(string: NSString(string: dateStr).substring(to: 10)) as String)
//        return date ?? Date()
//    }
    ///MARK: 计算时间差
    static func compareTime(startTime:String,endTime:String) -> String {
//        let stimeDate = self.timeStringToDate(startTime)
//        let etimeDate = self.timeStringToDate(endTime)
        let timeInterval = (Float(endTime) ?? 0)/1000 - (Float(startTime) ?? 0)/1000
        return self.transToHourMinSec(time:Float(timeInterval))
    }
    static func transToHourMinSec(time: Float) -> String
    {
        let allTime: Int = Int(time)
        var hours = 0
        var minutes = 0
        var seconds = 0
        var hoursText = ""
        var minutesText = ""
        var secondsText = ""
        hours = allTime / 3600
        hoursText = hours > 9 ? "\(hours)" : "0\(hours)"
        minutes = allTime % 3600 / 60
        minutesText = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        seconds = allTime % 3600 % 60
        secondsText = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        return "\(hoursText):\(minutesText):\(secondsText)"
    }

}
extension UIView{
    func viewWithTag(tag:Int) -> UIView? {
        if self.tag == tag {
            return self
        }
        for subview in self.subviews {
            if subview.tag == tag{
                return subview
            }
        }
        return nil
    }
    public func addGradientLayer(
            start: CGPoint = CGPoint(x: 0, y: 0), //渐变起点
            end: CGPoint = CGPoint(x: 1, y: 1), //渐变终点
            frame: CGRect,
            colors: [CGColor]
        ) {
            layoutIfNeeded()
            removeGradientLayer()
            let gradientLayer = CAGradientLayer()
            gradientLayer.startPoint = start
            gradientLayer.endPoint = end
            gradientLayer.frame = frame
            gradientLayer.colors = colors
            layer.insertSublayer(gradientLayer, at: 0)
        }
        
        public func removeGradientLayer() {
            guard let layers = self.layer.sublayers else { return }
            for layer in layers {
                if layer.isKind(of: CAGradientLayer.self) {
                    layer.removeFromSuperlayer()
                }
            }
        }
}
