//
//  Extentions.swift
//  OBC
//
//  Created by Vinod Supnekar on 11/6/18.
//  Copyright © 2018 Loylty. All rights reserved.
//

import Foundation
import UIKit
//import SkyFloatingLabelTextField

//extension SkyFloatingLabelTextField{
//    
//    func initialise(placeHolder str: String) {
//        self.tintColor = UserDefaultDetails.getAppColor() // the color of the blinking cursor
//        self.textColor = UIColor.black
//        self.selectedTitleColor = UserDefaultDetails.getAppColor()
//        self.placeholder = str
//    }
//    
//}
//
//extension UIStoryboard{
//    
//    static func member()-> UIStoryboard{
//        return UIStoryboard.init(name: "MemberRegister", bundle: Bundle.main)
//    }
//}


extension String {
    
    func isEmptyString() -> Bool {
        if self != "" {
            return false
        }
        return true
    }
    
    func isContainingNumber() -> Bool {
        let numbersRange = self.rangeOfCharacter(from: .decimalDigits)
        if (numbersRange != nil) {
            return false
        }
        return true
    }
    
    func isValidEmail () -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isOnlyNumber() -> Bool {
        let numbersRange = self.rangeOfCharacter(from: .decimalDigits)
        if (numbersRange == nil) {
            return false
        }
        return true
    }
    
    func isNumeric() -> Bool {
        guard self.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self).isSubset(of: nums)
    }
    
    func is10DigitValidNumber() -> Bool {
        if self.count == 10 {
            return true
        }
        return false
    }
    
    func returnStrokeOnString() -> NSAttributedString {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
    
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
}

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }()
}

extension BinaryInteger {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}

class TextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

extension UIViewController{
    func convertDateToStringToDisplay(date : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        let date = dateFormatter.date(from:date)
        let timestamp = DateFormatter.localizedString(from: date!, dateStyle: .short, timeStyle: .short)
        print(timestamp)
        var fullDate = timestamp.components(separatedBy: " ")
        return fullDate[1] + fullDate[2]
    }
    
    func convertDateToStringToDisplayMovie(date : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        let date = dateFormatter.date(from:date)
        let timestamp = DateFormatter.localizedString(from: date!, dateStyle: .short, timeStyle: .short)
        print(timestamp)
        var fullDate = timestamp.components(separatedBy: " ")
        return fullDate[1] + fullDate[2]
    }
    
    func retriveTime(date : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: date)
        
        // To convert the date into an HH:mm format
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date!)
    }
    
    func retriveOnlyTime(date : String) -> String {
        
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let date = dateFormatter.date(from: date)!
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = tempLocale // reset the locale
        let dateString = dateFormatter.string(from: date)
        print("EXACT_DATE : \(dateString)")
        
        return dateString
    }
    
    func convertDateToString (date : Date) -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "E d, MMM"
        return dateFormatterPrint.string(from: date)
    }
    func convertDateToStringSinceRefDate(date : Date) -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatterPrint.string(from: date)
    }
    
    func convertDateToStringWithTimeStamp(date : Date) -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatterPrint.string(from: date)
    }
    func convertDateToStringWithDDMM(date : Date) -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd MMM"
        return dateFormatterPrint.string(from: date)
    }
    
    func StringToDate(dateString : String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        return dateFormatter.date(from:dateString)!
    }
    
    func StringToDateWithDDMMMFormat(dateString : String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        return dateFormatter.date(from:dateString)!
    }
    
    func convertDateToFinalString (date : Date) -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd"
        return dateFormatterPrint.string(from: date)
    }
    
    func convertDateToPassFinalString (date : Date) -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd MMM yy"
        return dateFormatterPrint.string(from: date)
    }
    
    func dateToStringWithTDateFormatter(date : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let date = dateFormatter.date(from:date)
        let timestamp = DateFormatter.localizedString(from: date!, dateStyle: .short, timeStyle: .short)
        var fullDate = timestamp.components(separatedBy: " ")
        return fullDate[1] + fullDate[2]
    }
    
    func StringToDateWithNewFormat(dateString : String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        return dateFormatter.date(from:dateString)!
    }
    
    func StringToDateWithZeroFormat(dateString : String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd 00:00:00"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        return dateFormatter.date(from:dateString)!
    }
