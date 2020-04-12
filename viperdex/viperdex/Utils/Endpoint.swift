//
//  Endpoint.swift
//  viperdex
//
//  Created by Victor Oka on 11/04/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import Foundation

struct Endpoint {

    let path: String
    let queryItems: [URLQueryItem]

    // MARK: - Base URL components
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "pokeapi.co"
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
    
    static func buildEndpoint(limit: Int = 151) -> Endpoint {
        Endpoint(
            path: "/api/v2/pokemon",
            queryItems: [URLQueryItem(name: "limit", value: "\(limit)")])
    }
}
