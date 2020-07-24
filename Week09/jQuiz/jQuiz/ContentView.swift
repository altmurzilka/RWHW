//
//  ContentView.swift
//  jQuiz
//
//  Created by Алтын on 7/22/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var obs = observer()
    var body: some View {
        List(obs.datas) {i in
            Card(question: i.question, answer: i.answer)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


class observer : ObservableObject {
    @Published var datas = [datatype]()
    
    init() {
        let url1 = "http://www.jservice.io/api/random"
        
        let url = URL(string: url1)
        var request = URLRequest(url: url!)
        
        //        request.addValue("application/json", forHTTPHeaderField: "Accept")
        //        request.addValue(api, forHTTPHeaderField: "user-key")
        request.httpMethod = "GET"
        
        let sess = URLSession(configuration: .default)
        sess.dataTask(with: request ) {
            (data , _, _ ) in
            do {
                let fetch = try JSONDecoder().decode(Clue.self, from: data!)
                print(fetch)
                
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}


struct Card: View {
    
    var question = ""
    var answer = ""
    
    var body : some View{
        HStack{
            VStack(alignment: .leading) {
                
                Text(question).fontWeight(.heavy)
                Text(answer)
            }.padding(.vertical, 10)
        }
    }
}
