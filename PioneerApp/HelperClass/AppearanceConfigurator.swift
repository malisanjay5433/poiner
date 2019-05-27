//
//  AppearanceConfigurator.swift
//  Segmentio
//
//  Created by Dmitriy Demchenko
//  Copyright © 2016 Yalantis Mobile. All rights reserved.
//
import UIKit

class AppearanceConfigurator {
    class func configureNavigationBar(){
        UINavigationBar.appearance().backgroundColor = UIColor(named: "AppColor")
        UINavigationBar.appearance().tintColor = .white
    }
}

extension UINavigationBar {
    func setupNavigationBar() {
        let titleImageWidth = frame.size.width * 0.32
        let titleImageHeight = frame.size.height * 0.64
        var navigationBarIconimageView = UIImageView()
        if #available(iOS 11.0, *) {
            navigationBarIconimageView.widthAnchor.constraint(equalToConstant: titleImageWidth).isActive = true
            navigationBarIconimageView.heightAnchor.constraint(equalToConstant: titleImageHeight).isActive = true
        } else {
            navigationBarIconimageView = UIImageView(frame: CGRect(x: 0, y: 0, width: titleImageWidth, height: titleImageHeight))
        }
        navigationBarIconimageView.contentMode = .scaleAspectFit
        navigationBarIconimageView.image = UIImage(named: "Achiversclub")
        topItem?.titleView = navigationBarIconimageView
    }
}
