//
//  Pokemon.swift
//  viperdex
//
//  Created by Victor Oka on 11/04/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    
    let name: String
    let urlDetail: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case urlDetail = "url"
    }
    
    init(name: String, urlDetail: String) {
        self.name = name
        self.urlDetail = urlDetail
    }
    
}
