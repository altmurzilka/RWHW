//
//  CellView.swift
//  Birdie_MyAttempt
//
//  Created by алтынпончик on 7/3/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct CellView: View {
    var edit : Bool
    var data : type
    @EnvironmentObject var obs : Observer
    
    var body : some View{
        HStack {
            VStack (alignment: .leading) {
                HStack(spacing : 5){
                    Image("mascot_swift-badge").resizable()
                        .frame(width: 50, height: 50)
                    VStack (alignment: .leading, spacing : 5) {
                        Text(data.author).lineLimit(1).foregroundColor(Color.white)
                        Text("\(data.day), \(data.time)").foregroundColor(Color.white)
                    }
                }
                Text(data.msg).foregroundColor(Color.white)
            }
            Spacer()
        }
    }
}
