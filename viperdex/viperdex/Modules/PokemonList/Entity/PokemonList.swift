//
//  PokemonList.swift
//  viperdex
//
//  Created by Victor Oka on 11/04/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import Foundation

struct PokemonList: Codable {
    
    let pokemons: [Pokemon]
    
    enum CodingKeys: String, CodingKey {
        case pokemons = "results"
    }
    
    init(pokemons: [Pokemon]) {
        self.pokemons = pokemons
    }
}
