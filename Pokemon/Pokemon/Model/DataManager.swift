//
//  DataManager.swift
//  Pokemon
//
//  Created by Sandra Salamanca on 17/01/25.
//

import Foundation

struct DataManager: DataManagerProtocol {
    var delegate: DataManagerDelegate?
    
    func fetchPokemons(url: String) {
        if let safeUrl = URL(string: url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: safeUrl) { data, response, error in
                guard error == nil else {return}
                let decoder = JSONDecoder()
                if let safeData = data {
                    do {
                        let initialInfo = try decoder.decode(InitialInfo.self, from: safeData)
                        delegate?.handlePokemonInfo(info: initialInfo)
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
}

protocol DataManagerProtocol {
    var delegate : DataManagerDelegate? { get set }
    func fetchPokemons(url: String)
}

protocol DataManagerDelegate {
    func handlePokemonInfo(info: InitialInfo)
}
