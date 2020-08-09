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
                            self.newColor()
                            self.bannerData.type = .Color
                            self.showBanner = true
                        }
                    
                    // size
                    Image(systemName: "scribble.variable" )
                        .imageStyle()
                        .offset(y: showDetails ? -70 : 0)
                        .onTapGesture {
                            self.scale += CGFloat(Double.random(in: 1...3))
                            self.bannerData.type = .Size
                            self.showBanner = true
                        }
                    
                    // rotation
                    Image(systemName: "point.topleft.down.curvedto.point.bottomright.up")
                        .imageStyle()
                        .offset(x: showDetails ? 70 : 0)
                        .onTapGesture {
                            self.angle += Double.random(in: 15...270)
                            self.bannerData.type = .Rotation
                            self.showBanner = true
                        }
                    
                    // play
                    Image(systemName: "play")
                        .imageStyle()
                        .animation(.default)
                        .onTapGesture {
                            self.showDetails.toggle()
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
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
