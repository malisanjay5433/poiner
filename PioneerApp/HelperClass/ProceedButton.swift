////
////  ProceedButton.swift
////  OBC
////
////  Created by Vinod Supnekar on 11/5/18.
////  Copyright © 2018 Loylty. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//
//class ProceedButton: UIButton {
//
//    override func awakeAfter(using aDecoder: NSCoder) -> Any? {
//        return self.loadFromNibIfEmbeddedInDifferentNib()
//    }
//}
//
//extension UIView {
//    func loadFromNibIfEmbeddedInDifferentNib() -> Self {
//        let isJustAPlaceholder = subviews.count == 0
//        if isJustAPlaceholder {
//            let theRealThing = type(of: self).viewFromNib()
//            theRealThing.frame = frame
//            translatesAutoresizingMaskIntoConstraints = false
//            theRealThing.translatesAutoresizingMaskIntoConstraints = false
//            return theRealThing
//        }
//        return self
//    }
//}
