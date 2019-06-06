//
//  ViewController.swift
//  PioneerApp
//
//  Created by Sanjay Mali on 16/05/19.
//  Copyright © 2019 theappmaker. All rights reserved.
//

import UIKit

struct loginToken:Decodable{
    let refresh:String?
    let access:String?
}
class LoginViewController: UIViewController,ShowAlertView {
    
    @IBOutlet weak var username_TextFiled: UITextField!
    
    @IBOutlet weak var password_TextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        username_TextFiled.text = "ram@ex.com"
        password_TextField.text = "deep@123"
    }
    @IBAction func loginBtn(_ sender: Any) {
        if username_TextFiled.text != "" ||  password_TextField.text != ""{
            login()
        }else{
            if username_TextFiled.text == ""{
                showAlert(title:"", message:"Enter your username")
            }else if password_TextField.text == ""{
                showAlert(title:"", message:"Enter your password")
                
            }else{
        }
    }
}
}
extension LoginViewController{
    func login(){
        let param = ["username":username_TextFiled.text!,"password":password_TextField.text!]
        DataManager.POST(api:APIConstants.LR_ENDPOINT.login, param:param, moduleId:"", method:"POST") { (data, response, error) in
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
                let json = try decoder.decode(loginToken.self, from: data!)
                print("json:\(String(describing: json))")
                UserDefaultDetails.init().setToken(token:json.access ?? "")
                UserDefaultDetails.init().setRefreshToken(token: json.refresh ?? "")
                if json.access != ""{
                    UserDefaultDetails.init().loggedIN(isLoggedIN:true)
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier:"Home", sender: nil)
                    }
                }
            }
            catch{
                print(error.localizedDescription)
            }
        }
    }
}
