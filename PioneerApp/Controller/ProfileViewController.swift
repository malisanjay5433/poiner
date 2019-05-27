//
//  ProfileViewController.swift
//  PioneerApp
//
//  Created by Sanjay Mali on 26/05/19.
//  Copyright © 2019 theappmaker. All rights reserved.
//

import UIKit
struct ProfileModel:Decodable{
    let result:result?
    let data:DataModel?
}
struct  result:Decodable{
    let success:Bool?
    let status:Int?
}
struct DataModel:Decodable {
   let  username:String?
    let  first_name:String?
    let  last_name:String?
    let  email:String?
    let  mobile:String?
    let  gender:String?
    let  state:String?
    let  city:String?
    let two_factor:Bool?
    let preferences:[String]?

}
class ProfileViewController: UIViewController,ShowAlertView{
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var GenderText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var userIdText: UITextField!
    @IBOutlet weak var mobileText: UITextField!
    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var StateText: UITextField!
    @IBOutlet weak var countryText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
//        profile()
        getDetails()
    }

}
extension ProfileViewController{
    func profile(){
        DataManager.GET(api:APIConstants.LR_ENDPOINT.users_Details , method:"GET") { (data, response, error) in
            guard  data != nil else {
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                
                if httpResponse.statusCode == 400{
                    self.showAlert(title:"", message: "Sorry something went wrong")
                }
            }
            
            let decoder = JSONDecoder()
            if let stringData = String(data: data!, encoding: String.Encoding.utf8) {
                print("json data = \(stringData)") //JSONSerialization
            }
            do{
                let json = try decoder.decode(ProfileModel.self, from: data!)
                print("json:\(String(describing: json))")
                    DispatchQueue.main.async {
                    }
                }
            
            catch{
                print(error.localizedDescription)
            }
        }
    }
    func getDetails(){
        DataManager.getRequest(api:APIConstants.LR_ENDPOINT.users_Details, method:"GET", ref:self) { (data,response,error) in
            guard  data != nil else {
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                
                if httpResponse.statusCode == 400{
                    self.showAlert(title:"", message: "Sorry something went wrong")
                }
            }
            
            let decoder = JSONDecoder()
            if let stringData = String(data: data!, encoding: String.Encoding.utf8) {
                print("json data = \(stringData)") //JSONSerialization
            }
            do{
                let json = try decoder.decode(ProfileModel.self, from: data!)
                print("json:\(String(describing: json))")
                DispatchQueue.main.async {
                }
            }
                
            catch{
                print(error.localizedDescription)
            }
        }
    }
}
