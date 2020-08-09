//
//  ContentView.swift
//  wk11
//
//  Created by Алтын on 8/8/20.
//

import SwiftUI

struct Img: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 50, height: 50)
            .foregroundColor(Color.white)
            .background(Color.green)
            .clipShape(Circle())
    }
}

extension View {
    func imageStyle() -> some View {
        self.modifier(Img())
    }
}

struct ContentView: View {
    
    @State private var showDetails = false
    @State private var randColor = Color.black
    @State private var angle: Double = 0
    @State private var scale: CGFloat = 1
    
    @State var showBanner: Bool = false
    @State var bannerData: BannerModifier.BannerData = BannerModifier.BannerData(detail: "Example notification.", type: .Color)
    
    @State var applyColor: Bool = false
    @State var applyRotation: Bool = false
    @State var applySize: Bool = false
    
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 150) {
                
                Rectangle()
                    .fill(self.randColor)
                    .frame(width: 150+self.scale, height: 150+self.scale)
                    .rotationEffect(.degrees(angle))
                    .animation(.spring())
                
                ZStack {
                    
                    // color
                    Image(systemName: "paintbrush.pointed")
                        .imageStyle()
                        .offset(x: showDetails ? -70 : 0)
                        .onTapGesture {
                            self.bannerData.type = .Color
                            self.showBanner = true
                            self.applyColor = true
                        }
                    
                    // size
                    Image(systemName: "scribble.variable" )
                        .imageStyle()
                        .offset(y: showDetails ? -70 : 0)
                        .onTapGesture {
                            self.bannerData.type = .Size
                            self.showBanner = true
                            self.applySize = true
                        }
                    
                    // rotation
                    Image(systemName: "point.topleft.down.curvedto.point.bottomright.up")
                        .imageStyle()
                        .offset(x: showDetails ? 70 : 0)
                        .onTapGesture {
                            self.bannerData.type = .Rotation
                            self.showBanner = true
                            self.applyRotation = true
                        }
                    
                    // play
                    Image(systemName: "play")
                        .imageStyle()
                        .animation(.default)
                        .onTapGesture {
                            self.showDetails.toggle()
                            if !showDetails {
                                self.applyChanges()
                            }
                        }
                }.animation(.easeInOut)
            }.banner(data: $bannerData, show: $showBanner)
        }
        
        
    }
    
    func newColor() {
        
        let rand1 = Double.random(in: 0...255)
        let rand2 = Double.random(in: 0...255)
        let rand3 = Double.random(in: 0...255)
        
        let randColor = Color(red: rand1/255, green: rand2/255, blue: rand3/255)
        
        self.randColor = randColor
    }
    
    func applyChanges() {
        
        if applyColor {
            self.newColor()
        }
        if applySize {
            self.scale += CGFloat(Double.random(in: 2...5))
        }
        if applyRotation {
            self.angle += Double.random(in: 15...270)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
