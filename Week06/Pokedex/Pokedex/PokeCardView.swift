//
//  PokeCardView.swift
//  Pokedex
//
//  Created by Алтын on 7/18/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct PokeCardView: View {
    
    let pokemons: [Pokemon] = PokemonGenerator.shared.generatePokemons()
    
    var rows = Array(repeating: GridItem(.flexible(), spacing: 15), count: 1)
    
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(red: 1, green: 0.345, blue: 0.333, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [
            .font : UIFont(name: "Pokemon Solid", size: 20)!,
            .foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows) {
                    ForEach(self.pokemons) { pokemon in
                        VStack(spacing: 30) {
                            ZStack {
                                ZStack {
                                    Rectangle()
                                        .fill(Color.white)
                                        .frame(width: 300, height: 500)
                                        .cornerRadius(5)
                                    
                                    VStack {
                                        Image("\(pokemon.id)")
                                            .scaledToFit()
                                        
                                        
                                        VStack (spacing: 20) {
                                            
                                            Text("\(pokemon.pokemonName)")
                                                .font(.title)
                                                .fontWeight(.bold)
                                            
                                            HStack {
                                                Text("Base Exp")
                                                Spacer()
                                                Text("\(pokemon.baseExp)")
                                            }
                                            HStack {
                                                Text("Height")
                                                Spacer()
                                                Text("\(pokemon.height)")
                                            }
                                            HStack {
                                                Text("Weight")
                                                Spacer()
                                                Text("\(pokemon.weight)")
                                            }
                                        }
                                        
                                    }.padding()
                                }
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

struct PokeCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokeCardView()
    }
}
