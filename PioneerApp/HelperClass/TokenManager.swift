////
////  TokenManager.swift
////  OBC
////
////  Created by Aashish Chadha on 9/10/18.
////  Copyright © 2018 Loylty. All rights reserved.
////
//import Foundation
//import UIKit
//class TokenManager  {
//    let parentVC = UIViewController()
//    var userDefault = UserDefaultDetails()
//    
//    func generateToken(group : DispatchGroup){
//        DataManager.getRequest (api:APIConstants.LR_ENDPOINT.GenerateToken, param:[:],moduleId:UserDefaultDetails.getMemberModuleID(), ref: nil)
//        { (data, error,response) in
//            print(data!)
//            guard let data = data else { return
//            }
//            if let httpResponse = response as? HTTPURLResponse {
//                print(httpResponse.statusCode)
//                if (httpResponse.statusCode == 401){
//                    if let val = (UserDefaults().string(forKey: "Token"))?.isEmpty{
//                        if val
//                        {
//                            self.generateToken(group: group)
//                        }
//                        else{
//                           // self.refreshToken(group: group, ref: nil)
//                        }
//                    }
//                    else{
//                        return
//                    }
//                    
//                }
//                else if (httpResponse.statusCode == 403)
//                {
//                    DispatchQueue.main.async {
//                        appNavigation.callLogout(vc1:self.parentVC)
//                        self.parentVC.navigationController?.popToRootViewController(animated:true)
//                    }
//                    //force logout
//                }
//            }
//            OperationQueue.main.addOperation({
//                print("Operation 2 completed")
//                let decoder = JSONDecoder()
//                do{
//                    do {
//                        let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
//                        print("Json Data " + "\(String(describing: jsonData))")
//                    } catch {
//                        print("Something went wrong")
//                    }
//                    let json = try decoder.decode(CommonBaseModel<Token>.self, from: data)
//                    print("json:\(json)")
//                    let a = json as CommonBaseModel<Token>
//                    self.userDefault.setToken(token: a.Data?.accessToken ?? "")
//                    self.userDefault.setRefreshToken(token: a.Data?.refreshToken ?? "")
//                    group.leave()
//                }
//                catch{
//                    print(error.localizedDescription)
//                }
//                
//            })
//            
//        }
//    }
//    func refreshToken (group : DispatchGroup){
//        DataManager.getRequestRefreshToken (api: APIConstants.LR_ENDPOINT.RefreshToken, param:[:],moduleId:UserDefaultDetails.getMemberModuleID(), ref: nil)
//        { (data, error,response)  in
//            print(data!)
//          
////            let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
////            print("Json Data " + "\(String(describing: jsonData))")
//            
//            guard let data = data else { return
//            }
//            
//            if let stringData = String(data: data, encoding: String.Encoding.utf8) {
////                print("json data = \(stringData)") //JSONSerialization
//            }
//            
//            let decoder = JSONDecoder()
//            do {
//                let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
//                print("Json Data " + "\(String(describing: jsonData))")
//                
//                let json = try decoder.decode(CommonBaseModel<Token>.self, from: data)
//                print("json:\(json)")
//                if json.Success == true{
//                    let a = json as CommonBaseModel<Token>
//                    self.userDefault.setToken(token: a.Data?.accessToken ?? "")
//                    self.userDefault.setRefreshToken(token: a.Data?.refreshToken ?? "")
//                }else{
//                    DispatchQueue.main.async {
//                        appNavigation.callLogout(vc1:self.parentVC)
//                        self.parentVC.navigationController?.popToRootViewController(animated:true)
//                    }
//                }
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//    }
//    
//    func refreshTokenForAppDelegate (group : DispatchGroup){
//        DataManager.getRequestRefreshToken (api: APIConstants.LR_ENDPOINT.RefreshToken, param:[:],moduleId:UserDefaultDetails.getMemberModuleID(), ref: nil)
//        { (data, error,response)  in
//            print(data!)
//            
//            //            let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
//            //            print("Json Data " + "\(String(describing: jsonData))")
//            
//            guard let data = data else { return
//            }
//            
//            if let stringData = String(data: data, encoding: String.Encoding.utf8) {
////                print("json data = \(stringData)") //JSONSerialization
//            }
//            
//            let decoder = JSONDecoder()
//            do {
//                let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
////                print("Json Data " + "\(String(describing: jsonData))")
//                
//                let json = try decoder.decode(CommonBaseModel<Token>.self, from: data)
////                print("json:\(json)")
//                if json.Success == true{
//                    let a = json as CommonBaseModel<Token>
//                    self.userDefault.setToken(token: a.Data?.accessToken ?? "")
//                    self.userDefault.setRefreshToken(token: a.Data?.refreshToken ?? "")
//                }else{
//                    DispatchQueue.main.async {
//                        appNavigation.callLogout(vc1:self.parentVC)
//                        self.parentVC.navigationController?.popToRootViewController(animated:true)
////                        UserDefaultDetails.showAlert(ref: ref, alertmessage: json.Message!)
//                    }
//                }
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//    }
//}
