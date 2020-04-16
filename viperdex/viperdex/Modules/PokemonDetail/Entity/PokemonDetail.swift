//
//  PokemonDetail.swift
//  viperdex
//
//  Created by Victor Oka on 15/04/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import Foundation

struct PokemonDetail: Codable {
    
    let name: String
    let abilities: [Ability]
    let types: [Type]
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case abilities = "abilities"
        case types = "types"
    }
}

struct Ability: Codable {
    
    let abilityInfo: Info
    let isHidden: Bool
    
    enum CodingKeys: String, CodingKey {
        case abilityInfo = "ability"
        case isHidden = "is_hidden"
    }
    
}

struct Type: Codable {
    
    let typeInfo: Info
    
    enum CodingKeys: String, CodingKey {
        case typeInfo = "type"
    }
    
}

struct Info: Codable {
    
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}
