//
//  NewCustomTextField.swift
//  OBC
//
//  Created by Vinod Supnekar on 11/10/18.
//  Copyright © 2018 Loylty. All rights reserved.
//

import Foundation
import UIKit

class NewCustomTextField: UITextField {

  
    
required init?(coder coder: NSCoder) {
    super.init(coder: coder)
    
    var fr: CGRect = frame
    fr.size.height = fr.size.height + 10
    frame = fr
}
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = 0
        borderStyle = .none
//        layer.borderWidth = 0.5
//        layer.borderColor = UIColor.gray.cgColor
//        layer.backgroundColor = UIColor.white.cgColor
        
        self.setLeftPadding(10)
        self.setRightPadding(10)
        
    }

    func setLeftPadding(_ paddingValue: Int) {
        let paddingView = UIView(frame: CGRect(x: 8, y: 0, width: CGFloat(paddingValue), height: frame.size.height))
        leftView = paddingView
        leftViewMode = .always
    }
    
    func setRightPadding(_ paddingValue: Int) {
        let paddingView = UIView(frame: CGRect(x: 8, y: 0, width: CGFloat(paddingValue), height: frame.size.height))
        rightView = paddingView
        rightViewMode = .always
    }
}
extension UITextField {
    
    open override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return action == #selector(UIResponderStandardEditActions.cut) || action == #selector(UIResponderStandardEditActions.copy)
    }
}
