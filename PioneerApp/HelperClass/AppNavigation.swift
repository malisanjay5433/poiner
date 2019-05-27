////
////  AppNavigation.swift
////  L42Apps
////
////  Created by Sanjay Mali on 03/01/19.
////  Copyright © 2019 LoyltyRewardz. All rights reserved.
////
//
import Foundation
import UIKit
class AppNavigation {
    func navigateTabbar() {
        // switch Home view controllers
       // navigateSplashScreenBanks()
        return
        
        
    }
//    func navigateSignIn(vc:UIViewController) {
//        // switch Login view controllers
//        let storyboard = UIStoryboard.init(name: "Login", bundle: nil)
//        let nav = storyboard.instantiateViewController(withIdentifier: "Login_ViewController") as! Login_ViewController
//        if UserDefaultDetails.isloggedIn() == false {
////            callLogout(vc1: vc)
//            nav.callbackOnPushToPerticularViewController = vc
//            vc.navigationController?.pushViewController(nav, animated: true)
//        }
//        else{
//            callLogout(vc1: vc)
//            vc.navigationController?.present(nav, animated: true, completion: nil)
//        }
//    }
    func navigateHome() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let nav = storyboard.instantiateViewController(withIdentifier: "Homepage")
        appDelegate.window?.rootViewController = nav
    }
    
    func callLogout(vc1:UIViewController){
        var data = UserDefaultDetails().getUserInfo()
        print(data)
        data.removeAll()
        UserDefaultDetails.init().setToken(token:"")
        UserDefaultDetails.init().loggedIN(isLoggedIN:false)
        UserDefaults.standard.set(data, forKey:appConstants.UserInfo.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func navigateSplashScreenBanks() {
        // switch SignUp view controllers
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let storyboard = UIStoryboard.init(name: "Launch", bundle: nil)
        let nav = storyboard.instantiateViewController(withIdentifier: "LaunchViewController")
        appDelegate.window?.rootViewController = nav
    }
}
//
