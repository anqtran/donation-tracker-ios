//
//  Item.swift
//  donation-tracker
//
//  Created by An Tran on 11/24/18.
//  Copyright © 2018 An Tran. All rights reserved.
//

import Foundation

struct DonationItem : Decodable {
    public private(set) var _id: String!
    public private(set) var value: Int!
    public private(set) var longDescription: String!
    public private(set) var location: String!
    public private(set) var description: String!
    public private(set) var category: String!
    public private(set) var __v: Int!
    public private(set) var timestamp: String!
    
}

