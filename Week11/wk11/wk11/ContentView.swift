//
//  ContentView.swift
//  wk11
//
//  Created by Алтын on 8/8/20.
//

import SwiftUI

struct ContentView: View {
    @State private var showDetails = false
    @State private var randColor = Color.black
    @State private var angle: Double = 0
    
    @State private var scale: CGFloat = 1
    
    var body: some View {
        
        VStack(spacing: 160) {
            
            Rectangle()
                .fill(self.randColor)
                .frame(width: 150+self.scale, height: 150+self.scale)
                .rotationEffect(.degrees(angle))
                .animation(.spring())
            
            ZStack {
                Button(action: {
                    self.showDetails.toggle()
                }) {
                    Image(systemName: "play")
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color.black)
                        .background(Color.red)
                        .clipShape(Circle())
                        .animation(.default)
                }
                
                if showDetails {
                    
                    ZStack {
                        
                        
                        Button(action: {
                            self.newColor()
                        }) {
                            // color
                            Image(systemName: "paintbrush.pointed")
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color.black)
                                .background(Color.red)
                                .clipShape(Circle())
                        }.offset(x: showDetails ? -70 : 0)
                        .animation(.easeOut)
                        
                        
                        Button(action: {
                            self.scale += CGFloat(Double.random(in: 1...3))
                        }) {
                            
                            Image(systemName: "scribble.variable" )
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color.black)
                                .background(Color.red)
                                .clipShape(Circle())
                        }.offset(x: showDetails ? 70 : 0)
                        
                        Button(action: {
                            self.angle += Double.random(in: 15...270)
                        }) {
                            // angle
                            Image(systemName: "point.topleft.down.curvedto.point.bottomright.up")
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color.black)
                                .background(Color.red)
                                .clipShape(Circle())
                        }.offset(y: showDetails ? -70 : 0)
                        
                    }
                }
            }//.animation(.easeOut)
        }
    }
    
    func newColor() {
        
        let rand1 = Double.random(in: 0...255)
        let rand2 = Double.random(in: 0...255)
        let rand3 = Double.random(in: 0...255)
        
        let randColor = Color(red: rand1/255, green: rand2/255, blue: rand3/255)
        
        self.randColor = randColor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
