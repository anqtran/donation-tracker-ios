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

    
    @IBOutlet weak var ItemNotFoundLabel: UILabel!
    @IBOutlet weak var locationBtn: UIButton!
    @IBOutlet weak var categoryBtn: UIButton!
    @IBOutlet weak var searchTxt: UITextField!
    
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
        let categories = ["Clothing", "Hat", "Kitchen", "Electronics", "Household", "Other", "All Categories"]
        
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
    @IBAction func searchBtnOnPressed(_ sender: Any) {
        // search by location and category
        let location = locationBtn.titleLabel!.text!
        
        if (location == "") {
            return
        }
        print(location)
        let category = categoryBtn.titleLabel!.text!
        print(category)
        // search by category
        if (!(category == "Select a Category" || category == "All Categories")) {
            ItemService.instance.findAllItemByCategory(location: location, category: category) { (success) in
                if (success) {
                    print("Return search by category")
                    self.handleAfterSearch()
                }
            }
        } else {
            if (searchTxt.text != "Enter search text") {
                ItemService.instance.findAllItemByName(query: searchTxt.text!) { (success) in
                    if (success) {
                        print("Return fuzzy search by name")
                        self.handleAfterSearch()
                    }
                }
            }
        }
    }
    func handleAfterSearch() {
        let result = ItemService.instance.searchResult
        print(result)
        if result.count == 0 {
            ItemNotFoundLabel.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.ItemNotFoundLabel.isHidden = true
            }
        } else {
         performSegue(withIdentifier: FROM_SEARCH_ITEM_TO_SEARCH_RESULT, sender: nil)
        }
    }
}
