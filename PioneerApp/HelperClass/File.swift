//
//  File.swift
//  L42Apps
//
//  Created by Sanjay Mali on 13/12/18.
//  Copyright © 2018 LoyltyRewardz. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {
    static var myAppRed: UIColor {
        return UIColor(red: 1, green: 0.1, blue: 0.1, alpha: 1)
    }
    static var myAppGreen: UIColor {
        return UIColor(red: 0, green: 1, blue: 0, alpha: 1)
    }
    static var myAppBlue: UIColor {
        return UIColor(red: 0, green: 0.2, blue: 0.9, alpha: 1)
    }
    static var appColor_OBC: UIColor {
        return UIColor(red: 77/255, green:184/255, blue:72/255, alpha: 1)
    }
    static var appColor_CORP: UIColor {
         let appColor = AppColor.hexStringToUIColor(hex:"008236")
         return appColor
    }
    
    static var appColor_OBC_white: UIColor {
        return UIColor.white
    }
    static var appColor_PHFL: UIColor {
        return UIColor(red: 0, green: 0.2, blue: 0.9, alpha: 1)
    }
    static var appColor_LVB: UIColor {
        return UIColor(red: 0, green: 0.2, blue: 0.9, alpha: 1)
    }
    static var appColor_L42Apps: UIColor {
        return UIColor(red: 0, green: 0.2, blue: 0.9, alpha: 1)
    }
    static var appColor_mPoint: UIColor {
        return UIColor(red: 0, green: 0.2, blue: 0.9, alpha: 1)
    }
    static var appBlueColor: UIColor {
        return UIColor.blue
    }
    static var offWhite:UIColor{
        return UIColor(red:239/255, green:239/255, blue:244/255, alpha:1.0)
    }
}

extension UIFont {
    static var navigationTitle_Size_22: UIFont {
        return UIFont.init(name:"AvenirNext-DemiBold", size: 22.0)!
    }
    static var AvenirNext_DemiBold_17: UIFont {
        return UIFont.init(name:"AvenirNext-DemiBold", size: 17)!
    }
    
    static var AvenirNext_DemiBold_14: UIFont {
        return UIFont.init(name:"AvenirNext-DemiBold", size: 14)!
    }
    static var AvenirNext_Regular_17: UIFont {
        return UIFont.init(name:"AvenirNext-Regular", size: 17.0)!
    }
    static var AvenirNext_Regular_12: UIFont {
        return UIFont.init(name:"AvenirNext-Regular", size: 12.0)!
    }
    static var AvenirNext_Regular_15: UIFont {
        return UIFont.init(name:"AvenirNext-Regular", size: 15.0)!
    }
}
