//
//  PokemonListRouter.swift
//  viperdex
//
//  Created by Victor Oka on 11/04/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import Foundation

class PokemonListRouter: PokemonListRouterProtocol {
    
    func pushToPokemonDetail() {
        
    }
    
    class func createPokemonListModule(pokemonListReference: PokemonListViewController) {
        let presenter: PokemonListPresenterProtocol & PokemonListInteractorDelegate = PokemonListPresenter()
        
        pokemonListReference.presenter = presenter
        pokemonListReference.presenter?.router = PokemonListRouter()
        pokemonListReference.presenter?.view = pokemonListReference
        pokemonListReference.presenter?.interactor = PokemonListInteractor()
        pokemonListReference.presenter?.interactor?.presenter = presenter
    }
    
}
