//
//  ContentView.swift
//  Pokemon
//
//  Created by Sandra Salamanca on 17/01/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = PokemonViewModel()
    var body: some View {
        VStack {
            ForEach(viewModel.pokemons, id: \.name) { pokemon in
                HStack {
                    Text(pokemon.name)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
