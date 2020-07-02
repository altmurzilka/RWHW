//
//  ContentView.swift
//  Birdie_MyAttempt
//
//  Created by алтынпончик on 6/26/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var edit = false
    @State var show = false
    @EnvironmentObject var obs : Observer
    @State var selected : type = .init(id: "", author: "", msg: "", time: "", day: "")
    
    var body: some View {
        
        ZStack{
            
            Color.black.edgesIgnoringSafeArea(.bottom)
            
            VStack{
                
                VStack(spacing : 5){
                    
                    HStack{
                        HStack {
                            Button(action: {
                                self.selected = type(id: "", author: "", msg: "", time: "", day: "")
                                self.show.toggle()
                            }) {
                                VStack(alignment: .leading, spacing: 0.0) {
                                    Image("mascot_swift-badge").resizable()
                                        .frame(width: 50, height: 50)
                                    Text("Create Text Post")
                                }.padding(.top, 15)
                            }.buttonStyle(PlainButtonStyle())
                        }
                        Spacer()
                        
                        Text("Home").font(.body).foregroundColor(Color.white)
                        
                        Spacer()
                        
                        HStack {
                            Button(action: {
                                self.selected = type(id: "", author: "", msg: "", time: "", day: "")
                                self.show.toggle()
                                
                            }) {
                                VStack {
                                    Text("Create Image Post").padding(.top, 65)
                                }
                            } .buttonStyle(PlainButtonStyle())
                        }
                        
                    }.padding([.leading,.trailing], 15)
                        .padding(.top, 10)
                        .foregroundColor(Color.blue)
                    
                }
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 10){
                        
                        ForEach(self.obs.datas){i in
                            
                            CellView(edit: self.edit, data: i).onTapGesture {
                                
                                self.selected = i
                                self.show.toggle()
                                
                            }.environmentObject(self.obs)
                        }
                        
                    }.padding()
                    
                }//.padding()
                
            }.sheet(isPresented: $show) {
                
                SaveView(show: self.$show, data: self.selected).environmentObject(self.obs)
            }
            
        }
    }
}
