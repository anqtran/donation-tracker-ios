//
//  SearchItemVC.swift
//  donation-tracker
//
//  Created by An Nguyen on 11/27/18.
//  Copyright © 2018 An Tran. All rights reserved.
//

import UIKit
import DropDown
class SearchItemVC: UIViewController {

    
    @IBOutlet weak var locationBtn: UIButton!
    @IBOutlet weak var categoryBtn: UIButton!
    
    let dropDownLocation = DropDown()
    let dropDownCategory = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLocationDropDown()
        setUpCategoryDropDown()
    }
    
    
    func setUpLocationDropDown() {
        let locationArray = ["AFD Station 4", "BOYS & GILRS CLUB W.W. WOOLFOLK", "PATHWAY UPPER ROOM CHRISTIAN MINISTRIES", "PAVILION OF HOPE INC", "D&D CONVENIENCE STORE", "KEEP NORTH FULTON BEAUTIFUL", "All Locations"]
        
        dropDownLocation.anchorView = locationBtn
        
        dropDownLocation.dataSource = locationArray
        
        dropDownLocation.bottomOffset = CGPoint(x: 0, y: dropDownLocation.bounds.height)
        dropDownLocation.selectionAction = { [weak self] (index, item) in
            self?.locationBtn.setTitle(item, for: .normal)
        }
    }
    func setUpCategoryDropDown() {
        let categories = ["Clothing", "Hat", "Kitchen", "Electronics", " Household", "Other", "All Categories"]
        
        dropDownCategory.anchorView = categoryBtn
        
        dropDownCategory.dataSource = categories
        
        dropDownCategory.bottomOffset = CGPoint(x: 0, y: dropDownCategory.bounds.height)
        dropDownCategory.selectionAction = { [weak self] (index, item) in
            self?.categoryBtn.setTitle(item, for: .normal)
        }
    }

    @IBAction func chooseLocationBtnPressed(_ sender: Any) {
        dropDownLocation.show()
    }
    @IBAction func chooseCategoryBtnPressed(_ sender: Any) {
        dropDownCategory.show()
    }
}
