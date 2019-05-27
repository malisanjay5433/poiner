//
//  DataManager.swift
//  AchieversClub
//
//  Created by Sanjay Mali on 24/05/18.
//  Copyright © 2018 Sanjay Mali. All rights reserved.
//

import Foundation
import UIKit
import Darwin
import Alamofire
public  class DataManager{
    internal var baseURL: URL
    internal let session = URLSession.shared
    private init(baseURL: URL) {
        self.baseURL = baseURL
    }
    public static func POST(api:String,param:[String:Any],moduleId:String,method:String,completion:@escaping (_ data:Data?, _ response:URLResponse?, _ error:Error?) -> Void){
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        Alamofire.request(APIConstants.ROOT.qa_url + api, method: .post, parameters:param, encoding:  URLEncoding.httpBody, headers: headers).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case.success(let data):
                print("success",data)
                if let result = data as? [String:Any]{
                    if let message  = result["result"] as? [String:Any]{
                        if message["message"] as? String == "Forbidden Access"{
                            let param = ["username":"ram@ex.com","password":"deep@123"]
                            self.generateToken(api:"", param:param, moduleId:"", method: "POST", completion: { (data,res,error) in
                                
                            })
                        }
                    }
                }else{
                  completion(response.data,nil,response.error)
                }
                
            case.failure(let error):
                print("Not Success",error)
            }
        }
    }
    
    
    public static func generateToken(api:String,param:[String:Any],moduleId:String,method:String,completion:@escaping (_ data:Data?, _ response:URLResponse?, _ error:Error?) -> Void){
        let headers = [
            "Content-Type": "application/json"]
//            "Authorization":"Bearer \(UserDefaultDetails.init().getRefreshToken())"
//        ]
    
        print("header:\(headers)")
        print("param:\(param)")
        Alamofire.request(APIConstants.ROOT.qa_url + APIConstants.LR_ENDPOINT.generateToken, method: .post, parameters:param, encoding:  URLEncoding.httpBody, headers: headers).responseJSON { (response:DataResponse<Any>) in
            switch(response.result) {
            case.success(let data):
                print("success",data)
                completion(response.data,nil,response.error)
            case.failure(let error):
                print("Not Success",error)
            }
        }
    }

    public static func GET(api:String,method:String,completion:@escaping (_ data:Data?, _ response:URLResponse?, _ error:Error?) -> Void){
        let headers = ["Content-Type": "application/json"]
//                       "Authorization":"Bearer \(UserDefaultDetails.init().getToken())"]
        print(headers)
        Alamofire.request(APIConstants.ROOT.qa_url + api, method: .get, parameters:[:], encoding:  URLEncoding.httpBody, headers: headers).responseJSON { (response:DataResponse<Any>) in
            switch(response.result) {
            case.success(let data):
                print("success",data)
                completion(response.data,nil,response.error)
            case.failure(let error):
                print("Not Success",error)
            }
        }
    }
    
    public static func getRequest( api:String,method:String,ref : UIViewController?, completion:@escaping (_ data:Data?, _ response:URLResponse?, _ error:Error?) -> Void){
        let userDefault = UserDefaults()
        guard let url = URL(string: APIConstants.ROOT.qa_url + api) else { return }
        var request = URLRequest(url:url)
        request.httpMethod = method
        let headerz = ["Content-Type":"application/json","Authorization":"Bearer " + "\(userDefault.string(forKey: "Token") ?? "")"]
        request.allHTTPHeaderFields = headerz as! [String : String]
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do{
                if let er  = error  {
                    print("error = \(er)")
                    DispatchQueue.main.async {
                        
//                        SVProgressHUD.dismiss()
//                        UserDefaultDetails.showAlert(ref: ref!, alertmessage: er.localizedDescription)
                    }
                }
                if let httpResponse = response as? HTTPURLResponse {
                    print(httpResponse.statusCode)
                    if (httpResponse.statusCode == 401) {
//                        SVProgressHUD.dismiss()
                        let dispatchGroup = DispatchGroup()
//                        if UserDefaultDetails.isloggedIn() == false{
//                            //                            let str = (UserDefaults().string(forKey: "Token")) ?? ""
//                            //                            if str.isEmpty{
//                            //        let dispatchGroup = DispatchGroup()
//                            //        dispatchGroup.enter()
//                            //        TokenManager.init().generateToken(group:dispatchGroup)
//                            let def = UserDefaultDetails()
//                            let operation = def.callTokenManager(param:[:])
//                            operation.completionBlock = {
//                                print("complete")
//                            }
//                            //                            }
//                        }else{
////                            TokenManager.init().refreshToken(group: dispatchGroup)
//
//                        }
                    }else if (httpResponse.statusCode == 403){
                        DispatchQueue.main.async {
//                            appNavigation.callLogout(vc1:ref!)
//                            SVProgressHUD.dismiss()
                            ref?.navigationController?.popToRootViewController(animated:true)
                        }
                        //force logout
                    }
                }
                guard data != nil else {
//                    SVProgressHUD.dismiss()
                    
                    return
                }
                guard response != nil else {
//                    SVProgressHUD.dismiss()
                    return
                }
                //                SVProgressHUD.dismiss()
                completion(data,response,nil)
            }
            //            SVProgressHUD.dismiss()
            }.resume()
    }
}

