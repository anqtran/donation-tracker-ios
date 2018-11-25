//
//  EmployeeDashboardVC.swift
//  donation-tracker
//
//  Created by An Tran on 11/23/18.
//  Copyright © 2018 An Tran. All rights reserved.
//

import UIKit

class EmployeeDashboardVC: UIViewController {
    let employeeLocation = APIService.instance.userLocation
    override func viewDidLoad() {
        super.viewDidLoad()

        ItemService.instance.findAllItemAtLocation(location: employeeLocation) { (done) in
            if(done) {
                print("finished fetching items")
            } else {
                
            }
        }
    }
    
    @IBAction func addItemBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: FROM_EMPLOYEE_DASHBOARD_TO_ADDITEM, sender: nil)
    }
    
    @IBAction func ViewItemBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: FROM_EMPLOYEE_DASHBOARD_TO_VIEWITEM, sender: nil)
    }
    
}
