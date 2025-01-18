//
//  RawView.swift
//  QuizApp
//
//  Created by Brinda Davda on 18/01/25.
//

import SwiftUI

struct RawView: View {
    
    private var imageName: String
    private var text: String
    private var values: [String]
    
    @ThemeProviding var themeProvider
    @State var selection: String
    
    init(imageName: String, text: String,selection: String, values: [String] = []) {
        self.imageName = imageName
        self.text = text
        self.selection = selection
        self.values = values
    }
    
    var body: some View {
        HStack (spacing: 15){
            Image(systemName: imageName)
                .resizable()
                .frame(width: iconWidth,height: iconHeight)
                .foregroundStyle(forgroundColor)
            
            Text(text)
                .font(.title3)
                .foregroundStyle(forgroundColor)
                .fontWeight(.bold)
            
            Spacer()
            
            if !values.isEmpty {
                Picker("", selection: $selection) {
                    ForEach(values, id: \.self) {
                        Text($0)
                            .font(.headline)
                            .foregroundStyle(forgroundColor)
                            .fontWeight(.bold)
                    }
                }
                .pickerStyle(.menu)
                .onChange(of: selection, perform: { newValue in
                    handleThemeChange(for: newValue)
                })
            }
        }
        .padding()
        .frame(width: viewWidth ,height: viewHeight, alignment: .leading)
        .themed()
        
    }
}

#Preview {
    RawView(imageName: "pencil", text: "Pencil", selection: "Light",values: ["Light","Dark"])
        .environmentObject(Theme(colorScheme: .light))
}


private extension RawView {
    
    var viewWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    var viewHeight: CGFloat {
        42
    }
    
    var iconWidth: CGFloat {
        16
    }
    
    var iconHeight: CGFloat {
        16
    }
}

private extension RawView {
    
    var forgroundColor: Color {
        themeProvider.color(for: .blockbusterLabelStyleProvider, type: .foreground, typeStyle: .label, enabled: true)
    }
}


private extension RawView {
    private func handleThemeChange(for newValue: String) {
            switch newValue {
            case "Light":
                themeProvider.changeColorScheme(with: .light)
            case "Dark":
                themeProvider.changeColorScheme(with: .dark)
            default:
                break
            }
        }
}
