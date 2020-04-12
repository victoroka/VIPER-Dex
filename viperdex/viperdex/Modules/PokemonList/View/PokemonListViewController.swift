//
//  PokemonListViewController.swift
//  viperdex
//
//  Created by Victor Oka on 11/04/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import UIKit

class PokemonListViewController: UIViewController, PokemonListPresenterDelegate {
    
    var presenter: PokemonListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PokemonListRouter.createPokemonListModule(pokemonListReference: self)
        presenter?.viewDidLoad()
    }
    
    func showPokemons(_ pokemonList: PokemonList) {
        for pokemon in pokemonList.pokemons {
            print("\(pokemon.name)")
        }
    }
    
}
