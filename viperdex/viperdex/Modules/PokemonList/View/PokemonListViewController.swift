//
//  PokemonListViewController.swift
//  viperdex
//
//  Created by Victor Oka on 11/04/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import UIKit

final class PokemonListViewController: UIViewController, PokemonListPresenterDelegate {
    
    var presenter: PokemonListPresenterProtocol?
    var pokemonList: PokemonList?
    private var numberOfRows: Int = 0
    private var safeArea: UILayoutGuide!
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.layoutMarginsGuide
        setupView()
        setupTableView()
        PokemonListRouter.createPokemonListModule(pokemonListReference: self)
        presenter?.viewDidLoad()
    }
    
    func showPokemons(with pokemonList: PokemonList) {
        self.numberOfRows = pokemonList.pokemons.count
        self.pokemonList = pokemonList
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PokemonListCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func configureNavigationBar(titleColor: UIColor, backgoundColor: UIColor, tintColor: UIColor, title: String, preferredLargeTitle: Bool, translucent: Bool = false) {
        
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor]
            navBarAppearance.titleTextAttributes = [.foregroundColor: titleColor]
            navBarAppearance.backgroundColor = backgoundColor

            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.compactAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance

            navigationController?.navigationBar.prefersLargeTitles = preferredLargeTitle
            navigationController?.navigationBar.isTranslucent = translucent
            navigationController?.navigationBar.tintColor = tintColor
            navigationItem.title = title
        } else {
            navigationController?.navigationBar.barTintColor = backgoundColor
            navigationController?.navigationBar.tintColor = tintColor
            navigationController?.navigationBar.isTranslucent = translucent
            navigationItem.title = title
        }
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
        configureNavigationBar(titleColor: .white, backgoundColor: .systemPurple, tintColor: .white, title: "Kanto Pokémons", preferredLargeTitle: true)
    }
    
}

extension PokemonListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let pokemon = pokemonList?.pokemons[indexPath.row] else { return }
        presenter?.showSelectedPokemon(with: pokemon, from: self)
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
