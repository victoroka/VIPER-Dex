//
//  PokemoDetailScreen.swift
//  viperdex
//
//  Created by Victor Oka on 13/04/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import UIKit

final class PokemonDetailScreen: UIView {
    
    private lazy var cardView: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    private lazy var gridContainer: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 8
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "Avenir-Bold", size: 18)
        view.textColor = .white
        return view
    }()
    
    private lazy var typesLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "Avenir", size: 15)
        view.textColor = .white
        return view
    }()
    
    private lazy var abilitiesLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "Avenir", size: 15)
        view.textColor = .white
        view.numberOfLines = .zero
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func refreshView(with pokemonInformation: PokemonDetail) {
        
        nameLabel.text = pokemonInformation.name.capitalized
        abilitiesLabel.text = ""
        typesLabel.text = ""
        
        for ability in pokemonInformation.abilities {
            abilitiesLabel.text?.append(contentsOf: " \(ability.abilityInfo.name.capitalized) ")
            if ability.isHidden {
                abilitiesLabel.text?.append(contentsOf: "(Hidden)\n")
            } else {
                abilitiesLabel.text?.append(contentsOf: "\n")
            }
        }
        
        for type in pokemonInformation.types {
            typesLabel.text?.append(contentsOf: "\(type.typeInfo.name.capitalized) ")
        }
    }
    
}

extension PokemonDetailScreen: CodeView {
    
    func buildViewHierarchy() {
        addSubview(cardView)
        gridContainer.addArrangedSubview(nameLabel)
        gridContainer.addArrangedSubview(typesLabel)
        gridContainer.addArrangedSubview(abilitiesLabel)
        cardView.addSubview(gridContainer)
    }
    
    func setupConstraints() {
        
        gridContainer.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview().inset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(10)
        }
        
        cardView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(50)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(150)
            make.centerX.equalToSuperview()
        }
    }
    
    func setupAdditionalConfigurarion() {
        cardView.backgroundColor = .purple
        cardView.layer.cornerRadius = 10
    }
    
}
