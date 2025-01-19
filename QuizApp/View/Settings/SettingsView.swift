//
//  SettingsView.swift
//  QuizApp
//
//  Created by Brinda Davda on 18/01/25.
//

import SwiftUI

struct SettingsView: View {
    
    @ThemeProviding var themeProvider
    
    var body: some View {
        VStack {
            RawView(imageName: "eye.circle", text: "Appereance", selection: "Light",values: ["Light","Dark"])
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Settings")
                    .foregroundStyle(forgroundColor)
            }
            
                
        }
        .navigationBarTitleDisplayMode(.inline)
    }
       
}

private extension SettingsView {
    
    var forgroundColor: Color {
        themeProvider.color(for: .blockbusterLabelStyleProvider, type: .foreground, typeStyle: .label, enabled: true)
    }
}


#Preview {
    SettingsView()
        .environmentObject(Theme(colorScheme: .dark))
}
