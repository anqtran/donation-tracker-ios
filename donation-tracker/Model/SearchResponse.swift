//
//  SearchResponse.swift
//  donation-tracker
//
//  Created by An Tran on 12/1/18.
//  Copyright © 2018 An Tran. All rights reserved.
//

import Foundation

struct SearchResponse : Decodable {
    public private(set) var _index: String!
    public private(set) var _type: String!
    public private(set) var _id: String!
    public private(set) var _score: Double!
    public private(set) var _source: Source!
}

struct Source: Decodable {
    public private(set) var description: String!
}
