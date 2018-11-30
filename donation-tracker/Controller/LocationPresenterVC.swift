//
//  LocationPresenterVC.swift
//  donation-tracker
//
//  Created by An Nguyen on 11/28/18.
//  Copyright © 2018 An Tran. All rights reserved.
//

import UIKit

class LocationPresenterVC: UIViewController{

    @IBOutlet weak var nameTxt: UILabel!
    @IBOutlet weak var websiteTxt: UILabel!
    @IBOutlet weak var longitudeTxt: UILabel!
    @IBOutlet weak var latitudeTxt: UILabel!
    @IBOutlet weak var phoneTxt: UILabel!
    @IBOutlet weak var typeTxt: UILabel!
    @IBOutlet weak var streetAddressTxt: UILabel!
    @IBOutlet weak var cityTxt: UILabel!
    @IBOutlet weak var stateTxt: UILabel!
    @IBOutlet weak var zipTxt: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let location = LocationService.instance.selectedLocation
        nameTxt.text = "Name: " + location.name
        websiteTxt.text = "Website: " + location.website
        longitudeTxt.text = "Longitude: " +  location.longitude
        latitudeTxt.text = "Latitude: " +  location.latitude
        phoneTxt.text = "Phone: " +  location.phone
        typeTxt.text = "Type: " +  location.type
        streetAddressTxt.text = "Street Address: " +  location.streetAddress
        cityTxt.text = "City: " +  location.city
        stateTxt.text = "State: " +  location.state
        zipTxt.text = "Zip: " +  location.zip
        // Do any additional setup after loading the view.
    }

}
