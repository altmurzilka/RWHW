//
//  Logic.swift
//  Cryptly
//
//  Created by алтынпончик on 6/16/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import Foundation

let cryptodata = DataGenerator.shared.generateData()

func setView1Data() -> String {
  return getTheListOfCurrencies(filterLogic: .allAssets, outOfTheseCurrencies: cryptodata)
}

func setView2Data() -> String {
  return getTheListOfCurrencies(filterLogic: .increased, outOfTheseCurrencies: cryptodata)
}

func setView3Data() -> String {
  return getTheListOfCurrencies(filterLogic: .decreased, outOfTheseCurrencies: cryptodata)
}

func getTheListOfCurrencies(filterLogic: FilterLogic, outOfTheseCurrencies cryptodata: [CryptoCurrency]?) -> String {
  var labelToSet: String = ""
  if let unwrappedCryptoData = cryptodata {
    let conformingAssets = unwrappedCryptoData.filter { asset in
      switch filterLogic {
      case FilterLogic.increased:
        return asset.currentValue > asset.previousValue
      case FilterLogic.decreased:
        return asset.currentValue < asset.previousValue
      case FilterLogic.allAssets:
        return true
      }
    }
    conformingAssets.forEach {
      labelToSet = labelToSet + ", " + $0.name
    }
  }
  return cutTheComma(labelToSet)
}

func cutTheComma(_ input: String) -> String {
  if input.hasPrefix(", ") {
    return String(input.suffix(input.count - 2))
  } else {
    return input
  }
}
