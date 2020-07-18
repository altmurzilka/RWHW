//
//  ContentView.swift
//  Pokedex
//
//  Created by алтынпончик on 7/4/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            PokeGrigView()
                .tabItem {
                    HStack {
                        Image(systemName: "1.circle")
                        Text("Grid View")
                    }
                }.tag(1)

            PokeCardView()
                .tabItem {
                    HStack {
                        Image(systemName: "2.circle")
                        Text("Card View")
                    }
                }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}







