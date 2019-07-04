//
//  ViewController.swift
//  PioneerApp
//
//  Created by Sanjay Mali on 16/05/19.
//  Copyright © 2019 theappmaker. All rights reserved.
//

import UIKit

struct loginOtp:Decodable{
    let result:resultLogin?
}
struct resultLogin:Decodable{
    let pk:Int?
    let message:String?
}


class LoginViewController: UIViewController,ShowAlertView {
    
    @IBOutlet weak var username_TextFiled: UITextField!
    var dataOtp:loginOtp?
    @IBOutlet weak var password_TextField: UITextField!
    var p:String?
    override func viewDidLoad() {
        super.viewDidLoad()
//        username_TextFiled.text = "ram@ex.com"
//        "z@mailinator.com"
//        "ram@ex.com"
//        password_TextField.text = "deep@123"
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
        p = password_TextField.text!
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
                print(stringData as? [String:Any])
            }
            
            
            do{
                let json = try decoder.decode(loginOtp.self, from: data!)
                print("json:\(String(describing: json))")
                self.dataOtp = json
                if json.result?.pk !=  nil{
                    DispatchQueue.main.async {
                        self.showAlertUpdate(title:"OTP", message:(json.result?.message!)!)
                    }
                }else{
                    let a =  try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
                    print(a)
                    if a!["access"] as! String != ""{
                        UserDefaultDetails.init().setToken(token:a!["access"] as! String)
                        UserDefaultDetails.init().setRefreshToken(token:a!["refresh"] as! String)
                        UserDefaultDetails.init().loggedIN(isLoggedIN:true)
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier:"Home", sender: nil)
                        }
                    }else{
                    self.showAlert(title:"Error", message:json.result?.message ?? "Something Went Wrong")

                    }
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
            self.performSegue(withIdentifier:"OTP", sender: nil)
            
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OTP"{
            let vc = segue.destination as! OTPViewController
            vc.Otpdata = self.dataOtp
            vc.password  = p
        }
    }
}
