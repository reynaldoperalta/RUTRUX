//
//  ViewController.swift
//  RUTRUX
//
//  Created by reynaldo peralta marquez on 11/18/21.
//  Copyright © 2021 reynaldo peralta marquez. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var phoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendNumber(_ sender: Any) {
        let alert = UIAlertController(title: "Numero de Telefono", message: "Es este tu numero de telefono? \n \(phoneNumber.text!)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Si", style: .default) { (UIAlertAction) in
            PhoneAuthProvider.provider().verifyPhoneNumber(self.phoneNumber.text!, uiDelegate: nil) { (verificationID, error) in
                if error != nil {
                    print("error: \(error?.localizedDescription)")
                }else{
                    let defaults = UserDefaults.standard
                    defaults.set(verificationID, forKey: "authVID")
                    self.performSegue(withIdentifier: "seguenumber", sender: Any?.self)
                }
            }
        }
        let cancel = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alert.addAction(action)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

