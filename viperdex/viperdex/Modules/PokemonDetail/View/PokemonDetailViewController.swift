//
//  PokemonDetailViewController.swift
//  viperdex
//
//  Created by Victor Oka on 13/04/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import UIKit

final class PokemonDetailViewController: UIViewController, PokemonDetailPresenterDelegate  {
    
    var presenter: PokemonDetailRouterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }

    func showPokemonDetail(with pokemonDetail: PokemonDetail) {
        
    }
}

extension PokemonDetailViewController: CodeView {
    
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupAdditionalConfigurarion() {
        
    }
    
}
