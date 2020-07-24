//
//  Clue.swift
//  jQuiz
//
//  Created by Алтын on 7/25/20.
//

import Foundation

struct Clue : Decodable {
    var id : Int
    var answer : String
    var question : String
    var value : Int
    var cat : Category
}

struct Category : Decodable {
    var id : Int
    var title : String
    var clues_count : Int
}
