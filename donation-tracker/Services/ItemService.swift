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
    
    var searchResult = [String]()
    
    func findAllItemAtLocation(location: String, completion: @escaping CompletionHandler) {
        let body: [String: Any] = [
            "location": location
        ]
        print (location)
        print("get in the find all item location")
        Alamofire.request(URL_GET_ITEMS_BY_LOCATION, method: .post, parameters: body, encoding: JSONEncoding.default, headers: NEW_HEADER).responseJSON { (response) in
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
    
    func findAllItemByCategory(location: String, category: String, completion: @escaping CompletionHandler) {
        let body: [String: Any] = [
            "location": location,
            "category": category
        ]
        Alamofire.request(URL_GET_ITEMS_BY_CATEGORY, method: .post, parameters: body, encoding: JSONEncoding.default, headers: NEW_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                do {
                    self.items = try JSONDecoder().decode([DonationItem].self, from: data)
                    self.searchResult.removeAll()
                    for item in self.items {
                        self.searchResult.append(item.description)
                    }
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
    
    func findAllItemByName(query: String, completion: @escaping CompletionHandler) {
        let body: [String: Any] = [
            "query": query
        ]
        Alamofire.request(URL_SEARCH_ITEM_BY_NAME, method: .post, parameters: body, encoding: JSONEncoding.default, headers: NEW_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                do {
                    let response = try JSONDecoder().decode([SearchResponse].self, from: data)
                    self.searchResult.removeAll()
                    for res in response {
                        self.searchResult.append(res._source.description)
                    }
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

