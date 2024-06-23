//
//  ContentView.swift
//  QuizApp
//
//  Created by Brinda Davda on 17/06/24.
//

import SwiftUI

var totalCoins : Int = 0

struct ContentView: View {
    
    var bgColors : [Color] = [Color(hex: "D33C3C")]
    var shadowColor : Color = Color(hex: "D8D5EA")
    
    
    @StateObject private var quizData = QuizData(quizCategories: quizCategories, totalCoins: 100)
    
    var body: some View {
        NavigationView {
            ZStack{
                Image("introImg")
                    .resizable()
                
 
                VStack(alignment: .leading, content: {
                    Spacer()
                    
                    VStack(alignment: .leading, content:{
                        Text("Welcome")
                                .font(.title)
                                
                        HStack{
                            Text("to")
                                .font(.title)
                            Text("FunQuiz")
                                .font(.largeTitle)
                                .bold()
                            Text("Academy!")
                                .font(.title)
                        }
                    })
                    .padding(.bottom,20)
            
                    Text("Play , learn , and Explore with Exciting Quizzes!")
                        .font(.title3)
                        .padding(.bottom,20)
                    
                    NavigationLink(destination: { HomeView().environmentObject(quizData) }, label: {
                        ZStack{
                            Button(action: {}, label: {
                                Text("")
                            })
                            .frame(width: 300,height: 50)
                            .background(content: {
                                RoundedRectangle(cornerRadius: 100)
                                    .shadow(color: shadowColor, radius : 3 ,x: 0,y: 6)
                            })
                            
                            Text("Get Started".uppercased())
                                .foregroundStyle(.black)
                        }
                    })
                    
                })
                .foregroundStyle(.white)
                .padding(.bottom,50)
                
            }
            .ignoresSafeArea()
            .background(
                LinearGradient(colors: bgColors, startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1))
        )
        }
        .environmentObject(quizData)
        
    }
    
}

#Preview {
    ContentView()
}
