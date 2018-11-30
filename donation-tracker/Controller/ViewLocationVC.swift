//
//  ViewLocationVC.swift
//  donation-tracker
//
//  Created by An Nguyen on 11/27/18.
//  Copyright © 2018 An Tran. All rights reserved.
//

import UIKit

class ViewLocationVC: UITableViewController {
    
    var delegate: LocationDelegate? = nil
    
    let locationArray = ["AFD Station 4", "BOYS & GILRS CLUB W.W. WOOLFOLK", "PATHWAY UPPER ROOM CHRISTIAN MINISTRIES", "PAVILION OF HOPE INC", "D&D CONVENIENCE STORE", "KEEP NORTH FULTON BEAUTIFUL" ]
    var locations = [Location]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LocationService.instance.findAllLocation {(success) in
            if (success) {
                self.locations = LocationService.instance.locations
            }
        }
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationArray.count
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
        
        cell.textLabel?.text = locationArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let locationName = locationArray[indexPath.row]
        guard let currentLocation = findLocation(name: locationName) else {
            return
        }
        LocationService.instance.selectedLocation = currentLocation
        performSegue(withIdentifier: "locationViewToDetail", sender: nil)
        
    }
    
    func findLocation(name : String) -> Location? {
        for l in locations {
            if l.name == name {
                return l
            }
        }
        return nil
    }
}
