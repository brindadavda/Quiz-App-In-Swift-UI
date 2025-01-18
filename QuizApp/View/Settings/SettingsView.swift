//
//  SettingsView.swift
//  QuizApp
//
//  Created by Brinda Davda on 18/01/25.
//

import SwiftUI

struct SettingsView: View {
    
    @ThemeProviding var themProvider
    
    var body: some View {
        VStack {
            RawView(imageName: "eye.circle", text: "Appereance", selection: "Light",values: ["Light","Dark"])
            
            Spacer()
        }
        .navigationTitle("Settings")
    }
       
}


#Preview {
    SettingsView()
        .environmentObject(Theme(colorScheme: .dark))
}
