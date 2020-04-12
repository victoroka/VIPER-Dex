//
//  PokemonListInteractor.swift
//  viperdex
//
//  Created by Victor Oka on 11/04/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import Foundation

class PokemonListInteractor: PokemonListInteractorProtocol {
    
    weak var presenter: PokemonListInteractorDelegate?
    
    func fetchPokemonList() {
        presenter?.didFetchPokemonList()
    }
    
}
