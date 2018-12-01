//
//  UserDashboardVC.swift
//  donation-tracker
//
//  Created by An Tran on 11/23/18.
//  Copyright © 2018 An Tran. All rights reserved.
//

import UIKit

class UserDashboardVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchItemButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: FROM_USER_DASHBOARD_TO_SEARCHITEM, sender: nil)
    }
    
    @IBAction func viewLocationButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: FROM_USER_DASHBOARD_TO_VIEWLOCATION, sender: nil)
    }
    
    @IBAction func viewMapButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: FROM_USER_DASHBOARD_TO_VIEWMAP, sender: nil)
    }

}
