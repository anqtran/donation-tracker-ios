//
//  LocationService.swift
//  donation-tracker
//
//  Created by An Nguyen on 11/28/18.
//  Copyright © 2018 An Tran. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class LocationService {
    static let instance = LocationService()
    
    var selectedLocation = Location()
    
    var locations = [Location]()
    
    func findAllLocation(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_LOCATION, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: NEW_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                do {
                    self.locations = try JSONDecoder().decode([Location].self, from: data)
                } catch let error {
                    debugPrint(error as Any)
                }
                print(self.locations)
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
