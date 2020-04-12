//
//  PokemonListProtocols.swift
//  viperdex
//
//  Created by Victor Oka on 11/04/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import Foundation

protocol PokemonListPresenterProtocol: class {
    var interactor: PokemonListInteractorProtocol? { get set }
    var view: PokemonListPresenterDelegate? { get set }
    var router: PokemonListRouterProtocol? { get set }
    
    func viewDidLoad()
    func showSelectedPokemon()
}

protocol PokemonListPresenterDelegate: class {
    func showPokemons()
}

protocol PokemonListInteractorProtocol: class {
    var presenter: PokemonListInteractorDelegate? { get set }
    
    func fetchPokemonList()
}

protocol PokemonListInteractorDelegate: class {
    func didFetchPokemonList()
}

protocol PokemonListRouterProtocol: class {
    func pushToPokemonDetail()
}
