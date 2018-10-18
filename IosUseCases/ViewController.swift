//
//  ViewController.swift
//  IosUseCases
//
//  Created by Adolfo Lozano Mendez on 15/10/18.
//  Copyright © 2018 Adolfo Lozano Mendez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
        performSegue(withIdentifier: "loginSegue", sender: nil)    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

