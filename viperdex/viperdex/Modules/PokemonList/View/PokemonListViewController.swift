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
    var pokemonList: PokemonList?
    var numberOfRows: Int = 0
    var safeArea: UILayoutGuide!
    let tableView = UITableView()
    
//    override func loadView() {
//        setupView()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.layoutMarginsGuide
        setupView()
        setupTableView()
        PokemonListRouter.createPokemonListModule(pokemonListReference: self)
        presenter?.viewDidLoad()
    }
    
    func showPokemons(_ pokemonList: PokemonList) {
        self.numberOfRows = pokemonList.pokemons.count
        self.pokemonList = pokemonList
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        for pokemon in pokemonList.pokemons {
            print("\(pokemon.name)")
        }
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PokemonListCell.self, forCellReuseIdentifier: "cell")
    }
    
}

extension PokemonListViewController: CodeView {
    
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(safeArea)
            make.bottom.left.right.equalToSuperview()
        }
    }
    
    func setupAdditionalConfigurarion() {
        self.view.backgroundColor = .lightGray
    }
    
}

extension PokemonListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension PokemonListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PokemonListCell
        cell.nameLabel.text = pokemonList?.pokemons[indexPath.row].name
        return cell
    }
    
}
