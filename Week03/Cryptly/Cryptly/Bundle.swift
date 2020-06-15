//
//  Bundle.swift
//  Cryptly
//
//  Created by алтынпончик on 6/15/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import Foundation

class Json: ObservableObject {
    @Published var json = [CryptoCurrency]()
    
    init() {
        load()
    }
    
    func load() {
        let path = Bundle.main.path(forResource: "Data", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let data = data {
                    let json = try JSONDecoder().decode([CryptoCurrency].self, from: data)
                    DispatchQueue.main.sync {
                        self.json = json
                    }
                } else {
                    print("No data")
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
