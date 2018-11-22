//
//  CreateAccountVC.swift
//  donation-tracker
//
//  Created by An Tran on 11/21/18.
//  Copyright © 2018 An Tran. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userTypeBtn: DLRadioButton!
    
    var userType: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
    @IBAction func closedBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_WELCOME_SCREEN, sender: nil)
    }
    @IBAction func createAcctBtnPressed(_ sender: Any) {
        guard let email = emailTxt.text, emailTxt.text != "" else {
            return
        }
        guard let pass = passwordTxt.text, passwordTxt.text != "" else {
            return
        }
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if (success) {
                print("registered user!")
            }
        }
    }
    @IBAction func userBtnPressed(_ sender: DLRadioButton) {
        if sender.tag == 1 {
            userType = "user"
        } else {
            userType = "employee"
        }
        print(userType!)
    }
}
