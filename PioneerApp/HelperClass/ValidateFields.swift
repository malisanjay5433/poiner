//
//  ValidateFields.swift
//  OBC
//
//  Created by Vinod Supnekar on 11/12/18.
//  Copyright © 2018 Loylty. All rights reserved.
//

import Foundation

class ValidateFields{
    
class func isNilOrEmpty(_ variable: Any?) -> Bool {
    
    if variable == nil {
        return true
    }
    
    if (variable is String) || (variable is String) || (variable is NSAttributedString) || (variable is NSMutableAttributedString) {
        if variable != nil {
            return false
        }
    } else if (variable is [Any]) {
        let array = variable as? [Any]
        if array != nil  {
            if (array?.count)! > 0 {
                return false
            }
        }
    } else if (variable is NSNumber) || (variable is [AnyHashable : Any]) {
        if variable != nil {
            return false
        }
    }
    return false
}
    
    class func isValidString(_ str: String?, withRegexPattern regexPattern: String?) -> Bool {
        
        var error: Error?
        let regex = try? NSRegularExpression(pattern: regexPattern ?? "", options: [])
        if !ValidateFields.isNilOrEmpty(str) {
            let array = regex?.matches(in: str ?? "", options: [], range: NSRange(location: 0, length: str?.count ?? 0))
            
            if (array?.count ?? 0) > 0 {
                return true
            }
        }
        
        return false
    }
    
    
    


}
