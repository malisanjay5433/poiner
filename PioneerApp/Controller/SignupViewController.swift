//
//  SignupViewController.swift
//  PioneerApp
//
//  Created by Sanjay Mali on 29/05/19.
//  Copyright © 2019 theappmaker. All rights reserved.
//

import UIKit
struct SignUpModel:Decodable{
    let result:ResultModel?
}
struct ResultModel:Decodable {
    let status:Int?
    let message:String?
}
class SignupViewController: UIViewController,ShowAlertView{
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailID: UITextField!
    @IBOutlet weak var phoneNo: UITextField!
    @IBOutlet weak var createPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func receiveNotification(_ sender: Any) {
        
    }
    @IBAction func createAccountBtn(_ sender: Any) {
        if usernameTxt.text == ""{
            showAlert(title:"", message:"Enter UserName")
        }
        else if (emailID.text?.isValidEmail()) != true || emailID.text == "" {
            showAlert(title:"", message:"Enter Valid Email")
        }
        else if (phoneNo.text?.is10DigitValidNumber())! != true || phoneNo.text == ""{
            showAlert(title:"", message:"Enter Valid Phone No.")
        }else if createPassword.text == ""{
            showAlert(title:"", message:"Enter Password")
        }else{
            let param = ["first_name":usernameTxt.text!,"last_name":"--","email":emailID.text!,"referred_by":"","password":phoneNo.text!,"phoneno":phoneNo.text!]
            DataManager.POST(api:APIConstants.LR_ENDPOINT.createUser, param:param, moduleId:"", method:"POST") { (data, response, error) in
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
                    let json = try decoder.decode(SignUpModel.self, from: data!)
                    if json.result?.status == 200{
                        
                        DispatchQueue.main.async {
                            let alertController = UIAlertController(title:"", message: (json.result?.message)!, preferredStyle: .alert)
                            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                                self.performSegue(withIdentifier:"SingUptoLogin", sender: nil)
                            }))
                            self.present(alertController, animated: true, completion: nil)
                            
                        }
                    }else{
                        self.showAlert(title:"", message: "Sorry something went wrong")
                    }
                }
                catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
