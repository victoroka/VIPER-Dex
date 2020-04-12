//
//  PokemonListCell.swift
//  viperdex
//
//  Created by Victor Oka on 12/04/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import UIKit

class PokemonListCell: UITableViewCell {

    lazy var nameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "Avenir", size: 14)
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension PokemonListCell: CodeView {
    
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupAdditionalConfigurarion() {}
    
}