//    func convertDateFormatter(date: String) -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"//this your string date format
//        dateFormatter.timeZone = timezo(name: "UTC") as TimeZone?
//        dateFormatter.locale = Locale(identifier: "your_loc_id")
//        let convertedDate = dateFormatter.date(from: date)
//
//        guard dateFormatter.date(from: date) != nil else {
//            assert(false, "no date from string")
//            return ""
//        }
//
//        dateFormatter.dateFormat = "yyyy MMM HH:mm EEEE"///this is what you want to convert format
//        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
//        let timeStamp = dateFormatter.string(from: convertedDate!)
//
//        return timeStamp
//    }
    
    func setNavTitle(fromLocation:String, imageName:String, toLocation: String?, subtitle:String) -> UIView {
        let fromTitle = UILabel(frame: CGRect(x: 0, y: -2, width: 0, height: 0))
        
        fromTitle.backgroundColor = UIColor.clear
        fromTitle.textColor = UIColor.white
        fromTitle.font = UIFont.boldSystemFont(ofSize: 18)
        fromTitle.text = fromLocation
        fromTitle.layer.frame.size.width = fromTitle.layer.frame.size.width + 50
        
        fromTitle.sizeToFit()
        
        var titleimageView:UIImageView?
        if imageName.count != 0 {
            let image: UIImage? = UIImage(named: imageName)!
            
            if let image = image {
                var bgImage: UIImageView?
                
                bgImage = UIImageView(image: image)
                bgImage!.frame = CGRect(x: fromTitle.layer.frame.width, y:0, width:20, height:20)
                titleimageView = bgImage
                fromTitle.addSubview(bgImage!)
            }
        }
        
        if toLocation?.count != 0 {
            let toTitleLabel:UILabel?
            
            if let titleimageView = titleimageView {
                let toTitle = UILabel(frame: CGRect(x: fromTitle.layer.frame.width + titleimageView.layer.frame.width, y: -2, width: 0, height: 0))
                toTitleLabel = toTitle
            }
            else {
                let toTitle = UILabel(frame: CGRect(x: fromTitle.layer.frame.width, y: -2, width: 0, height: 0))
                toTitleLabel = toTitle
            }
            toTitleLabel!.backgroundColor = UIColor.clear
            toTitleLabel!.textColor = UIColor.white
            toTitleLabel!.font = UIFont.boldSystemFont(ofSize: 18)
            toTitleLabel!.text = toLocation
            //toTitle.layer.frame.size.width = toTitle.layer.frame.size.width + 10
            
            toTitleLabel!.sizeToFit()
            fromTitle.addSubview(toTitleLabel!)
        }
        
        let subtitleLabel = UILabel(frame: CGRect(x: 0, y: 20, width: 0, height: 0))
        subtitleLabel.backgroundColor = UIColor.clear
        subtitleLabel.textColor = UIColor.white
        subtitleLabel.font = UIFont.systemFont(ofSize: 13)
        subtitleLabel.text = subtitle
        subtitleLabel.sizeToFit()
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: max(fromTitle.frame.size.width + 50, subtitleLabel.frame.size.width), height: 40))
        titleView.addSubview(fromTitle)
        titleView.addSubview(subtitleLabel)
        
        let widthDiff = subtitleLabel.frame.size.width - fromTitle.frame.size.width
        
        if widthDiff < 0 {
            let newX = widthDiff / 2
            subtitleLabel.frame.origin.x = abs(newX)
        }
        /*else {
         let newX = widthDiff / 2
         fromTitle.frame.origin.x = newX
         }*/
        
        return titleView
    }
    
    func GetFormatedDate(date_string:Date,dateFormat:String)-> String{
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = dateFormat
        return dateFormatterPrint.string(from: date_string)
    }
    
    func GetFormatedDateString(date_string:String,dateFormat:String)-> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = dateFormat
        
        let dateFromInputString = dateFormatter.date(from: date_string)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss" // Here you can use any dateformate for output date
        if(dateFromInputString != nil){
            return dateFormatter.string(from: dateFromInputString!)
        }
        else{
            debugPrint("could not convert date")
            return "N/A"
        }
    }
    
    func convertDurationToHoursMins(totalDuration: CGFloat) -> String {
        let hours = totalDuration / 3600
        let mins = (totalDuration.truncatingRemainder(dividingBy: 3600)) / 60
        //let secs:Int = (totalDuration % 3600) % 60
        return String(format: "%.0fh %.0fm", hours, mins)
    }
    
    func convertDurationToHours(totalDuration: CGFloat) -> CGFloat {
        let hours = totalDuration / 3600
        //let mins = (totalDuration.truncatingRemainder(dividingBy: 3600)) / 60
        return hours
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

extension UIImage {
    func toString() -> String? {
        let data: Data? = self.pngData()
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
}
public extension UIDevice {
    static let modelName: String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        func mapToDevice(identifier: String) -> String { // swiftlint:disable:this cyclomatic_complexity
            #if os(iOS)
            switch identifier {
            case "iPod5,1":                                 return "iPod Touch 5"
            case "iPod7,1":                                 return "iPod Touch 6"
            case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
            case "iPhone4,1":                               return "iPhone 4s"
            case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
            case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
            case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
            case "iPhone7,2":                               return "iPhone 6"
            case "iPhone7,1":                               return "iPhone 6 Plus"
            case "iPhone8,1":                               return "iPhone 6s"
            case "iPhone8,2":                               return "iPhone 6s Plus"
            case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
            case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
            case "iPhone8,4":                               return "iPhone SE"
            case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
            case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
            case "iPhone10,3", "iPhone10,6":                return "iPhone X"
            case "iPhone11,2":                              return "iPhone XS"
            case "iPhone11,4", "iPhone11,6":                return "iPhone XS Max"
            case "iPhone11,8":                              return "iPhone XR"
            case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
            case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
            case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
            case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
            case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
            case "iPad6,11", "iPad6,12":                    return "iPad 5"
            case "iPad7,5", "iPad7,6":                      return "iPad 6"
            case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
            case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
            case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
            case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
            case "iPad6,3", "iPad6,4":                      return "iPad Pro (9.7-inch)"
            case "iPad6,7", "iPad6,8":                      return "iPad Pro (12.9-inch)"
            case "iPad7,1", "iPad7,2":                      return "iPad Pro (12.9-inch) (2nd generation)"
            case "iPad7,3", "iPad7,4":                      return "iPad Pro (10.5-inch)"
            case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":return "iPad Pro (11-inch)"
            case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":return "iPad Pro (12.9-inch) (3rd generation)"
            case "AppleTV5,3":                              return "Apple TV"
            case "AppleTV6,2":                              return "Apple TV 4K"
            case "AudioAccessory1,1":                       return "HomePod"
            case "i386", "x86_64":                          return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))"
            default:                                        return identifier
            }
            #elseif os(tvOS)
            switch identifier {
            case "AppleTV5,3": return "Apple TV 4"
            case "AppleTV6,2": return "Apple TV 4K"
            case "i386", "x86_64": return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "tvOS"))"
            default: return identifier
            }
            #endif
        }
        
        return mapToDevice(identifier: identifier)
    }()
    
}

