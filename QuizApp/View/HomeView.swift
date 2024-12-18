//
//  HomeVS.swift
//  QuizApp
//
//  Created by Brinda Davda on 19/06/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var quizData: QuizData
    
    private let bgColor: LinearGradient = LinearGradient(colors: [Color(hex: "BE86D2"), Color(hex: "E89B9B")], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1))
    private let bgColorCoin: Color = Color(hex: "927AFF")
    private let textColor: Color = Color(hex: "323E5B")
    
    var body: some View {
        ZStack {
            bgColor.ignoresSafeArea()
            VStack(alignment: .leading) {
                headerView
                greetingText
                categoryScrollView
                progressViewBars
                unfinishedGamesList
                Spacer()
            }
            .padding()
            .foregroundStyle(textColor)
        }
        .navigationBarBackButtonHidden()
    }

    
    private var headerView: some View {
        HStack {
            Text("Hello Kitty!")
                .font(Font.custom(AppFont.ragular.rawValue, size: 14))
            Spacer()
            HStack {
                Text("\(quizData.totalCoins)")
                    .foregroundStyle(.white)
                    .font(Font.custom(AppFont.ragular.rawValue, size: 12))
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
    }
    
    private var greetingText: some View {
        Text("What would you like to play today?")
            .foregroundStyle(textColor)
            .font(.title)
            .fontWeight(.semibold)
            .font(Font.custom(AppFont.italic.rawValue, size: 22))
    }
    
    private var categoryScrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Grid {
                GridRow {
                    ForEach(quizData.quizCategories, id: \.self) { category in
                        NavigationLink(destination: questionView(for: category)) 
                        {
                            CardGridView(
                                progressColor: Color(hex: category.hexColor),
                                textColor: textColor,
                                imageName: category.image,
                                categoryName: category.name,
                                totalQuestions: category.questionIDs.count,
                                progress: category.progress
                            )
                        }
                    }
                }
            }
        }
        .frame(height: 200)
    }
    
    private func questionView(for category: QuizCategory) -> some View {
        let totalQuestions = questions.filter { $0.image == category.image }.count
        let currentQuestionIndex = max(0, min(Int(category.progress * Float(totalQuestions)), totalQuestions - 1))

        return QuestionView(
            selectedCategory: Categories(rawValue: category.name) ?? .science,
            questions: questions.filter { $0.image == category.image },
            totalCoins: category.totalCoin,
            currentQuestionIndex: currentQuestionIndex,
            totalCorrectQuestion: category.totalCorrectQuestions
        )
        .environmentObject(quizData)
    }
    
    
    private var progressViewBars: some View {
        HStack {
            ForEach(quizData.quizCategories, id: \.self) { category in
                ProgressView(value: category.progress, total: 100)
                    .frame(width: 15)
                    .tint(Color(hex: category.hexColor))
            }
        }
        .frame(height: 4)
        .padding(.vertical)
    }
    
    
    private var unfinishedGamesList: some View {
        VStack(alignment: .leading) {
            Text("Unfinished Game")
                .font(Font.custom(AppFont.ragular.rawValue, size: 16))
            
            List {
                ForEach(quizData.quizCategories, id: \.self) { category in
                    if category.progress != Float(1){
                        unfinishedGameRow(for: category)
                            .listRowBackground(Color.clear)
                    }
                   
                }
            }
            .listStyle(.inset)
            .scrollContentBackground(.hidden)
            .scrollIndicators(.hidden)
        }
    }
    
    private func unfinishedGameRow(for category: QuizCategory) -> some View {
        CardListView(
            progressColor: Color(hex: category.hexColor),
            textColor: textColor,
            imageName: category.image,
            categoryName: category.name,
            totalQuestions: category.questionIDs.count,
            progress: CGFloat(category.progress)
        )
        .overlay {
            NavigationLink(destination: questionView(for: category)) {
                EmptyView()
            }
            .opacity(0)
        }
    }
}

struct CardGridView: View {
    
    private var progressColor: Color
    private var textColor: Color
    private var imageName: String
    private var categoryName: String
    private var totalQuestions: Int
    private var progress: Float
    
    init(progressColor: Color, textColor: Color, imageName: String, categoryName: String, totalQuestions: Int, progress: Float) {
        self.progressColor = progressColor
        self.textColor = textColor
        self.imageName = imageName
        self.categoryName = categoryName
        self.totalQuestions = totalQuestions
        self.progress = progress
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .trailing) {
                Image(imageName)
                    .resizable()
                    .padding(.leading, 50)
                    .padding(.bottom)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text(categoryName.capitalized)
                        .foregroundStyle(textColor)
                        .font(Font.custom(AppFont.ragular.rawValue, size: 12))
                    
                    HStack {
                        Text("\(totalQuestions) Questions")
                            .foregroundStyle(textColor.opacity(0.4))
                            .font(Font.custom(AppFont.ragular.rawValue, size: 10))
                        
                        Spacer(minLength: 25)
                        
                        ProgressView(value: progress)
                            .tint(progressColor)
                    }
                    .padding(.top, -4)
                }
                .padding([.leading, .bottom, .trailing])
            }
            .frame(width: 200, height: 200)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .shadow(radius: 1)
            }
        }
    }
}

struct CardListView: View {
    
    private var progressColor: Color
    private var textColor: Color
    private var imageName: String
    private var categoryName: String
    private var totalQuestions: Int
    private var progress: CGFloat
    
    init(progressColor: Color, textColor: Color, imageName: String, categoryName: String, totalQuestions: Int, progress: CGFloat) {
        self.progressColor = progressColor
        self.textColor = textColor
        self.imageName = imageName
        self.categoryName = categoryName
        self.totalQuestions = totalQuestions
        self.progress = progress
    }
    
    var body: some View {
        ZStack {
            HStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(categoryName)
                        .foregroundStyle(textColor)
                        .padding(.bottom, 1)
                    
                    Text("\(totalQuestions) Questions")
                        .foregroundStyle(textColor.opacity(0.4))
                        .font(.caption2)
                }
                
                Spacer()
                
                CircularProgressView(progress: progress, progressWidth: 3, progressColor: progressColor)
                    .frame(width: 40, height: 40)
                    .overlay {
                        Text("\(Int(progress * 100))%")
                            .font(.caption)
                            .foregroundStyle(progressColor)
                    }
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.white)
                    .shadow(radius: 3, y: 2)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct CircularProgressView: View {
    let progress: CGFloat
    let progressWidth: CGFloat
    let progressColor: Color
    
    init(progress: CGFloat, progressWidth: CGFloat = 10, progressColor: Color = .blue) {
        self.progress = progress
        self.progressWidth = progressWidth
        self.progressColor = progressColor
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: progressWidth)
                .opacity(0.1)
                .foregroundColor(progressColor)
            
            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(style: StrokeStyle(lineWidth: progressWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(progressColor)
                .rotationEffect(Angle(degrees: 90))
                .animation(.linear, value: progress)
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(QuizData(quizCategories: quizCategories, totalCoins: 0))
}
