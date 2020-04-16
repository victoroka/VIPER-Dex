//
//  PokemonDetailPresenter.swift
//  viperdex
//
//  Created by Victor Oka on 15/04/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import UIKit

final class PokemonDetailPresenter: PokemonDetailPresenterProtocol {
    
    weak var view: PokemonDetailPresenterDelegate?
    var router: PokemonDetailRouterProtocol?
    var interactor: PokemonDetailInteractorProtocol?
    
    func viewDidLoad(pokemon: Pokemon) {
        self.loadPokemonDetail(pokemon: pokemon)
    }
    
    func loadPokemonDetail(pokemon: Pokemon) {
        interactor?.getPokemonDetail(pokemon: pokemon)
    }
    
}

extension PokemonDetailPresenter: PokemonDetailInteractorDelegate {
    
    func didFetchPokemonDetail(pokemonDetail: PokemonDetail) {
        view?.showPokemonDetail(with: pokemonDetail)
    }
    
}
