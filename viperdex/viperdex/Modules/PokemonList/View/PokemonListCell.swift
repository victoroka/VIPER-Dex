//
//  PokemonListCell.swift
//  viperdex
//
//  Created by Victor Oka on 12/04/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import UIKit

final class PokemonListCell: UITableViewCell {

    lazy var nameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "Avenir", size: 22)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

// MARK: Code View Protocol
extension PokemonListCell: CodeView {
    
    func buildViewHierarchy() {
        addSubview(nameLabel)
    }
    
    func setupConstraints() {
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(35)
            make.centerY.equalToSuperview()
        }
    }
    
    func setupAdditionalConfigurarion() {}
    
}
