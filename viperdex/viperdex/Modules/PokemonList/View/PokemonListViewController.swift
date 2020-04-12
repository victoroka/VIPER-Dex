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
    var numberOfRows: Int = 0
    let tableView = UITableView()
    
    override func loadView() {
        self.setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        PokemonListRouter.createPokemonListModule(pokemonListReference: self)
        presenter?.viewDidLoad()
    }
    
    func showPokemons(_ pokemonList: PokemonList) {
        numberOfRows = pokemonList.pokemons.count
        tableView.reloadData()
        for pokemon in pokemonList.pokemons {
            print("\(pokemon.name)")
        }
    }
    
}

extension PokemonListViewController: CodeView {
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupAdditionalConfigurarion() {
        
    }
    
}

extension PokemonListViewController: UITableViewDelegate {
    
}

extension PokemonListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
