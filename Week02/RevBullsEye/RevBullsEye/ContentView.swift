//
//  ContentView.swift
//  RevBullsEye
//
//  Created by алтынпончик on 6/8/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
    @State var showAbout = false
    @State private var guess = ""
    
    @State private var score = 0
    @State private var round = 1
    
    @State private var sliderValue = Double.random(in: 1...100)
    var minimumValue = 0.0
    var maximumvalue = 100.0
    
    var body: some View {
        VStack(alignment: .center) {
            Text("RevBullsEye").font(.largeTitle)
            HStack {
                Text("Guess slider value: ")
                Spacer()
                TextField("Input", text: $guess).keyboardType(.decimalPad)
            }
            HStack {
                Text("\(Int(minimumValue))")
                Slider(value: self.$sliderValue, in: minimumValue...maximumvalue)
                Text("\(Int(maximumvalue))")
            }.padding()
            
            HStack(spacing: 50.0) {
                Text("Round: \(round)")
                Text("Score: \(score)")
            }.padding(.bottom, 30)
            HStack {
                
                Button(action: { }) {
                    Text("Start over")
                }
                
                Spacer()
                
                Button(action: {
                    self.showingAlert = true
                    if Int(self.sliderValue) == Int(self.guess) {
                        print("Success")
                    } else {
                        print("nope")
                    }
                }) {
                    Text("Hit me")
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Important message"), message: Text("Slider value is: \(Int(self.sliderValue.rounded()))"), dismissButton: .default(Text("OK")))
                }
                
                Spacer()
                
                Button(action: {
                    self.showAbout.toggle()
                }) {
                    Text("Info")
                }.sheet(isPresented: $showAbout) {
                    About(showAbout: self.$showAbout)
                }
            }
        }.padding()
    }
}
