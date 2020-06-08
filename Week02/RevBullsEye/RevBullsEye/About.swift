//
//  About.swift
//  RevBullsEye
//
//  Created by алтынпончик on 6/8/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct About: View {
    
    @Binding var showAbout: Bool
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .center, spacing: 20) {
                
                Text("🎯 RevBullseye 🎯").padding(.bottom, 30)
                
                Text(" This is RevBullseye, the game where you can win points and earn fame by guessing a slider value").multilineTextAlignment(.center)
                Text(" Your goal is to guess the value of a slider and write it into text field. The closer you are, the more points you score. ").multilineTextAlignment(.center)
                Text(" Enjoy! ").multilineTextAlignment(.center)
            }.padding()
                .navigationBarTitle(Text("Sheet View"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.showAbout = false
                }) {
                    Text("OK").bold()
                })
        }
    }
}
