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
                
                
                //                HStack {
                //                    ForEach(datas.json) { item in
                //                        Text(item.name).foregroundColor(Color.primary)
                //                    }
                //                }
                
                
                Text(setView1Data())
                    .foregroundColor(Color.primary)
                    .padding(.vertical, 40)
                    .padding(.horizontal, 10)
                    .background(Color.gray)
                
                Text(setView2Data())
                    .foregroundColor(Color.primary)
                    .padding(.vertical, 40)
                    .padding(.horizontal, 95)
                    .background(Color.gray)
                
                Text(setView3Data())
                    .foregroundColor(Color.primary)
                    .padding(.vertical, 40)
                    .padding(.horizontal, 105)
                    .background(Color.gray)
                
                
                HStack {
                    Text("")
                    Spacer()
                    Text("")
                }
                
                Spacer()
            }.shadow(radius: 1)
                
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
