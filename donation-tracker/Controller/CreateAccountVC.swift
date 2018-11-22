//
//  CreateAccountVC.swift
//  donation-tracker
//
//  Created by An Tran on 11/21/18.
//  Copyright © 2018 An Tran. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locations.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return locations[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        employeeLocation = locations[row]
        employeeLocationTxt.text = employeeLocation
    }
    

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userTypeBtn: DLRadioButton!
    @IBOutlet weak var employeeLocationTxt: UITextField!
    
    var userType: String?
    var employeeLocation: String?
    
    var locations = ["AFD Station 4", "BOYS & GILRS CLUB W.W. WOOLFOLK", "PATHWAY UPPER ROOM CHRISTIAN MINISTRIES",
                    "PAVILION OF HOPE INC", "D&D CONVENIENCE STORE", "KEEP NORTH FULTON BEAUTIFUL"]
    
    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        employeeLocationTxt.inputView = pickerView
    }
    
    func dissmissPickerView()
    {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dismissKeyBoard))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        employeeLocationTxt.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyBoard() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        employeeLocationTxt.isEnabled = false
        super.viewDidLoad()
        createPickerView()
        dissmissPickerView()
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
            employeeLocationTxt.text = ""
            employeeLocationTxt.isEnabled = false
        } else {
            userType = "employee"
            employeeLocationTxt.isEnabled = true
        }
    }
}
