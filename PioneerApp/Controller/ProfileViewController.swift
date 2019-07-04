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
    let message:String?
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
    //    let preferences:[String]?
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
    @IBOutlet weak var searchbox: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        profile()
        //        getDetails()
    }
    
}
extension ProfileViewController{
    
    @IBAction func updateUserDetails(_ sender: Any) {
        updateDetails()
    }
    func profile(){
        DataManager.getRequest(api:APIConstants.LR_ENDPOINT.users_Details, param:[:] , method:"GET", ref: self) { (data, response, error) in
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
                    if json.result?.status == 200{
                        self.nameText.text  = json.data?.first_name
                        self.mobileText.text  = json.data?.mobile
                        self.emailText.text  = json.data?.email
                        self.GenderText.text  = json.data?.gender
                        self.StateText.text  = json.data?.state
                        self.userIdText.text  = json.data?.username
                        self.cityText.text = json.data?.city
                    }
                    
                }
            }
                
            catch{
                print(error.localizedDescription)
            }
        }
    }
    func getDetails(){
        DataManager.getRequest(api:APIConstants.LR_ENDPOINT.users_Details, param:[:], method:"GET", ref:self) { (data,response,error) in
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
    func updateDetails(){
        if nameText.text == "" || mobileText.text == "" || GenderText.text == "" || StateText.text == "" || cityText.text == ""  || userIdText.text == ""{
            self.showAlert(title:"", message: "Please fill the missing field")
            return
        }
        let mobile = mobileText.text!.replacingOccurrences(of: "+91", with: "")

        let param  = ["first_name":nameText.text!,"last_name":nameText.text!,"mobile":mobile,"gender":GenderText.text!,"state":StateText.text!,"city":cityText.text!,"selected_category":[],"two_factor":"false"] as [String : Any]
        
        
        if let theJSONData = try? JSONSerialization.data(
            withJSONObject: param,
            options: []) {
            let theJSONText = String(data: theJSONData,
                                     encoding: .ascii)
            print("JSON string = \(theJSONText!)")
        }
//        DataManager.getRequest(api:APIConstants.LR_ENDPOINT.users_DetailsUpdate, param:param , method:"POST", ref: self) { (data, response, error) in
        DataManager.postNew(api: APIConstants.LR_ENDPOINT.users_DetailsUpdate, param:param, method: "POST", ref:self) { (data, response,error) in
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
                if json.result?.status == 200{
                    DispatchQueue.main.async {
                        self.showAlertUpdate(title: "", message:(json.result?.message)!)
                    }
                }else{
                    self.showAlert(title:"", message:"Something Went Wrong")
                }
            }
            catch{
                print(error.localizedDescription)
            }
        }
    }
    func showAlertUpdate(title: String = "Success", message: String) {
        let alertController = UIAlertController(title: title, message:message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.performSegue(withIdentifier:"UpdateDetails", sender: nil)
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func BackBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
