//
//  PokemonDetailProtocols.swift
//  viperdex
//
//  Created by Victor Oka on 13/04/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import UIKit

protocol PokemonDetailPresenterProtocol: class {
    var view: PokemonDetailPresenterDelegate? { get set }
    var interactor: PokemonDetailInteractorProtocol? { get set }
    var router: PokemonDetailRouterProtocol? { get set }
    
    func viewDidLoad()
    func backButtonPressed(from viewController: UIViewController)
}

protocol PokemonDetailPresenterDelegate: class {
    func showPokemonDetail(with pokemonDetail: PokemonDetail)
}

protocol PokemonDetailInteractorProtocol: class {
    var presenter: PokemonDetailInteractorDelegate? { get set }
    
    func getPokemonDetail()
}

protocol PokemonDetailInteractorDelegate: class {
    func didFetchPokemonDetail(pokemonDetail: PokemonDetail)
}

protocol PokemonDetailRouterProtocol: class {
    static func createPokemonDetailModule(with pokemonDetailReference: PokemonDetailViewController, and pokemon: Pokemon)
}
