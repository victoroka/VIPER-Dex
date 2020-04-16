//
//  PokemonDetailRouter.swift
//  viperdex
//
//  Created by Victor Oka on 15/04/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import UIKit

final class PokemonDetailRouter: PokemonDetailRouterProtocol {
    
    class func createPokemonDetailModule(with pokemonDetailReference: PokemonDetailViewController) {
        let presenter: PokemonDetailPresenterProtocol & PokemonDetailInteractorDelegate = PokemonDetailPresenter()
        
        pokemonDetailReference.presenter = presenter
        pokemonDetailReference.presenter?.router = PokemonDetailRouter()
        pokemonDetailReference.presenter?.view = pokemonDetailReference
        pokemonDetailReference.presenter?.interactor = PokemonDetailInteractor()
        pokemonDetailReference.presenter?.interactor?.presenter = presenter
    }
    
}
