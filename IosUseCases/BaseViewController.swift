//
//  BaseViewController.swift
//  IosUseCases
//
//  Created by Adolfo Lozano Mendez on 10/25/18.
//  Copyright © 2018 Adolfo Lozano Mendez. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var spinnerView : UIView?
    
    func showLoading() {
        spinnerView = UIView.init(frame: self.view.bounds)
        spinnerView!.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView!.center
        
        DispatchQueue.main.async {
            self.spinnerView!.addSubview(ai)
            self.view.addSubview(self.spinnerView!)
        }
    }
    
    func dismissLoading() {
        DispatchQueue.main.async {
            self.spinnerView?.removeFromSuperview()
        }
    }
    
    func showAlert(title : String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }

}
