//
//  PokemonModel.swift
//  Pokemon
//
//  Created by Sandra Salamanca on 17/01/25.
//

import Foundation

struct PokemonModel: Codable {
    var name : String
    var url: String
}

struct InitialInfo: Codable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [PokemonModel]
}
