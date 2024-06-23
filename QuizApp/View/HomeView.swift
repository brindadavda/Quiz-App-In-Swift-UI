//
//  HomeVS.swift
//  QuizApp
//
//  Created by Brinda Davda on 19/06/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var quizData: QuizData

    private let bgColor: Color = Color(hex: "E89B9B")
    private let bgColorCoin: Color = Color(hex: "927AFF")
    private let textColor: Color = Color(hex: "323E5B")

    var body: some View {
        ZStack {
            bgColor.ignoresSafeArea()
            VStack(alignment: .leading) {
                HStack {
                    Text("Hello Kitty!")
                    Spacer()
                    HStack {
                        Text("\(quizData.totalCoins)")
                            .foregroundStyle(.white)
                        Image(systemName: "circle.fill")
                            .foregroundStyle(.yellow)
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
                Text("What would you like to play today?")
                    .foregroundStyle(textColor)
                    .font(.title)
                    .fontWeight(.semibold)

                ScrollView(.horizontal, showsIndicators: false) {
                    Grid {
                        GridRow {
                            ForEach(quizData.quizCategories, id: \.self) { category in
                                NavigationLink(destination: QuestionView(
                                    selectedCategory: Categories(rawValue: category.name)
                                    ?? .science,
                                    questions: questions.filter { $0.image == category.image }
                                ).environmentObject(quizData)) {
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

                HStack {
                    ForEach(quizData.quizCategories, id: \.self) { category in
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 15)
                            .foregroundStyle(Color(hex: category.hexColor))
                    }
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: 4,
                    alignment: .topLeading
                )
                .padding(.top)
                .padding(.bottom)

                Text("Unfinished Game")
                    .font(.headline)

                List {
                    ForEach(quizData.quizCategories, id: \.self) { category in
                        CardListView(
                            progressColor: Color(hex: category.hexColor),
                            textColor: textColor,
                            imageName: category.image,
                            categoryName: category.name,
                            totalQuestions: category.questionIDs.count,
                            progress: CGFloat(category.progress)
                        )
                        .overlay {
                            NavigationLink(destination: QuestionView(
                                selectedCategory: Categories(rawValue: category.name) ?? .science,
                                questions: questions.filter { $0.image == category.image }
                            )) {
                                EmptyView()
                            }
                            .opacity(0)
                        }
                    }
                    .listRowBackground(Color.clear)
                }
                .listStyle(.inset)
                .scrollContentBackground(.hidden)
                .scrollIndicators(.hidden)

                Spacer()
            }
            .padding()
            .foregroundStyle(textColor)
        }
    }
}

struct CardGridView : View {
    
    private var progressColor : Color = .cyan
    private var textColor : Color = .cyan
    
    private var imageName : String = "introImg"
    private var categoryName : String = "Sport Quiz"
    private var totalQuestions : Int = 0
    private var progress : Float = 0.4
    
    init(progressColor: Color, textColor: Color, imageName: String, categoryName: String, totalQuestions: Int , progress : Float) {
        self.progressColor = progressColor
        self.textColor = textColor
        self.imageName = imageName
        self.categoryName = categoryName
        self.totalQuestions = totalQuestions
        self.progress = progress
    }
    
    var body: some View{
        ZStack {
            VStack(alignment : .trailing){
                Image(imageName)
                    .resizable()
                    .padding(.leading,50)
                    .padding(.bottom)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                
                VStack (alignment : .leading){
                    Text(categoryName.capitalized)
                        .foregroundStyle(textColor)
                    
                    HStack{
                        Text("\(totalQuestions) Questions")
                            .foregroundStyle(textColor.opacity(0.4))
                            .font(.caption2)
                        
                        Spacer(minLength: 25)
                        
                        ProgressView(value: progress)
                            .tint(progressColor)
                        
                    }
                    .padding(.top,-4)
                }
                .padding(.leading)
                .padding(.bottom)
                .padding(.trailing)
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .frame(width: 200,height: 200)
            .background{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .shadow(radius: 1)
            }
        }
    }
}



struct CardListView : View{
    
    private var progressColor : Color = .cyan
    private var textColor : Color = .cyan

    private var imageName : String = "introImg"
    private var categoryName : String = "Sport Quiz"
    private var totalQuestions : Int = 0
    private var progress : CGFloat = 0.6
    
    init(progressColor: Color, textColor: Color, imageName: String, categoryName: String, totalQuestions: Int, progress: CGFloat) {
        self.progressColor = progressColor
        self.textColor = textColor
        self.imageName = imageName
        self.categoryName = categoryName
        self.totalQuestions = totalQuestions
        self.progress = progress
    }
    
    var body: some View{
        ZStack{
            HStack{
                Image(imageName)
                    .resizable()
                    .frame(width: 40,height: 40)
                    .clipShape(Circle())
                
                VStack(alignment : .leading){
                    Text(categoryName)
                        .foregroundStyle(textColor)
                        .padding(.bottom,1)
                    
                    Text("\(totalQuestions) Questions")
                        .foregroundStyle(textColor.opacity(0.4))
                        .font(.caption2)
                }
                
                Spacer()
                
                CircularProgressView(progress: progress , progressWidth: 3 , progressColor: progressColor)
                    .frame(width: 40,height: 40)
                    .overlay{
                        Text("\(Int(progress*100))%")
                            .font(.caption)
                            .foregroundStyle(progressColor)
                    }
                
            }
            .padding()
            .background{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.white)
                    .shadow(radius: 3,y: 2)
            }
        }
        .navigationBarBackButtonHidden()
    }
    
}


struct CircularProgressView: View {
  let progress: CGFloat
  let progressWidth: CGFloat
    let progressColor : Color
    
    init(progress: CGFloat, progressWidth: CGFloat = 10 , progressColor: Color = .blue) {
        self.progress = progress
        self.progressWidth = progressWidth
        self.progressColor = progressColor
    }

  var body: some View {
    ZStack {
      // Background for the progress bar
      Circle()
        .stroke(lineWidth: progressWidth)
        .opacity(0.1)
        .foregroundColor(progressColor)

      // Foreground or the actual progress bar
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
        .environmentObject(QuizData(quizCategories: quizCategories, totalCoins: 100))
}
