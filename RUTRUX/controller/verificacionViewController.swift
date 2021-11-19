//
//  verificacionViewController.swift
//  RUTRUX
//
//  Created by reynaldo peralta marquez on 11/18/21.
//  Copyright © 2021 reynaldo peralta marquez. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class verificacionViewController: UIViewController {

    @IBOutlet weak var codigo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        let defaults = UserDefaults.standard
        let credential: PhoneAuthCredential = PhoneAuthProvider.provider().credential(withVerificationID: defaults.string(forKey: "authVID")!, verificationCode: codigo.text!)
        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = error {
                let authError = error as NSError
                print(authError.description)
                return
            }
            let currentUserInstance = Auth.auth().currentUser
            self.performSegue(withIdentifier: "verificacionsegue", sender: nil)
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
