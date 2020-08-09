//
//  ContentView.swift
//  jQuiz
//
//  Created by Алтын on 7/22/20.
//

import SwiftUI

struct ContentView: View {
    @State private var musicItems: [Clue] = []
    
    var body: some View {
        VStack {
            Button(action: fetchMusic) {
                Text("Fetch Music")
            }
            List(musicItems) { item in
                Text(item.question)
            }
            Spacer()
        }
    }
    
    func fetchMusic() {
        guard let url =  URL(string:"http://www.jservice.io/api/random") else {
            return
        }
        
        //    URLSession Goes Here
        URLSession.shared.dataTask(with: url) { data, response, taskError in
            guard let httpResponse = response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode),
                  let data = data else {
                fatalError()
            }
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(Clue.self, from: data) else {
                return
            }
            DispatchQueue.main.async {
                self.musicItems = response.question
            }
            
        }.resume()
    }
}







//class observer : ObservableObject {
//    @Published var datas = [datatype]()
//
//    init() {
//        let url1 = "http://www.jservice.io/api/random"
//
//        let url = URL(string: url1)
//        var request = URLRequest(url: url!)
//
//        //        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        //        request.addValue(api, forHTTPHeaderField: "user-key")
//        request.httpMethod = "GET"
//
//        let sess = URLSession(configuration: .default)
//        sess.dataTask(with: request ) {
//            (data , response, error ) in
//            guard let httpResponse = response as? HTTPURLResponse,
//                  (200..<300).contains(httpResponse.statusCode) else {
//                return
//            }
//            //            guard let data = self.datas else {
//            //                return
//            //            }
//            do {
//                let fetch = try JSONDecoder().decode(Clue.self, from: data!)
//                print(fetch)
//
//            } catch {
//                print(error.localizedDescription)
//            }
//        }.resume()
//    }
//}


//struct Card: View {
//
//    var question = ""
//    var answer = ""
//
//    var body : some View{
//        HStack{
//            VStack(alignment: .leading) {
//
//                Text(question).fontWeight(.heavy)
//                Text(answer)
//            }.padding(.vertical, 10)
//        }
//    }
//}
