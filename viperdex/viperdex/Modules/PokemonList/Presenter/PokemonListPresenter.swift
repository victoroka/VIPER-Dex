//
//  PokemonListPresenter.swift
//  viperdex
//
//  Created by Victor Oka on 11/04/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import Foundation

class PokemonListPresenter: PokemonListPresenterProtocol {
    
    weak var view: PokemonListPresenterDelegate?
    var interactor: PokemonListInteractorProtocol?
    var router: PokemonListRouterProtocol?
    
    func viewDidLoad() {
        self.loadPokemonList()
    }
    
    func loadPokemonList() {
        interactor?.getPokemonList()
    }
    
    func showSelectedPokemon() {
        router?.pushToPokemonDetail()
    }
}

extension PokemonListPresenter: PokemonListInteractorDelegate {
    
    func didFetchPokemonList(pokemonList: PokemonList) {
        view?.showPokemons(pokemonList)
    }
    
}
