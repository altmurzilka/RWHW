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
        
        VStack(spacing: 150) {
            
            Rectangle()
                .fill(self.randColor)
                .frame(width: 150+self.scale, height: 150+self.scale)
                .rotationEffect(.degrees(angle))
                .animation(.spring())
            
            ZStack {
                
                // color
                Image(systemName: "paintbrush.pointed")
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color.black)
                    .background(Color.red)
                    .clipShape(Circle())
                    .offset(x: showDetails ? -70 : 0)
                    .onTapGesture {
                        self.newColor()
                    }
                
                // size
                Image(systemName: "scribble.variable" )
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color.black)
                    .background(Color.red)
                    .clipShape(Circle())
                    .offset(y: showDetails ? -70 : 0)
                    .onTapGesture {
                        self.scale += CGFloat(Double.random(in: 1...3))
                    }
                
                // angle
                Image(systemName: "point.topleft.down.curvedto.point.bottomright.up")
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color.black)
                    .background(Color.red)
                    .clipShape(Circle())
                    .offset(x: showDetails ? 70 : 0)
                    .onTapGesture {
                        self.angle += Double.random(in: 15...270)
                    }
                
                // play
                Image(systemName: "play")
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color.black)
                    .background(Color.red)
                    .clipShape(Circle())
                    .animation(.default)
                    .onTapGesture {
                        self.showDetails.toggle()
                    }
            }.animation(.easeInOut)
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
