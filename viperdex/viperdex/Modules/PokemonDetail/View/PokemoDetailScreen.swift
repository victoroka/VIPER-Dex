//
//  PokemoDetailScreen.swift
//  viperdex
//
//  Created by Victor Oka on 13/04/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import UIKit

final class PokemonDetailScreen: UIView {
    
    private lazy var nameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        return view
    }()
    
    
    init(name: String) {
        super.init(frame: .zero)
        nameLabel.text = name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showPokemonDetail(with pokemon: Pokemon) {
        
    }
    
}

extension PokemonDetailScreen: CodeView {
    
    func buildViewHierarchy() {
        addSubview(nameLabel)
    }
    
    func setupConstraints() {
        nameLabel.snp.makeConstraints { (make) in
            
        }
    }
    
    func setupAdditionalConfigurarion() {
        
    }
    
}
