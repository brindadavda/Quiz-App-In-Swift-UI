//
//  QuizCategory.swift
//  QuizApp
//
//  Created by Brinda Davda on 22/06/24.
//

import Foundation

struct QuizCategory : Hashable {
    
    var image : String
    var name : String
    var questionIDs : [String]
    var hexColor : String
    var progress : Float = 0
    
    init(image: String, name: String, questionIDs: [String], hexColor: String, progress: Float) {
        self.image = image
        self.name = name
        self.questionIDs = questionIDs
        self.hexColor = hexColor
        self.progress = progress
    }
    
    static func == (lhs: QuizCategory, rhs: QuizCategory) -> Bool {
        return lhs.name == rhs.name
    }
}


// Example images as Data (for simplicity, using random data here)
let exampleImage1 = "science"
let exampleImage2 = "history"
let exampleImage3 = "math"

func getCategoryTotalQuestionsID(category : Categories) -> [String]{
    return questions.filter({$0.image == category.imageName}).map({$0.id})
}


// Dummy quiz categories
let category1 = QuizCategory(
    image: Categories.science.imageName,
    name: Categories.science.rawValue,
    questionIDs: getCategoryTotalQuestionsID(category: .science),
    hexColor: "#FF5733",
    progress: 0.5
)

let category2 = QuizCategory(
    image: Categories.history.imageName,
    name: Categories.history.rawValue,
    questionIDs: getCategoryTotalQuestionsID(category: .history),
    hexColor: "#33FF57",
    progress: 0.7
)

let category3 = QuizCategory(
    image: Categories.math.imageName,
    name: Categories.math.rawValue,
    questionIDs: getCategoryTotalQuestionsID(category: .math),
    hexColor: "#3357FF",
    progress: 0.3
)

// Dummy data array
let quizCategories = [category1, category2, category3]



import SwiftUI
import Combine

class QuizData: ObservableObject {
    @Published var quizCategories: [QuizCategory]
    @Published var totalCoins: Int
    
    init(quizCategories: [QuizCategory], totalCoins: Int) {
        self.quizCategories = quizCategories
        self.totalCoins = totalCoins
    }
}

