//
//  Model.swift
//  Cryptly
//
//  Created by алтынпончик on 6/12/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import Foundation

struct CryptoCurrency: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case name
        case symbol
        case currentValue
        case previousValue
    }
    
    let id  = UUID()
    let name: String
    let symbol: String
    let currentValue: Double
    let previousValue: Double
}
