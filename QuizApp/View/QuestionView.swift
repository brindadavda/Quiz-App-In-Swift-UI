//
//  QuestionView.swift
//  QuizApp
//
//  Created by Brinda Davda on 20/06/24.
//

import SwiftUI

struct QuestionView: View {
    // MARK: - Properties
    private let bgColor = LinearGradient(colors: [Color(hex: "BE86D2"), Color(hex: "E89B9B")], startPoint: .topLeading, endPoint: .bottomTrailing)
    private let bgColorCoin = Color(hex: "927AFF")
    private let textColor = Color(hex: "323E5B")
    private let shadowColor = Color(hex: "D8D5EA")
    
    private let progress: CGFloat = 0.5
    private let countDown: Int = 5
    
    private let totalQuestion: Int
    private var questions: [Questions]
    private var selectedCategory: Categories
    
    @State private var showingDetail = false
    @State private var navigateToHome = false
    @State private var isOptionSelected = false
    @State private var isQuestionRight = false
    @State private var selectedAns = ""
    @State private var totalCorrectQuestion  : Int
    @State private var currentQuestionIndex: Int
    @State private var totalCoins: Int
    @State private var navigateToNextQuestion = false
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var quizData: QuizData
    
    // MARK: - Initializer
    init(selectedCategory: Categories, questions: [Questions], totalCoins: Int, currentQuestionIndex: Int, totalCorrectQuestion : Int) {
        self.selectedCategory = selectedCategory
        self.questions = questions
        self.totalQuestion = questions.count
        self.totalCoins = totalCoins
        self.currentQuestionIndex = currentQuestionIndex
        self.totalCorrectQuestion = totalCorrectQuestion
    }
    
    // MARK: - Body
    var body: some View {
        if showingDetail {
            CustomAlertView(
                bgColor: .red,
                cancleAction: { self.showingDetail.toggle() },
                OkAction: handleAlertOkAction
            )
            .background(bgColor)
            .navigate(to: HomeView().environmentObject(quizData), when: $navigateToHome)
            .navigationBarBackButtonHidden()
        } else {
            contentView
                .navigationBarBackButtonHidden()
        }
    }
    
    // MARK: - Content View
    private var contentView: some View {
        ZStack(alignment: .topLeading) {
            bgColor.ignoresSafeArea()
            VStack {
                headerView
                questionView
                if isOptionSelected {
                    resultView
                } else {
                    optionsView
                }
            }
            .padding()
            .foregroundStyle(.white)
            .blur(radius: showingDetail ? 10 : 0)
            nextButtonView
        }
    }
    
    // MARK: - Header View
    private var headerView: some View {
        ZStack {
            HStack {
                closeButton
                Spacer()
                coinView
            }
            progressView.hidden()
        }
    }
    
    // MARK: - Close Button
    private var closeButton: some View {
        Button(action: { self.showingDetail.toggle() }) {
            Circle()
                .stroke(.white.opacity(0.3), lineWidth: 2.3)
                .frame(width: 30, height: 30)
                .overlay {
                    Image(systemName: "xmark")
                        .foregroundStyle(.white)
                        .padding()
                }
        }
    }
    
    // MARK: - Coin View
    private var coinView: some View {
        
        
        HStack {
            Text("\(totalCoins)")
                .font(Font.custom(AppFont.ragular.rawValue, size: 12))
                .foregroundStyle(.white)
            Image("coinImg")
                .resizable()
                .frame(width: 24, height: 24)
                .background {
                    Circle()
                        .frame(width: 30, height: 30)
                }
        }
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        .background {
            RoundedRectangle(cornerRadius: 25)
                .fill(bgColorCoin)
        }
        
        
    }
    
    // MARK: - Progress View
    private var progressView: some View {
        CircularProgressView(progress: progress, progressWidth: 3, progressColor: .white)
            .frame(width: 48, height: 48)
            .overlay {
                Text(countDown < 10 ? "0\(countDown)" : "\(countDown)")
                    .foregroundStyle(.white)
            }
    }
    
    // MARK: - Question View
    private var questionView: some View {
        VStack(alignment: .leading) {
            Image(questions[currentQuestionIndex].image)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(height: 180)
                .padding(.top, 20)
            
            Text("Question \(currentQuestionIndex + 1) of \(totalQuestion)")
                .font(Font.custom(AppFont.italic.rawValue, size: 14))
                .padding(.top, 20)
                .foregroundStyle(.white)
            
            Text(questions[currentQuestionIndex].question)
                .font(Font.custom(AppFont.ragular.rawValue, size: 30))
                .foregroundStyle(.white)
                .padding(.top, 20)
        }
        .padding()
    }
    
    // MARK: - Result View
    private var resultView: some View {
        VStack {
            optionView(text: selectedAns, imageName: isQuestionRight ? "correctImg" : "wrongImg")
            VStack {
                resultText
                Image(isQuestionRight ? "coinImg" : "imogyImg")
                    .resizable()
                    .frame(width: 54, height: 54)
            }
        }
    }
    
