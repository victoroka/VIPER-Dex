//
//  PokemonDetailViewController.swift
//  viperdex
//
//  Created by Victor Oka on 13/04/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import UIKit

final class PokemonDetailViewController: UIViewController, PokemonDetailPresenterDelegate  {
    
    let screen = PokemonDetailScreen()
    var presenter: PokemonDetailPresenterProtocol?
    
    private var pokemon: Pokemon
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        PokemonDetailRouter.createPokemonDetailModule(with: self)
        presenter?.viewDidLoad(pokemon: pokemon)
    }

    func showPokemonDetail(with pokemonDetail: PokemonDetail) {
        DispatchQueue.main.async {
            self.navigationItem.title = pokemonDetail.name.capitalized
            self.screen.refreshView(with: pokemonDetail)
            self.view = self.screen
        }
    }
}
