//
//  ItemPresenterVC.swift
//  donation-tracker
//
//  Created by An Nguyen on 11/29/18.
//  Copyright © 2018 An Tran. All rights reserved.
//

import UIKit

class ItemPresenterVC: UIViewController {

    @IBOutlet weak var nameTxt: UILabel!
    @IBOutlet weak var categoryTxt: UILabel!
    @IBOutlet weak var valueTxt: UILabel!
    @IBOutlet weak var descriptionTxt: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = ItemService.instance.selectedItem
        nameTxt.text = "Name: " + item.description
        categoryTxt.text = "Category: " + item.category
        valueTxt.text = "Value:  \(item.value!)"
        descriptionTxt.text = "Description: " +  item.longDescription
        
        // Do any additional setup after loading the view.
    }
    

  

}
