//
//  LoginViewController.swift
//  IosUseCases
//
//  Created by Adolfo Lozano Mendez on 17/10/18.
//  Copyright © 2018 Adolfo Lozano Mendez. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: BaseViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLoginBtnClicked(_ sender: Any) {
        
        let username = txtUsername.text
        let password = txtPassword.text
        
        if(validateInputs()){
            self.showLoading()
            Auth.auth().signIn(withEmail: username!, password: password!) { (user, error) in
                self.dismissLoading()
                if(error != nil){
                    self.showLoginError()
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
    
    func showLoginError() {
        self.showAlert(title: "Login Error", message: "An error ocurred")
    }
    
    func showInvalidInputsAlert() {
        self.showAlert(title: "Invalid Inputs", message: "Please check your inputs")
    }
    
    func validateInputs() -> Bool{
        let username = txtUsername.text
        let password = txtPassword.text
        
        return username!.count >= 6 && password!.count >= 6
    }
    
    @IBAction func onRegisterBtnClicked(_ sender: Any) {
        performSegue(withIdentifier: "registerSegue", sender: nil)
    }
}
