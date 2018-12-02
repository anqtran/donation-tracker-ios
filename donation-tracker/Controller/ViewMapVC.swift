//
//  ViewMapVC.swift
//  donation-tracker
//
//  Created by An Nguyen on 11/27/18.
//  Copyright © 2018 An Tran. All rights reserved.
//

import UIKit
import MapKit

class ViewMapVC: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let locations = [
            ["title": "AFD Station 4",    "latitude": 33.75416, "longitude": -84.37742],
            ["title": "BOYS & GILRS CLUB W.W. WOOLFOLK", "latitude": 33.73182, "longitude": -84.43971],
            ["title": "PATHWAY UPPER ROOM CHRISTIAN MINISTRIES",     "latitude": 33.70866, "longitude": -84.41853],
            ["title": "PAVILION OF HOPE INC",    "latitude": 33.80129, "longitude": -84.25537],
            ["title": "D&D CONVENIENCE STORE", "latitude": 33.71747, "longitude": -84.2521],
            ["title": "KEEP NORTH FULTON BEAUTIFUL",     "latitude": 33.96921, "longitude": -84.3688]
        ]
        
        for location in locations {
            let annotation = MKPointAnnotation()
            annotation.title = location["title"] as? String
            annotation.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! Double, longitude: location["longitude"] as! Double)
            mapView.addAnnotation(annotation)
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
