//
//  ContentView.swift
//  Cryptly
//
//  Created by алтынпончик on 6/12/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var datas = Json()
    @State private var backInBlack = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 20){
                Text("CryptoCurrencies").fontWeight(.bold)
                
                
                HStack {
                    ForEach(datas.json) { item in
                        Text(item.name).foregroundColor(Color.primary)
                    }
//                    .padding(.horizontal, 110)
//                    .padding(50)
//                    .background(Color.gray)
                    //                    Text("")
                    //
                }
                
                
                Text("Olol")
                    .foregroundColor(Color.primary)
                    .padding(.horizontal, 110)
                    .padding(50)
                    .background(Color.gray)
                
                Text("Olol")
                    .foregroundColor(Color.primary)
                    .padding(.horizontal, 110)
                    .padding(50)
                    .background(Color.gray)
                
                Spacer()
            }
                
            .navigationBarItems(trailing:
                HStack {
                    Toggle(isOn: $backInBlack){
                        Text("")
                    }.accentColor(Color.green)
                        .accessibility(label: Text("Switch to the dark mode."))
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()//.environment(\.colorScheme, .dark)
    }
}
