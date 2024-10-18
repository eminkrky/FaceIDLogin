//
//  ViewController.swift
//  FaceIDLogin
//
//  Created by Emin on 13.10.2024.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func loginBt(_ sender: Any) {
    
        
        let authContext = LAContext()
        
        var error : NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "For Login") { success, error in
                DispatchQueue.main.async {
                    if success == true{
                        self.performSegue(withIdentifier: "toVC", sender: nil)
                    }else{
                        self.label.text = "Hata"
                    }
                }
            }
        }
        
    }
    
}

