//
//  AddItemVC.swift
//  donation-tracker
//
//  Created by An Tran on 11/23/18.
//  Copyright © 2018 An Tran. All rights reserved.
//

import UIKit

class AddItemVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        itemCategory = categories[row]
        categoryTxt.text = itemCategory
    }
    @IBOutlet weak var shortDescTxt: UITextField!
    @IBOutlet weak var valueTxt: UITextField!
    @IBOutlet weak var categoryTxt: UITextField!
    @IBOutlet weak var moreInfoTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickerView()
        dissmissPickerView()
    }
    
    @IBAction func AddItemBtnPressed(_ sender: Any) {
    }
    
    var itemCategory: String?
    var categories = ["Clothing", "Hat", "Kitchen", "Electronics", " Household", "Other"]
    
    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        categoryTxt.inputView = pickerView
    }
    
    func dissmissPickerView()
    {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dismissKeyBoard))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        categoryTxt.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyBoard() {
        view.endEditing(true)
    }
}
