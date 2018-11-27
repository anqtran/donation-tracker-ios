//
//  LoginVC.swift
//  donation-tracker
//
//  Created by An Tran on 11/21/18.
//  Copyright © 2018 An Tran. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {


    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createAccntBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        guard let email = emailTxt.text, emailTxt.text != "" else {
            return
        }
        guard let pass = passwordTxt.text, passwordTxt.text != "" else {
            return
        }
        APIService.instance.loginUser(email: email, password: pass) { (success) in
            if (success) {
                let type = APIService.instance.userType
                if (type == "employee") {
                    self.performSegue(withIdentifier: FROM_LOGIN_TO_EMPLOYEE_DASHBOARD, sender: nil)
                } else {
                    
                    
                    self.performSegue(withIdentifier: FROM_LOGIN_TO_USER_DASHBOARD, sender: nil)
                }
            }
        }
    }
}
