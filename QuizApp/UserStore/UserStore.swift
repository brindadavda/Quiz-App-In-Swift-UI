//
//  UserStore.swift
//  QuizApp
//
//  Created by Brinda Davda on 27/06/24.
//

import Foundation

class UserStore {
    private let userDefault = UserDefaults.standard
    private let quizDataKey = "quizData"

    func saveQuizData(_ quizData: QuizData) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(quizData) {
            userDefault.set(encoded, forKey: quizDataKey)
        }
    }

    func loadQuizData() -> QuizData? {
        if let savedData = userDefault.data(forKey: quizDataKey) {
            let decoder = JSONDecoder()
            if let loadedQuizData = try? decoder.decode(QuizData.self, from: savedData) {
                return loadedQuizData
            }
        }
        return nil
    }
}
