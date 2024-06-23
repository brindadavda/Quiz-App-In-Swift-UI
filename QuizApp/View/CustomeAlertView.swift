//
//  CustomeAlertView+Extension.swift
//  QuizApp
//
//  Created by Brinda Davda on 21/06/24.
//

import Foundation
import SwiftUI


struct CustomAlertView : View {
    
    var bgColor : Color = .gray.opacity(0.1)
    private let textColor : Color = Color(hex: "323E5B")
    
    private let cancleBgColor : LinearGradient = LinearGradient(colors: [.red,.white.opacity(0.3),.red], startPoint: UnitPoint(x: 0, y: 0.5), endPoint: UnitPoint(x: 0.5, y: 1))
    private let okBgColor : LinearGradient = LinearGradient(colors: [.green,.white.opacity(0.3),.green], startPoint: UnitPoint(x: 0, y: 0.5), endPoint: UnitPoint(x: 0.5, y: 1))
    
     let cancleAction : () -> Void
     let OkAction : () -> Void
    
    init(bgColor: Color, cancleAction: @escaping () -> Void, OkAction: @escaping () -> Void) {
        self.bgColor = bgColor
        self.cancleAction = cancleAction
        self.OkAction = OkAction
    }
   
    
    var body: some View {
        ZStack(){
            
//            bgColor.ignoresSafeArea()
            Spacer().ignoresSafeArea()
            
            VStack{
                Text("Are you sure ?".capitalized)
                    .font(.title)
                    .padding(.bottom,5)
                
                Text("You want to quit?")
                    .font(.headline)
                
                HStack{
                    cancleView.frame(width: 48,height: 48)
                        .padding(.trailing,30)
                        
                    okView.frame(width: 48,height: 48)
                }
                .padding()
                

            }
            .foregroundStyle(textColor)
            .padding(.all,30)
            .frame(height: 200)
            .background{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(.white)
                    .shadow(radius: 30)
            }
        }
    }

    
    
    var cancleView : some View{
        Button(action: {
            cancleAction()
        }, label: {
            Circle()
                .fill(cancleBgColor)
                .overlay{
                    Image(systemName: "xmark")
                        .foregroundStyle(textColor)
                        .font(.largeTitle)
                }
                
        })
    }
    
    var okView : some View{
        Button(action: {
            OkAction()
        }, label: {
            Circle()
                .fill(okBgColor)
                .overlay{
                    Image(systemName: "checkmark")
                        .font(.largeTitle)
                        .foregroundStyle(textColor)
                }
                
        })
    }
}


#Preview {
    CustomAlertView(bgColor: .gray, cancleAction: {}, OkAction: {})
}
