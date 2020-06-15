//
//  Model.swift
//  Cryptly
//
//  Created by алтынпончик on 6/12/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import Foundation

struct CryptoCurrency: Codable, Identifiable {
    let id  = UUID()
    let name: String
    let symbol: String
    let currentValue: Double
    let previousValue: Double
}

enum FilterLogic: String {
  case increased
  case decreased
  case allAssets
}

enum Trend: Int, Codable {
  case rising
  case falling
}
