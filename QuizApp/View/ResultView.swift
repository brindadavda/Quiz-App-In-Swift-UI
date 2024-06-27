//
//  ResultView.swift
//  QuizApp
//
//  Created by Brinda Davda on 23/06/24.
//

import SwiftUI

struct ResultView: View {
    
    private let bgColor: LinearGradient = LinearGradient(colors: [Color(hex: "BE86D2"), Color(hex: "E89B9B")], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1))
    private let bgColorCoin: Color = Color(hex: "927AFF")
    private let textColor: Color = Color(hex: "323E5B")
    private let shadowColor: Color = Color(hex: "D8D5EA")
    private let cardColor: LinearGradient = LinearGradient(colors: [Color(hex: "#D988C2") , Color(hex : "#272052")], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1))
    
    private var earnedCoins : Int = 60
    private var totalScored : Int = 10
    private var totalQestion : Int = 10
    
    @State private var isNavigateToHomeView : Bool = false
    @State private var showingAlert : Bool = false
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject  var quizData : QuizData
    
    init(earnedCoins: Int, totalScored: Int, totalQestion: Int) {
        self.earnedCoins = earnedCoins
        self.totalScored = totalScored
        self.totalQestion = totalQestion
    }
    
    var body: some View {
        if showingAlert{
            CustomAlertView(
                bgColor: .red,
                cancleAction: { self.showingAlert.toggle() },
                OkAction: {self.isNavigateToHomeView.toggle()},
                alertMessage: "You want to go home?"
            )
            .background(bgColor)
            .navigate(to: HomeView().environmentObject(quizData), when: $isNavigateToHomeView)
            .navigationBarBackButtonHidden()
        }
        else{
            ZStack(alignment: .topLeading){
                bgColor.ignoresSafeArea()
                VStack {
                    //Top View starts
                    HStack {
                        Button(action: {
                            showingAlert.toggle()
                        }, label: {
                            Circle()
                                .stroke(.white.opacity(0.3), lineWidth: 2.3)
                                .frame(width: 30, height: 30)
                                .overlay {
                                    ZStack{
                                        Image("homeImg")
                                            .resizable()
                                            .frame(width: 16,height: 16)
                                            .padding()
                                        
                                        
                                    }
                                }
                        })
                        Spacer()
                        
                        HStack {
                            Text("\(earnedCoins)")
                                .font(Font.custom(AppFont.ragular.rawValue, size: 12))
                                .foregroundStyle(textColor)
                            
                            Image("coinImg")
                                .resizable()
                                .frame(width: 24,height: 24)
                                .background {
                                    Circle()
                                        .fill(bgColorCoin)
                                        .frame(width: 30, height: 30)
                                }
                        }
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .background {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.white)
                        }
                        
                    }
                    .padding(.bottom)
                    .padding(.leading)
                    .padding(.trailing)
                    //Top View end
                    
                    //Coin View start
                    VStack{
                        Text("you have earned")
                            .font(Font.custom(AppFont.italic.rawValue, size: 32))
                        
                        ZStack(alignment : .center){
                            Image("customeImg")
                                .resizable()
                                .padding()
                            
                            Text("\(earnedCoins)")
                                .font(Font.custom(AppFont.ragular.rawValue, size: 80))
                                .foregroundStyle(.white)
                                .padding()
                                .background{
                                    /*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/.fill(Color(hex:"#FFD43A"))
                                }
                            
                        }
                        .frame(width: 300,height: 300)
                    }
                    .padding()
                    .background{
                        RoundedRectangle(cornerRadius: 30)
                            .fill(cardColor)
                    }
                    
                    Spacer(minLength: 10)
                    
                    VStack{
                        Text("Your final score is")
                            .font(Font.custom(AppFont.ragular.rawValue, size: 32))
                        HStack{
                            Text("\(totalScored)").foregroundStyle(Color(hex: "#A457EF"))
                            Text("/ \(totalQestion)")
                        }.font(Font.custom(AppFont.ragular.rawValue, size: 48))
                    }
                    
                    Spacer(minLength: 10)
                    
                    HStack{
                        
                        HStack{
                            Image("correctImg")
                                .font(.title)
                            
                            Text("\(totalScored) Correct")
                                .font(Font.custom(AppFont.ragular.rawValue, size: 24))
                        }
                        
                        HStack{
                            Image("wrongImg")
                                .font(.title)
                            
                            Text("\(totalQestion - totalScored) wrong")
                                .font(Font.custom(AppFont.ragular.rawValue, size: 24))
                        }
                        
                    }
                    .padding()
                    .frame(height: 70)
                    .background{
                        RoundedRectangle(cornerRadius: 100)
                            .fill(Color(hex: "#50386C"))
                            .shadow(color : Color(hex: "#785085"),radius: 4,y:10)
                    }
                    
                    
                }
                .foregroundStyle(.white)
                .padding()
                
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    ResultView(earnedCoins: 60, totalScored: 2, totalQestion: 10)
}
