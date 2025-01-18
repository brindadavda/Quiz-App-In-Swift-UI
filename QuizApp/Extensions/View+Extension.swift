//
//  View+Extension.swift
//  QuizApp
//
//  Created by Brinda Davda on 25/06/24.
//

import Foundation
import SwiftUI

extension View {
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

public extension View {
  func themed() -> some View {
    self.modifier(ThemedView())
  }
}

public extension View {
  
  /// A modifier that initiates theme provider and inject view as an environment object. This modifier should be called only once at the top of view hierarchy.
  /// - Parameter colorScheme: the initial colorScheme for start the app
  /// - Returns: view
  func themeProviding(colorScheme: ColorScheme = .light) -> some View {
    return self.modifier(ThemeProvidingViewModifier(colorScheme: colorScheme))
  }
}
