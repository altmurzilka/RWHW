//
//  SaveView.swift
//  Birdie_MyAttempt
//
//  Created by алтынпончик on 7/3/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct SaveView: View {
    @State var msg = ""
    @State var author = ""
    @Binding var show : Bool
    @EnvironmentObject var obs : Observer
    var data : type
    
    var body : some View{
        
        VStack(spacing : 12){
            
            HStack{
                
                Spacer()
                
                Button(action: {
                    
                    if self.data.id != ""{
                        
                        self.obs.update(id: self.data.id, msg: self.msg, author: self.author)
                    }
                    else{
                        
                        self.obs.add(author: self.author, msg: self.msg, date: Date())
                    }
                    
                    self.show.toggle()
                    
                }) {
                    
                    Text("Save")
                }
            }
            
            TextField("Author", text: $author)
            
            Divider()
            
            multiline(txt: $msg)
            
        }.padding()
            .onAppear {
                
                self.msg = self.data.msg
                self.author = self.data.author
                
        }
    }
}


struct multiline : UIViewRepresentable {
    
    
    @Binding var txt : String
    
    func makeCoordinator() -> multiline.Coordinator {
        
        return multiline.Coordinator(parent1: self)
        
    }
    func makeUIView(context: UIViewRepresentableContext<multiline>) -> UITextView{
        
        let textview = UITextView()
        textview.font = .systemFont(ofSize: 18)
        textview.delegate = context.coordinator
        return textview
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<multiline>) {
        
        uiView.text = txt
    }
    
    class Coordinator : NSObject,UITextViewDelegate{
        
        var parent : multiline
        
        init(parent1 : multiline) {
            
            parent = parent1
        }
        
        func textViewDidChange(_ textView: UITextView) {
            
            self.parent.txt = textView.text
        }
    }
}
