//
//  LoginViewController.swift
//  IosUseCases
//
//  Created by Adolfo Lozano Mendez on 17/10/18.
//  Copyright © 2018 Adolfo Lozano Mendez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

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
    }
    
    @IBAction func onRegisterBtnClicked(_ sender: Any) {
        performSegue(withIdentifier: "registerSegue", sender: nil)
    }
}
