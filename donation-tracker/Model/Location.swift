//
//  Location.swift
//  donation-tracker
//
//  Created by An Nguyen on 11/27/18.
//  Copyright © 2018 An Tran. All rights reserved.
//

import Foundation

struct Location : Decodable {
    public private(set) var _id: String!
    public private(set) var website: String!
    public private(set) var phone: String!
    public private(set) var type: String!
    public private(set) var zip: String!
    public private(set) var state: String!
    public private(set) var city: String!
    public private(set) var streetAddress: String!
    public private(set) var longitude: String!
    public private(set) var latitude: String!
    public private(set) var name: String!
    public private(set) var __v: Int!
    
}
