//
//  QuestionView.swift
//  QuizApp
//
//  Created by Brinda Davda on 20/06/24.
//

import SwiftUI

struct QuestionView: View {
    private let bgColor: LinearGradient = LinearGradient(colors: [Color(hex: "BE86D2"), Color(hex: "E89B9B")], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1))
    private let bgColorCoin: Color = Color(hex: "927AFF")
    private let textColor: Color = Color(hex: "323E5B")
    private var shadowColor: Color = Color(hex: "D8D5EA")

    private let progress: CGFloat = 0.5
    private let countDown: Int = 5

    @State private var currentQuestionIndex: Int = 0
    private let totalQuestion: Int
    private var questions: [Questions]
    private var selectedCategory: Categories

    init(selectedCategory: Categories, questions: [Questions]) {
        self.selectedCategory = selectedCategory
        self.questions = questions
        self.totalQuestion = questions.count
    }

    @State var showingDetail = false
    @State var isOptionSelected : Bool = false 
    @State var isQuestionRight : Bool = false
    @State var selectedAns : String = ""
    @State var totalCorrectQuestion : Int = 0

    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var quizData: QuizData

    var body: some View {
        
        if showingDetail {
            CustomAlertView(bgColor: .red, cancleAction: { self.showingDetail.toggle() }, OkAction: {
                 if var category = quizData.quizCategories.filter({$0.name == selectedCategory.rawValue}).first {
                   category.progress = Float((currentQuestionIndex/totalQuestion))
                   // NavigationLink to go back to the previous view (assuming it's in the navigation stack)
                     
                     NavigationLink(destination: HomeView().environmentObject(quizData)
                        , label: {
                     Text("Go Back")
                        
                   })
                     dismiss()
                 }
               })
               .background(bgColor)
               .navigationBarBackButtonHidden()
        } else {
            ZStack(alignment: .topLeading){
                bgColor.ignoresSafeArea()
                VStack {
                    ZStack {
                        HStack {
                            Button(action: {
                                self.showingDetail.toggle()
                            }, label: {
                                Circle()
                                    .stroke(.white.opacity(0.3), lineWidth: 2.3)
                                    .frame(width: 30, height: 30)
                                    .overlay {
                                        Image(systemName: "xmark")
                                            .foregroundStyle(.white)
                                            .padding()
                                    }
                            })
                            
                            Spacer()
                            
                            HStack {
                                Text("\(totalCoins)")
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
                        
                        CircularProgressView(progress: progress, progressWidth: 3, progressColor: .white)
                            .frame(width: 48, height: 48, alignment: .center)
                            .overlay {
                                let text: String = countDown < 10 ? "0\(countDown)" : "\(countDown)"
                                Text(text)
                                    .foregroundStyle(.white)
                            }
                    }
                    
                    VStack(alignment: .leading) {
                        Image(questions[currentQuestionIndex].image)
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .frame(height: 180)
                            .padding(.top, 20)
                        
                        Text("Question \(currentQuestionIndex + 1) of \(totalQuestion)")
                            .padding(.top, 20)
                            .foregroundStyle(.white)
                        
                        Text(questions[currentQuestionIndex].question)
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .padding(.top, 20)
                    }
                    .padding()
                    
                    
                    if isOptionSelected{
                        optionView(text: selectedAns, imageName: isQuestionRight ? "correctImg" : "wrongImg")
                        VStack{
                            HStack{
                                if isQuestionRight{
                                    Text("That's the ")
                                    + Text("right ").foregroundStyle(Color(hex: "#5CB67C")).font(Font(CTFont(.system, size: 16))).italic()
                                    + Text("Answer - +10 Coins")
                                }else{
                                    Text("That's the ")
                                    + Text("Wrong ").foregroundStyle(Color(hex: "#FF0A0A")).font(Font(CTFont(.system, size: 16))).italic()
                                    + Text("Answer")
                                }
                            }
                            .padding()
                            
                            Image(isQuestionRight ? "coinImg" : "imogyImg")
                                .resizable()
                                .frame(width: 54,height: 54)
                        }
                    }
                    else{
                        VStack(alignment: .center, spacing: 20) {
                            optionView(text: questions[currentQuestionIndex].option1)
                            optionView(text: questions[currentQuestionIndex].option2)
                            optionView(text: questions[currentQuestionIndex].option3)
                        }
                        .padding()
                    }
                    
                }
                .padding()
                .foregroundStyle(.white)
                .blur(radius: showingDetail ? 10 : 0)
               
                
                if isOptionSelected{
                    ZStack(alignment : .bottomTrailing){
                        Spacer().ignoresSafeArea()
                        HStack(alignment: .center){
                            Spacer()
                            Text("\(currentQuestionIndex < questions.count-1  ? "Next":"Result")").padding(.trailing,5)
                            
    
                            if currentQuestionIndex < questions.count-1 {
                                NavigationLink(destination: QuestionView(selectedCategory: selectedCategory, questions: questions) ,label: {
                                    Button(action: {
                                        currentQuestionIndex += 1
                                        isOptionSelected.toggle()
                                    }, label: {
                                        RoundedRectangle(cornerRadius: 30)
                                            .foregroundStyle(.white)
                                            .shadow(color: shadowColor, radius: 3, x: 0, y: 6)
                                            .overlay{
                                                Image(systemName: "arrow.right")
                                                    .resizable()
                                                    .padding()
                                                    .foregroundStyle(textColor)
                                            }
                                    })
                                    .frame(width: 67,height: 60)
                                    .padding(.trailing,10)
                                })
                            }
                            else{
                                
                                    

                                        NavigationLink(destination: ResultView(earnedCoins: totalCoins,totalScored: totalCorrectQuestion,totalQestion: totalQuestion) ,label: {
                                        RoundedRectangle(cornerRadius: 30)
                                            .foregroundStyle(.white)
                                            .shadow(color: shadowColor, radius: 3, x: 0, y: 6)
                                            .overlay{
                                                Image(systemName: "arrow.right")
                                                    .resizable()
                                                    .padding()
                                                    .foregroundStyle(textColor)
                                            }
                                            .frame(width: 67,height: 60)
                                            .padding(.trailing,10)
                                    })
                            
                        
                            }
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
    }


    private func optionView(text: String , imageName : String = "wrongImg") -> some View {
        return
            ZStack(alignment: .center) {
                Button(action: {
                    isQuestionRight = text == questions[currentQuestionIndex].correctAns
                    isOptionSelected.toggle()
                    selectedAns = text
                    totalCoins += isQuestionRight ? 10 : 0
                    totalCorrectQuestion += isQuestionRight ? 1 : 0
                }, label: {
                    HStack{
                        if isOptionSelected{
                            Image(imageName)
                                .resizable()
                                .frame(width: 24,height: 24)
                                .padding()
                                .foregroundStyle(.red)
                        }
                        Spacer()
                        
                        Text(text)
                    }
                })
                .frame(width: 300, height: 50)
                .background(content: {
                    RoundedRectangle(cornerRadius: 100)
                        .shadow(color: shadowColor, radius: 3, x: 0, y: 6)
                })
                Text(text.uppercased())
                    .foregroundStyle(.black)
            }
            
    }
    
}

#Preview {
    QuestionView(selectedCategory: .science, questions: questions.filter { $0.image == Categories.science.imageName })
}
