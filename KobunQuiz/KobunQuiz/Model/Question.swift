//
//  Model.swift
//  KobunQuiz
//
//  Created by 岩本武士 on 2023/04/03.
//

import Foundation
import SwiftUI

struct Questions: Codable {
//    var id: Int
    let text: String
    let question: String
    let quote: String
    let optionlist: Options
    // 問題番号
  let questionNo: Int
  }

struct Options: Codable {
    let answers: [Answer]
}

struct Answer: Codable, Identifiable {
    let answer: String
    let id: Int
}


final class ModelData: ObservableObject {
    @Published var questions: Questions = load("question.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


