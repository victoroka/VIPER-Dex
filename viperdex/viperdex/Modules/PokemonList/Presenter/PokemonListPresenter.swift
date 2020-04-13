//
//  PokemonListPresenter.swift
//  viperdex
//
//  Created by Victor Oka on 11/04/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import UIKit

final class PokemonListPresenter: PokemonListPresenterProtocol {
    
    weak var view: PokemonListPresenterDelegate?
    var interactor: PokemonListInteractorProtocol?
    var router: PokemonListRouterProtocol?
    
    func viewDidLoad() {
        self.loadPokemonList()
    }
    
    func loadPokemonList() {
        interactor?.getPokemonList()
    }
    
    func showSelectedPokemon(with pokemon: Pokemon, from viewController: UIViewController) {
        router?.pushToPokemonDetail(with: pokemon, from: viewController)
    }
}

extension PokemonListPresenter: PokemonListInteractorDelegate {
    
    func didFetchPokemonList(pokemonList: PokemonList) {
        view?.showPokemons(with: pokemonList)
    }
    
}
