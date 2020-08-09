//
//  Banner.swift
//  wk11
//
//  Created by Алтын on 8/9/20.
//

import SwiftUI

struct BannerModifier: ViewModifier {
    
    struct BannerData {
        var detail:String
        var type: BannerType
    }
    
    enum BannerType {
        case Color
        case Rotation
        case Size
        
        var bannerMessage: String {
            switch self {
            case .Color:
                return "Yay! New Color!"
            case .Rotation:
                return "Wow! Offsest appeared!"
            case .Size:
                return "Nice! Petal width changed!"
            }
        }
    }
    
    
    
    // Members for the Banner
    @Binding var data:BannerData
    @Binding var show:Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if show {
                VStack {
                    HStack {
                        HStack(alignment: .center, spacing: 10) {
                            Image(systemName: "checkmark")
                                .frame(width: 30, height: 30)
                                .background(Color.green)
                                .clipShape(Circle())
                                .foregroundColor(Color.white)
                            Text(data.type.bannerMessage)
                                .font(Font.system(size: 18, weight: Font.Weight.light, design: Font.Design.default))
                        }
                        Spacer()
                    }
                    .foregroundColor(Color.black)
                    .padding(8)
                    .background(Color(red: 211/255, green: 211/255, blue: 211/255))
                    .cornerRadius(8)
                    .padding()
                    Spacer()
                }
                .padding()
                .animation(.easeInOut)
                .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                .onTapGesture {
                    withAnimation {
                        self.show = false
                    }
                }.onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation {
                            self.show = false
                        }
                    }
                })
            }
        }
    }
}

extension View {
    func banner(data: Binding<BannerModifier.BannerData>, show: Binding<Bool>) -> some View {
        self.modifier(BannerModifier(data: data, show: show))
    }
}
