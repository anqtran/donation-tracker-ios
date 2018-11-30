//
//  ItemService.swift
//  donation-tracker
//
//  Created by An Tran on 11/24/18.
//  Copyright © 2018 An Tran. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class ItemService {
    static let instance = ItemService()
    
    var selectedItem = DonationItem()
    
    var items = [DonationItem]()
    
    
    func findAllItemAtLocation(location: String, completion: @escaping CompletionHandler) {
        let body: [String: Any] = [
            "location": location
        ]
        print (location)
        print("get in the find all item location")
        print(URL_GET_ITEMS)
        Alamofire.request(URL_GET_ITEMS, method: .post, parameters: body, encoding: JSONEncoding.default, headers: NEW_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                do {
                    self.items = try JSONDecoder().decode([DonationItem].self, from: data)
                } catch let error {
                    debugPrint(error as Any)
                }
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}

