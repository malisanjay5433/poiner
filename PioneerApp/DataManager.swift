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
import SVProgressHUD
public  class DataManager{
    internal var baseURL: URL
    internal let session = URLSession.shared
    private init(baseURL: URL) {
        self.baseURL = baseURL
    }
    public static func POST(api:String,param:[String:Any],moduleId:String,method:String,completion:@escaping (_ data:Data?, _ response:URLResponse?, _ error:Error?) -> Void){
        
        SVProgressHUD.show()
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType(rawValue : 3)!)
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle(rawValue : 2)!)
        SVProgressHUD.setForegroundColor(UIColor.yellow)                 // default is [UIColor blackColor], only used for SVProgressHUDStyleCustom
        SVProgressHUD.setBackgroundColor(UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.3))
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        Alamofire.request(APIConstants.ROOT.qa_url + api, method: .post, parameters:param, encoding:  URLEncoding.httpBody, headers: headers).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case.success(let data):
                print("success",data)
                //                if let result = data as? [String:Any]{
                //                    if let message  = result["result"] as? [String:Any]{
                //                        if message["message"] as? String == "Forbidden Access"{
                //                            let param = ["username":"ram@ex.com","password":"deep@123"]
                //                            self.generateToken(api:"", param:param, moduleId:"", method: "POST", completion: { (data,res,error) in
                //
                //                            })
                //                        }
                //                    }
                //                }else{
                SVProgressHUD.dismiss()
                completion(response.data,nil,response.error)
                //                }
                
            case.failure(let error):
                print("Not Success",error)
            }
        }
    }
    
    public static func POSTContentTypeJSON(api:String,param:[String:Any],moduleId:String,method:String,completion:@escaping (_ data:Data?, _ response:URLResponse?, _ error:Error?) -> Void){
        
        SVProgressHUD.show()
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType(rawValue : 3)!)
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle(rawValue : 2)!)
        SVProgressHUD.setForegroundColor(UIColor.yellow)                 // default is [UIColor blackColor], only used for SVProgressHUDStyleCustom
        SVProgressHUD.setBackgroundColor(UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.3))
        //        let headers = [
        //            "Content-Type": "application/json"
        //        ]
        let headers: HTTPHeaders = ["Content-Type": "application/x-www-form-urlencoded"]
        print(APIConstants.ROOT.qa_url + api)
        print(param)
        Alamofire.request(APIConstants.ROOT.qa_url + api, method: .post, parameters:param, encoding:  URLEncoding.default, headers: headers).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case.success(let data):
                print("success",data)
                if let result = response.result.value {
                    let JSON = result as! NSDictionary
                    print(JSON) //SUCCESS :{valid: 0}
                }
                SVProgressHUD.dismiss()
                completion(response.data,nil,response.error)
            case.failure(let error):
                print("Not Success",error)
            }
        }
    }
    
    public static func generateToken(api:String,param:[String:Any],moduleId:String,method:String,completion:@escaping (_ data:Data?, _ response:URLResponse?, _ error:Error?) -> Void){
        SVProgressHUD.show()
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType(rawValue : 3)!)
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle(rawValue : 2)!)
        SVProgressHUD.setForegroundColor(UIColor.yellow)                 // default is [UIColor blackColor], only used for SVProgressHUDStyleCustom
        SVProgressHUD.setBackgroundColor(UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.3))
        
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
                SVProgressHUD.dismiss()
                
                completion(response.data,nil,response.error)
                
            case.failure(let error):
                print("Not Success",error)
            }
        }
    }
    
    public static func GET(api:String,method:String,completion:@escaping (_ data:Data?, _ response:URLResponse?, _ error:Error?) -> Void){
        SVProgressHUD.show()
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType(rawValue : 3)!)
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle(rawValue : 2)!)
        SVProgressHUD.setForegroundColor(UIColor.yellow)                 // default is [UIColor blackColor], only used for SVProgressHUDStyleCustom
        SVProgressHUD.setBackgroundColor(UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.3))
        
        let headers = ["Content-Type": "application/json"]
        print(headers)
        print(APIConstants.ROOT.qa_url + api)
        Alamofire.request(APIConstants.ROOT.qa_url + api, method: .get, parameters:[:], encoding:  URLEncoding.httpBody, headers: headers).responseJSON { (response:DataResponse<Any>) in
            switch(response.result) {
            case.success(let data):
                print("success",data)
                SVProgressHUD.dismiss()
                
                completion(response.data,nil,response.error)
            case.failure(let error):
                print("Not Success",error)
            }
        }
    }
    public static func GETBearer(api:String,method:String,completion:@escaping (_ data:Data?, _ response:URLResponse?, _ error:Error?) -> Void){
        SVProgressHUD.show()
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType(rawValue : 3)!)
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle(rawValue : 2)!)
        SVProgressHUD.setForegroundColor(UIColor.yellow)                 // default is [UIColor blackColor], only used for SVProgressHUDStyleCustom
        SVProgressHUD.setBackgroundColor(UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.3))
        
        let headers = ["Content-Type": "application/json","Authorization":"Bearer " + " " + UserDefaultDetails.init().getToken()]
        print(headers)
        print(APIConstants.ROOT.qa_url + api)
        Alamofire.request(APIConstants.ROOT.qa_url + api, method: .post, parameters:[:], encoding:  URLEncoding.default, headers: headers).responseJSON { (response:DataResponse<Any>) in
            switch(response.result) {
            case.success(let data):
                print("success",data)
                SVProgressHUD.dismiss()
                
                completion(response.data,nil,response.error)
            case.failure(let error):
                print("Not Success",error)
            }
        }
    }
    
    public static func getNext(api:String,method:String,completion:@escaping (_ data:Data?, _ response:URLResponse?, _ error:Error?) -> Void){
        SVProgressHUD.show()
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType(rawValue : 3)!)
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle(rawValue : 2)!)
        SVProgressHUD.setForegroundColor(UIColor.yellow)                 // default is [UIColor blackColor], only used for SVProgressHUDStyleCustom
        SVProgressHUD.setBackgroundColor(UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.3))
        
        let headers = ["Content-Type": "application/json"]
        print(headers)
        //        http://159.89.162.248/v1/dev/news/?category__category=Desh&page=1
        //          http://159.89.162.248/v1/dev/news/?category__category=Desh&page=1
        //          http://159.89.162.248/v1/dev/news/?category__category=Desh&page=1
        //        print(APIConstants.ROOT.qa_url + api)
        Alamofire.request(api, method: .get, parameters:[:], encoding:  URLEncoding.httpBody, headers: headers).responseJSON { (response:DataResponse<Any>) in
            switch(response.result) {
            case.success(let data):
                print("success",data)
                SVProgressHUD.dismiss()
                
                completion(response.data,nil,response.error)
            case.failure(let error):
                print("Not Success",error)
            }
        }
    }
    public static func getRequest( api:String,method:String,ref : UIViewController?, completion:@escaping (_ data:Data?, _ response:URLResponse?, _ error:Error?) -> Void){
        SVProgressHUD.show()
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType(rawValue : 3)!)
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle(rawValue : 2)!)
        SVProgressHUD.setForegroundColor(UIColor.yellow)                 // default is [UIColor blackColor], only used for SVProgressHUDStyleCustom
        SVProgressHUD.setBackgroundColor(UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.3))
        
        let userDefault = UserDefaults()
        guard let url = URL(string: APIConstants.ROOT.qa_url + api) else { return }
        var request = URLRequest(url:url)
        request.httpMethod = method
        let headerz = ["Content-Type": "application/x-www-form-urlencoded","Authorization":"Bearer " + " " + UserDefaultDetails.init().getToken()]
        print(headerz)
        request.allHTTPHeaderFields = headerz as! [String : String]
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do{
                if let er  = error  {
                    print("error = \(er)")
                    DispatchQueue.main.async {
                        SVProgressHUD.dismiss()
                    }
                }
                if let httpResponse = response as? HTTPURLResponse {
                    print(httpResponse.statusCode)
                    if (httpResponse.statusCode == 401) {
                        SVProgressHUD.dismiss()
                    }else if (httpResponse.statusCode == 403){
                        DispatchQueue.main.async {
                            ref?.navigationController?.popToRootViewController(animated:true)
                        }
                    }
                }
                guard data != nil else {
                    SVProgressHUD.dismiss()
                    
                    return
                }
                guard response != nil else {
                    SVProgressHUD.dismiss()
                    return
                }
                SVProgressHUD.dismiss()
                
                completion(data,response,nil)
            }
            }.resume()
    }
}

