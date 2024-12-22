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
    
     let cancleAction : () -> Void
     let OkAction : () -> Void
   
    private var alertTitle : String
    private var alertMessage : String
    
    init(bgColor: Color, cancleAction: @escaping () -> Void, OkAction: @escaping () -> Void, alertTitle: String = "Are you sure ?", alertMessage: String  = "") {
        self.bgColor = bgColor
        self.cancleAction = cancleAction
        self.OkAction = OkAction
        self.alertTitle = alertTitle
        self.alertMessage = alertMessage
    }
   
    
    var body: some View {
        ZStack(){
            
//            bgColor.ignoresSafeArea()
            Spacer().ignoresSafeArea()
            
            VStack{
                Text(alertTitle.capitalized)
                    .font(.title)
                    .padding(.bottom,5)
                
                Text(alertMessage)
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
            .frame(width: 300,height: 200)
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
           
                    Image("wrongImg")
                        .foregroundStyle(textColor)
                        .font(.largeTitle)
                
                
        })
    }
    
    var okView : some View{
        Button(action: {
            OkAction()
        }, label: {
           
                    Image("correctImg")
                        .font(.largeTitle)
                        .foregroundStyle(textColor)
                
                
        })
    }
}


#Preview {
    CustomAlertView(bgColor: .gray, cancleAction: {}, OkAction: {})
}
