//
//  QuizCategory.swift
//  QuizApp
//
//  Created by Brinda Davda on 22/06/24.
//

import Foundation

struct QuizCategory : Hashable , Codable {
    
    var image : String
    var name : String
    var questionIDs : [String]
    var hexColor : String
    var progress : Float = 0
    var totalCoin : Int = 0
    var totalCorrectQuestions : Int = 0
    
    init(image: String, name: String, questionIDs: [String], hexColor: String, progress: Float, totalCoin: Int, totalCorrectQuestions: Int = 0) {
        self.image = image
        self.name = name
        self.questionIDs = questionIDs
        self.hexColor = hexColor
        self.progress = progress
        self.totalCoin = totalCoin
        self.totalCorrectQuestions = totalCorrectQuestions
    }
  
    static func == (lhs: QuizCategory, rhs: QuizCategory) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
           hasher.combine(name)
       }
}


// Example images as Data (for simplicity, using random data here)

func getCategoryTotalQuestionsID(category : Categories) -> [String]{
    return questions.filter({$0.image == category.imageName}).map({$0.id})
}

import SwiftUI
import Combine

class QuizData: ObservableObject, Codable {
    @Published var quizCategories: [QuizCategory]
    @Published var totalCoins: Int

    enum CodingKeys: String, CodingKey {
        case quizCategories
        case totalCoins
    }
    
    init(quizCategories: [QuizCategory], totalCoins: Int) {
        self.quizCategories = quizCategories
        self.totalCoins =  totalCoins
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.quizCategories = try container.decode([QuizCategory].self, forKey: .quizCategories)
        self.totalCoins = try container.decode(Int.self, forKey: .totalCoins)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(quizCategories, forKey: .quizCategories)
        try container.encode(totalCoins, forKey: .totalCoins)
    }
}
