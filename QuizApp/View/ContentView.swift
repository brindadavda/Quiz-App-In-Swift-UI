//
//  ContentView.swift
//  QuizApp
//
//  Created by Brinda Davda on 17/06/24.
//

import SwiftUI



struct ContentView: View {
    
    var bgColors : [Color] = [Color(hex: "D33C3C")]
    var shadowColor : Color = Color(hex: "D8D5EA")
    
    @EnvironmentObject var quizData: QuizData
    
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
                    .font(Font.custom(AppFont.ragular.rawValue, size: 32))
                    .padding(.bottom,20)
            
                    Text("Play , learn , and Explore with Exciting Quizzes!")
                        .font(Font.custom(AppFont.ragular.rawValue, size: 16))
                        .padding(.bottom,20)
                    
                    
                    NavigationLink(destination: { CustomTabBarView().environmentObject(quizData)
                    }, label: {
                       
                        ZStack{
                            RoundedRectangle(cornerRadius: 100)
                                .shadow(color: shadowColor, radius : 3 ,x: 0,y: 6)
                            
                           
                            Text("Get Started".uppercased())
                                    .font(Font.custom(AppFont.ragular.rawValue, size: 16))
                                    .foregroundStyle(.black)
                                    .padding()
                            
                        }
                        .frame(height: 50)
                        .padding()
    
                    })
                    
                })
                .foregroundStyle(.white)
                .padding()
                
            }
            
            .ignoresSafeArea()
            .background(
                LinearGradient(colors: bgColors, startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1))
        )
            
        }
        .environmentObject(quizData)
        
    }
    
}

//#Preview {
//    ContentView()
//}
