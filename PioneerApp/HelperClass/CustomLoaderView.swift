//
//  CustomLoaderView.swift
//  OBC
//
//  Created by Vinod Supnekar on 11/13/18.
//  Copyright © 2018 Loylty. All rights reserved.
//

import Foundation
import UIKit
class CustomLoaderView: UIView {
var indicatorView: UIActivityIndicatorView?
static let customLoader = CustomLoaderView()
    
private convenience init() {
    let width = 40
    self.init(frame: CGRect(x: 0, y: 0, width: width, height: 40))
}

    override init(frame: CGRect) {
    super.init(frame: frame)
    
    // Initialization code
        indicatorView = UIActivityIndicatorView.init(style: .white)
        
        indicatorView?.frame = CGRect(x: 0.0, y: 0.0, width: 80, height: 80)
        indicatorView?.backgroundColor = UIColor.black
        indicatorView?.alpha = 0.5
        indicatorView?.layer.cornerRadius = 15
    
        addSubview(indicatorView!)
    
}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    
    class func showLoadingView() {
        let loadingView = CustomLoaderView.customLoader
        
        let keyWindow: UIWindow? = UIApplication.shared.keyWindow
        if let aWindow = keyWindow {
            UIView.transition(with: aWindow, duration: 0.3, options: .transitionCrossDissolve, animations: {
                keyWindow?.addSubview(loadingView)
            }) { finished in
                
            }
        }
        
    }
    
    class func hideLoadingView() {
        let loadingView = CustomLoaderView.customLoader
        loadingView.removeFromSuperview()
    }
    
    func showCustomIndicatorView(_ callingView: Any?) {
        
        
        let frm: CGRect = UIScreen.main.bounds
        
        indicatorView?.center = CGPoint(x: frm.size.width / 2.0, y: frm.size.height / 2.0)
        indicatorView?.color = UIColor.red
        if (callingView is UIViewController) {
            let viewCalling = callingView as? UIViewController
            if let aView = viewCalling?.view {
                bringSubviewToFront(aView)
            }
        } else {
            if let aView = callingView as? UIView {
                bringSubviewToFront(aView)
            }
        }
        indicatorView?.startAnimating()
        self.isHidden = false
    }
    
}
