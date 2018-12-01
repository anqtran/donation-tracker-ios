//
//  ViewSearchResultVC.swift
//  donation-tracker
//
//  Created by An Tran on 12/1/18.
//  Copyright © 2018 An Tran. All rights reserved.
//

import UIKit

class ViewSearchResultVC: UITableViewController {

    let result = ItemService.instance.searchResult
    override func viewDidLoad() {
        print(result)
        super.viewDidLoad()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) 
        cell.textLabel?.text = result[indexPath.item]
        return cell
    }

}
