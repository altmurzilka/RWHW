//
//  ContentView.swift
//  Birdie_MyAttempt
//
//  Created by алтынпончик on 6/26/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAddHabbit = false
    var body: some View {
        NavigationView {
            HStack {
                Text("TEST")
            }
            .navigationBarTitle("Home", displayMode: .inline)
            .navigationBarItems(leading:
                HStack {
                    Button(action: { self.showingAddHabbit = true }) {
                        VStack(alignment: .leading, spacing: 0.0) {
                            Image("mascot_swift-badge").resizable()
                                .frame(width: 50, height: 50)
                            Text("Create Text Post")
                        }.padding(.top, 20)
                    }
                }, trailing:
                HStack {
                    Button(action: { self.showingAddHabbit = true }) {
                        VStack {
                            Text("Create Image Post").padding(.top, 70)
                        }
                    }
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
