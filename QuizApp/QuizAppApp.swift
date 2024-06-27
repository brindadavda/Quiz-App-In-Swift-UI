//
//  QuizAppApp.swift
//  QuizApp
//
//  Created by Brinda Davda on 17/06/24.
//

import SwiftUI

@main
struct QuizAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appDelegate.quizData)
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    var userStore = UserStore()
    var quizData : QuizData = QuizData(quizCategories: quizCategories, totalCoins: 0)

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        if let loadedData = userStore.loadQuizData() {
            quizData = loadedData
        }
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        userStore.saveQuizData(quizData)
    }

    func applicationWillTerminate(_ application: UIApplication) {
        userStore.saveQuizData(quizData)
    }
}
