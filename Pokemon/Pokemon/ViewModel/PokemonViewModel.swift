//
//  PokemonViewModel.swift
//  Pokemon
//
//  Created by Sandra Salamanca on 17/01/25.
//

import Foundation

class PokemonViewModel: ObservableObject, DataManagerDelegate {
    @Published var pokemons = [PokemonModel]()
    var dataManager: DataManagerProtocol = DataManager()
    
    init () {
        dataManager.delegate = self
        dataManager.fetchPokemons(url: "https://pokeapi.co/api/v2/pokemon")
    }
    func handlePokemonInfo(info: InitialInfo) {
        info.results.forEach { pokemon in
            pokemons.append(pokemon)
        }
    }
}
