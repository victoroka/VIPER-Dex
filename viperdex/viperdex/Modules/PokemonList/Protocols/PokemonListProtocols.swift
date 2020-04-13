//
//  PokemonListProtocols.swift
//  viperdex
//
//  Created by Victor Oka on 11/04/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import UIKit

protocol PokemonListPresenterProtocol: class {
    var interactor: PokemonListInteractorProtocol? { get set }
    var view: PokemonListPresenterDelegate? { get set }
    var router: PokemonListRouterProtocol? { get set }
    
    func viewDidLoad()
    func showSelectedPokemon(with pokemon: Pokemon, from viewController: UIViewController)
}

protocol PokemonListPresenterDelegate: class {
    func showPokemons(with pokemonList: PokemonList)
}

protocol PokemonListInteractorProtocol: class {
    var presenter: PokemonListInteractorDelegate? { get set }
    
    func getPokemonList()
}

protocol PokemonListInteractorDelegate: class {
    func didFetchPokemonList(pokemonList: PokemonList)
}

protocol PokemonListRouterProtocol: class {
    func pushToPokemonDetail(with pokemon: Pokemon, from viewController: UIViewController)
    static func createPokemonListModule(pokemonListReference: PokemonListViewController)
}
