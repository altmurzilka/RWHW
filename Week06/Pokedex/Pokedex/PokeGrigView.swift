//
//  PokeGrigView.swift
//  Pokedex
//
//  Created by Алтын on 7/18/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct PokeGrigView: View {
    let pokemons: [Pokemon] = PokemonGenerator.shared.generatePokemons()
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 3)
    
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(red: 1, green: 0.345, blue: 0.333, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [
            .font : UIFont(name: "Pokemon Solid", size: 20)!,
            .foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(self.pokemons) { pokemon in
                        VStack(spacing: 10) {
                            ZStack {
                                ZStack {
                                    Rectangle()
                                        .fill(Color(UIColor(red: 1, green: 0.345, blue: 0.333, alpha: 1)))
                                        .frame(width: 110, height: 140)
                                        .cornerRadius(5)
                                    
                                    Text("\(pokemon.pokemonName)")
                                        .font(.subheadline)
                                        .foregroundColor(Color.white)
                                        .padding(.top, 105)
                                    
                                }.padding(0)
                                .cornerRadius(5)
                                
                                Image("\(pokemon.id)")
                                    .resizable()
                                    .frame(width: 110, height: 110)
                                    .background(Color.white)
                                    .padding(.bottom, 30)
                                    .cornerRadius(5)
                            }
                        }
                    }
                }
                .padding(.vertical)
            }
            .background(Image("bg"))
            .padding(.horizontal)
            .navigationBarTitle(Text("Pokemon"), displayMode: .inline)
        }
    }
}

struct PokeGrigView_Previews: PreviewProvider {
    static var previews: some View {
        PokeGrigView()
    }
}
