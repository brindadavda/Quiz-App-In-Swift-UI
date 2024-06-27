//
//  Questions.swift
//  QuizApp
//
//  Created by Brinda Davda on 22/06/24.
//

import Foundation



class Questions{
    var id : String
    var image : String
    var question : String
    var option1 : String
    var option2 : String
    var option3 : String
    var correctAns : String
    
    init(id: String, image: String, question: String, option1: String, option2: String, option3: String, correctAns: String) {
        self.id = id
        self.image = image
        self.question = question
        self.option1 = option1
        self.option2 = option2
        self.option3 = option3
        self.correctAns = correctAns
    }
}



