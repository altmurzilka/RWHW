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
    @State private var randColor = Color.green
    @State private var angle: Double = 0
    @State private var scale: CGFloat = 1
    
    @State var showBanner: Bool = false
    @State var bannerData: BannerModifier.BannerData = BannerModifier.BannerData(detail: "Example notification.", type: .Color)
    
    @State var applyColor: Bool = false
    @State var applyRotation: Bool = false
    @State var applySize: Bool = false
    
    // flower shape related
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 70) {
                
                Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                    .fill(self.randColor, style: FillStyle(eoFill: true))
                    .padding(30)
                
                //                Rectangle()
                //                    .fill(self.randColor)
                //                    .frame(width: 150+self.scale, height: 150+self.scale)
                //                    .rotationEffect(.degrees(angle))
                //                    .animation(.spring())
                
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
                    
                    // size || width
                    Image(systemName: "arrow.left.and.right.righttriangle.left.righttriangle.right" )
                        .imageStyle()
                        .offset(y: showDetails ? -70 : 0)
                        .onTapGesture {
                            self.bannerData.type = .Size
                            self.showBanner = true
                            self.applySize = true
                        }
                    
                    // rotation || offset
                    Image(systemName: "arrowtriangle.left.and.line.vertical.and.arrowtriangle.right")
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
                                self.applyColor = false
                                self.applySize = false
                                self.applyRotation = false
                            }
                        }
                }.animation(.easeInOut)
                .padding(.bottom, 50)
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
            // self.scale += CGFloat(Double.random(in: 2...5))
            self.petalWidth = Double.random(in: 1...100)
        }
        if applyRotation {
            // self.angle += Double.random(in: 15...270)
            self.petalOffset = Double.random(in: -40...40)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// code for flower from https://www.hackingwithswift.com/books/ios-swiftui/transforming-shapes-using-cgaffinetransform-and-even-odd-fills

struct Flower: Shape {
    // How much to move this petal away from the center
    var petalOffset: Double = -20
    
    // How wide to make each petal
    var petalWidth: Double = 100
    
    func path(in rect: CGRect) -> Path {
        // The path that will hold all petals
        var path = Path()
        
        // Count from 0 up to pi * 2, moving up pi / 8 each time
        for number in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 8) {
            // rotate the petal by the current value of our loop
            let rotation = CGAffineTransform(rotationAngle: number)
            
            // move the petal to be at the center of our view
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            // create a path for this petal using our properties plus a fixed Y and height
            let originalPetal = Path(ellipseIn: CGRect(x: CGFloat(petalOffset), y: 0, width: CGFloat(petalWidth), height: rect.width / 2))
            
            // apply our rotation/position transformation to the petal
            let rotatedPetal = originalPetal.applying(position)
            
            // add it to our main path
            path.addPath(rotatedPetal)
        }
        
        // now send the main path back
        return path
    }
}
