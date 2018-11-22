//
//  CreateAccountVC.swift
//  donation-tracker
//
//  Created by An Tran on 11/21/18.
//  Copyright © 2018 An Tran. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
    @IBAction func closedBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_WELCOME_SCREEN, sender: nil)
    }
}
