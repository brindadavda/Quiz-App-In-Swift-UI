//
//  CountDownView.swift
//  QuizApp
//
//  Created by Brinda Davda on 21/12/24.
//

import SwiftUI

struct TimerCircleView: View {
    @State private var timeRemaining = 10 // Example timer value (60 seconds)
    @State private var isRunning = false
    @State private var timer: Timer? = nil
    
    let totalTime: Int = 10 // Total timer duration
    
    var body: some View {
        VStack {
            ZStack {
                // Background Circle
                Circle()
                    .stroke(Color.gray.opacity(0.3), lineWidth: 3)
                    .frame(width: 50, height: 50)
                
                // Animated Circle to show progress
                Circle()
                    .trim(from: 0, to: CGFloat(timeRemaining) / CGFloat(totalTime))
                    .stroke(Color.white, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                    .frame(width: 50, height: 50)
                    .animation(.linear(duration: 1), value: timeRemaining)
                
                // Timer Text
                Text(String(format: "%02d", timeRemaining))
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
            }
            .padding()
            
        }
        .onAppear {
            startTimer() // Start the timer when the view appears
        }
        .onChange(of: timeRemaining) { newValue in
            if newValue <= 0 {
                timer?.invalidate() // Stop the timer when it reaches 0
            }
        }
    }
    
    func toggleTimer() {
        if isRunning {
            timer?.invalidate()
        } else {
            startTimer()
        }
        isRunning.toggle()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
    }
}
