//
//  PokemonListInteractor.swift
//  viperdex
//
//  Created by Victor Oka on 11/04/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import Foundation

class PokemonListInteractor: PokemonListInteractorProtocol {
    
    weak var presenter: PokemonListInteractorDelegate?
    
    let session: URLSession = URLSession(configuration: .default)
    
    func getPokemonList() {
        fetch(Endpoint.buildEndpoint()) { [weak self] (result) in
            switch result {
            case .success(let pokemonList):
                self?.presenter?.didFetchPokemonList(pokemonList: pokemonList)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetch(_ endpoint: Endpoint, completion: @escaping (Result<PokemonList, NetworkError>) -> Void) {
        
        guard let url = endpoint.url else {
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
                   let decodedPokemonList = try JSONDecoder().decode(PokemonList.self, from: data!)
                   completion(.success(decodedPokemonList))
               } catch {
                   completion(.failure(.mappingError))
               }
           }
           completion(.failure(NetworkHelper.getErrorDescription(for: statusCode)))
        })
        task.resume()
    }
}
