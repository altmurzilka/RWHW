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
        GeometryReader { geometry in
            VStack(alignment: .center) {
                Text("RevBullsEye").font(.largeTitle)
                
                HStack {
                    Text("Guess slider value: ")
                    TextField("Input", text: self.$guess)
                        .frame(width: geometry.size.width / 7)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                }
                HStack {
                    Text("\(Int(self.minimumValue))")
                    Slider(value: self.$sliderValue, in: self.minimumValue...self.maximumvalue).accentColor(Color.green)
                    Text("\(Int(self.maximumvalue))")
                }.padding()
                
                HStack(spacing: 50.0) {
                    Text("Round: \(self.round)")
                    Text("Score: \(self.score)")
                }.padding(.bottom, 30)
                HStack {
                    
                    Button(action: {self.startNewGame()}) {
                        Text("Start over")
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        self.showingAlert = true
                    }) {
                        Text("Hit me")
                    }
                    .alert(isPresented: self.$showingAlert) {
                        
                        () -> Alert in
                        return Alert(title: Text(self.alertTitle()),
                                     message: Text("Slider value is: \(Int(self.sliderValue.rounded())).\n" +
                                        "You scored \(self.pointsForCurrentRound()) point in this round."),
                                     dismissButton: .default(Text("OK")) {
                                        self.score = self.score + self.pointsForCurrentRound()
                                        self.round = self.round + 1
                                        self.sliderValue = Double.random(in: 1...100)
                            }
                        )
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        self.showAbout.toggle()
                    }) {
                        Text("Info")
                    }.sheet(isPresented: self.$showAbout) {
                        About(showAbout: self.$showAbout)
                    }
                }
            }.padding()
                .accentColor(Color.green)
        }
    }
    
    func pointsForCurrentRound() -> Int {
        let maxScore = 100
        let difference = Int(self.sliderValue.rounded()) - Int(self.guess)!
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        return maxScore - difference + bonus
    }
    
    func alertTitle() -> String {
        let difference = Int(self.sliderValue.rounded()) - Int(self.guess)!
        let title: String
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference <= 10 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
        }
        return title
    }
    
    func startNewGame() {
        score = 0
        round = 1
        sliderValue = Double.random(in: 1...100)
        guess = ""
    }
}