    // MARK: - Result Text
    private var resultText: some View {
        HStack {
            if isQuestionRight {
                Text("That's the ").font(Font.custom(AppFont.italic.rawValue, size: 14))
                + Text("right ").foregroundStyle(Color(hex: "#5CB67C")).font(Font.custom(AppFont.italic.rawValue, size: 16))
                + Text("Answer - +10 Coins").font(Font.custom(AppFont.italic.rawValue, size: 14))
            } else {
                Text("That's the ").font(Font.custom(AppFont.italic.rawValue, size: 14))
                + Text("Wrong ").foregroundStyle(Color(hex: "#FF0A0A")).font(Font.custom(AppFont.italic.rawValue, size: 16))
                + Text("Answer").font(Font.custom(AppFont.italic.rawValue, size: 14))
            }
        }
        .padding()
    }
    
    // MARK: - Options View
    private var optionsView: some View {
        VStack(alignment: .center, spacing: 20) {
            optionView(text: questions[currentQuestionIndex].option1)
            optionView(text: questions[currentQuestionIndex].option2)
            optionView(text: questions[currentQuestionIndex].option3)
        }
        .padding()
    }
    
    // MARK: - Option View
    private func optionView(text: String, imageName: String = "wrongImg") -> some View {
        return  ZStack(alignment: .leading) {
            Button(action: {
                handleOptionSelection(text: text)
            }, label: {
            Spacer()
                    Text(text.uppercased())
                    .font(Font.custom(AppFont.ragular.rawValue, size: 14))
                        .foregroundStyle(.black)
                Spacer()
            })
            .frame(width: 300, height: 50)
            .background(content: {
                RoundedRectangle(cornerRadius: 100)
                    .shadow(color: shadowColor, radius: 3, x: 0, y: 6)
            })
            
            if isOptionSelected{
                Image(imageName)
                    .resizable()
                    .frame(width: 24,height: 24)
                    .padding()
                    .foregroundStyle(.red)
            }
           
        }.allowsHitTesting(!isOptionSelected)
    
    
    }
    
    // MARK: - Next Button View
    private var nextButtonView: some View {
        if isOptionSelected {
            return AnyView(
                ZStack(alignment: .bottomTrailing) {
                    Spacer().ignoresSafeArea()
                    HStack(alignment: .center) {
                        Spacer()
                        Text("\(currentQuestionIndex < questions.count - 1 ? "Next" : "Result")")
                            .font(Font.custom(AppFont.italic.rawValue, size: 14))
                            .padding(.trailing, 5)
                        nextButton
                    }
                }
            )
        } else {
            return AnyView(EmptyView())
        }
    }

    
    // MARK: - Next Button
    private var nextButton: some View {
        if currentQuestionIndex < questions.count - 1 {
            return AnyView(
                Button(action: {
                    self.navigateToNextQuestion = true
                }, label: {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundStyle(.white)
                        .shadow(color: shadowColor, radius: 3, x: 0, y: 6)
                        .overlay {
                            Image(systemName: "arrow.right")
                                .resizable()
                                .padding()
                                .foregroundStyle(textColor)
                        }
                        .frame(width: 67, height: 60)
                        .padding(.trailing, 10)
                })
                .background(
                    NavigationLink(destination: nextQuestionView, isActive: $navigateToNextQuestion) {
                        EmptyView()
                    }
                    .hidden()
                )
            )
        } else {
            return AnyView(
                NavigationLink(destination: ResultView(earnedCoins: totalCoins, totalScored: totalCorrectQuestion, totalQestion: totalQuestion).environmentObject(quizData)) {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundStyle(.white)
                        .shadow(color: shadowColor, radius: 3, x: 0, y: 6)
                        .overlay {
                            Image(systemName: "arrow.right")
                                .resizable()
                                .padding()
                                .foregroundStyle(textColor)
                        }
                        .frame(width: 67, height: 60)
                        .padding(.trailing, 10)
                }
            )
        }
    }

    // MARK: - Next Question View
    private var nextQuestionView: some View {
        QuestionView(
            selectedCategory: selectedCategory,
            questions: questions,
            totalCoins: totalCoins,
            currentQuestionIndex: currentQuestionIndex + 1,
            totalCorrectQuestion: totalCorrectQuestion
        ).environmentObject(quizData)
    }
    
    // MARK: - Handle Option Selection
    private func handleOptionSelection(text: String) {
           isQuestionRight = text == questions[currentQuestionIndex].correctAns
           isOptionSelected = true
           selectedAns = text
           totalCoins += isQuestionRight ? CoinsValue.right.rawValue : CoinsValue.wrong.rawValue
            totalCorrectQuestion  += (isQuestionRight ? 1 : 0)
           updateQuizDataAction()
       }
       
       // MARK: - Handle Alert OK Action
       private func handleAlertOkAction() {
           navigateToHome.toggle()
       }
    
        //MARK: - update quiz data
    private func updateQuizDataAction() {
        if let index = quizData.quizCategories.firstIndex(where: { $0.name == selectedCategory.rawValue }) {
            quizData.quizCategories[index].progress = Float(currentQuestionIndex + 1) / Float(totalQuestion)
            quizData.quizCategories[index].totalCoin = totalCoins
            quizData.quizCategories[index].totalCorrectQuestions = totalCorrectQuestion
            
            // Update totalCoins in quizData
            quizData.totalCoins = quizData.quizCategories.reduce(0) { $0 + $1.totalCoin }
            
            
        }
    }
   }
