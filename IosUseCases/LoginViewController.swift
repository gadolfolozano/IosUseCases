//
//  LoginViewController.swift
//  IosUseCases
//
//  Created by Adolfo Lozano Mendez on 17/10/18.
//  Copyright © 2018 Adolfo Lozano Mendez. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var spinnerView : UIView?
    
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
            spinnerView = UIViewController.displaySpinner(onView: self.view)
            Auth.auth().signIn(withEmail: username!, password: password!) { (user, error) in
                UIViewController.removeSpinner(spinner: self.spinnerView!)
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
        showAlert(title: "Login Error", message: "An error ocurred")
    }
    
    func showInvalidInputsAlert() {
        showAlert(title: "Invalid Inputs", message: "Please check your inputs")
    }
    
    func showAlert(title : String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true)
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
