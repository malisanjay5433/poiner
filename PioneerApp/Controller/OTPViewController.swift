//
//  OTPViewController.swift
//  PioneerApp
//
//  Created by Sanjay Mali on 08/06/19.
//  Copyright © 2019 theappmaker. All rights reserved.
//

import UIKit
struct loginToken:Decodable{
    let refresh:String?
    let access:String?
}
class OTPViewController: UIViewController,UITextFieldDelegate{
    @IBOutlet weak var first: UITextField!
    @IBOutlet weak var second: UITextField!
    @IBOutlet weak var third: UITextField!
    @IBOutlet weak var fourth: UITextField!
    @IBOutlet weak var fifth: UITextField!
    @IBOutlet weak var sixth: UITextField!
    var Otpdata:loginOtp?
    var password:String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        first.delegate = self
        second.delegate = self
        third.delegate = self
        fourth.delegate = self
        fifth.delegate = self
        sixth.delegate = self

        first.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        second.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        third.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        fourth.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        fifth.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        sixth.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
    }
    @objc func textFieldDidChange(textField: UITextField){
        
        let text = textField.text
        
        if (text?.utf16.count)! >= 1{
            switch textField{
            case first:
                second.becomeFirstResponder()
            case second:
                third.becomeFirstResponder()
            case third:
                fourth.becomeFirstResponder()
            case fourth:
                fifth.becomeFirstResponder()
            case fifth:
                sixth.becomeFirstResponder()
            case sixth:
                sixth.resignFirstResponder()
            default:
                break
            }
        }else{
            
        }
    }
    
    @IBAction func verifyBtn(_ sender: Any) {
        if first!.text == ""  || second.text! == "" || third.text!  == "" || fourth.text!  == "" || fifth.text!  == "" || sixth.text!  == ""{
            showAlertUpdate(title: "", message: "Enter valid otp ")
        }else{
            verifyDetails()
        }
    }
}
extension OTPViewController:ShowAlertView{
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
    func verifyDetails(){
        var otp = first.text! + second.text! + third.text! + fourth.text! + fifth.text! + sixth.text!
        let pk = Otpdata?.result!.pk!
        let param  = ["pk":pk!, "otp":otp,"password":password!] as [String : Any]
        print(param)
        if let theJSONData = try? JSONSerialization.data(
            withJSONObject: param,
            options: []) {
            let theJSONText = String(data: theJSONData,
                                     encoding: .ascii)
            print("JSON string = \(theJSONText!)")
        }
        DataManager.postNew(api:APIConstants.LR_ENDPOINT.users_Otpauthenticate, param:param , method:"POST", ref: self) { (data, response, error) in
            //        DataManager.postNew(api: APIConstants.LR_ENDPOINT.users_DetailsUpdate, param:param, method: "POST", ref:self) { (data, response,error) in
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
                if json.access != nil {
                    UserDefaultDetails.init().setToken(token:json.access ?? "")
                    UserDefaultDetails.init().setRefreshToken(token: json.refresh ?? "")
                    UserDefaultDetails.init().loggedIN(isLoggedIN:true)
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier:"Home", sender: nil)
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
            
        }))
        self.present(alertController, animated: true, completion: nil)
    }
}
