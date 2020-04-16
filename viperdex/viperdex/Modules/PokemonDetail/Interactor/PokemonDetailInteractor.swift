//
//  PokemonDetailInteractor.swift
//  viperdex
//
//  Created by Victor Oka on 15/04/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import Foundation

final class PokemonDetailInteractor: PokemonDetailInteractorProtocol {
    
    weak var presenter: PokemonDetailInteractorDelegate?
    
    let session: URLSession = URLSession(configuration: .default)
    
    func getPokemonDetail(pokemon: Pokemon) {
        guard let url = URL(string: pokemon.urlDetail) else { return }
        fetch(url) { (result) in
            switch result {
            case .success(let pokemonDetail):
                self.presenter?.didFetchPokemonDetail(pokemonDetail: pokemonDetail)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetch(_ endpoint: URL?, completion: @escaping (Result<PokemonDetail, NetworkError>) -> Void) {
        
        guard let url = endpoint else {
            completion(.failure(.badUrl))
            return
        }
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
                   
           if data == nil {
               completion(.failure(.emptyResponseDataError))
           }
           
           let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
           if 200...299 ~= statusCode {
               do {
                   let decodedPokemonDetail = try JSONDecoder().decode(PokemonDetail.self, from: data!)
                   completion(.success(decodedPokemonDetail))
               } catch {
                   completion(.failure(.mappingError))
               }
           }
           completion(.failure(NetworkHelper.getErrorDescription(for: statusCode)))
        })
        task.resume()
    }
    
}
