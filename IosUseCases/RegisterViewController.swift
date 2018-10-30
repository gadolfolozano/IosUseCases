//
//  RegisterViewController.swift
//  IosUseCases
//
//  Created by Adolfo Lozano Mendez on 17/10/18.
//  Copyright © 2018 Adolfo Lozano Mendez. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: BaseViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var rePasswordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onRegisterClicked(_ sender: Any) {
        let username = usernameTxt.text
        let password = passwordTxt.text
        
        if(validateInputs()){
            self.showLoading()
            Auth.auth().createUser(withEmail: username!, password: password!) { (user, error) in
                self.dismissLoading()
                if(error != nil){
                    self.showRegisterError()
                } else {
                    self.handleLoginSuccess(user: user!)
                }
            }
        } else {
            showInvalidInputsAlert()
        }
    }
    
    func handleLoginSuccess(user : User){
        performSegue(withIdentifier: "mainSegue", sender: nil)
    }
    
    func showRegisterError() {
        self.showAlert(title: "Register Error", message: "An error ocurred")
    }
    
    func showInvalidInputsAlert() {
        self.showAlert(title: "Invalid Inputs", message: "Please check your inputs")
    }
    
    func validateInputs() -> Bool{
        return validateUsername() && validatePassword()
    }
    
    func validateUsername() -> Bool{
        let username = usernameTxt.text
        
        return username!.count >= 6
    }
    
    func validatePassword() -> Bool{
        let password = passwordTxt.text
        let rePassword = rePasswordTxt.text
        
        return password!.count >= 6 && rePassword == password
    }
}
