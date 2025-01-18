//
//  ThemeProvidingViewModifier.swift
//  ExploringThemes
//
//  Created by Guillermo Anaya on 28/05/23.
//

import SwiftUI

/// A view modifier representing a theem provider
///
/// this is the main component bunlding the UI and the theme object
/// It will pass down the changes of the `colorScheme` by the system
/// or by the user choise
///
/// ```swift
/// myView
///   .modifier(ThemeProvidingViewModifier())
/// ```
/// - Returns: some View
struct ThemeProvidingViewModifier: ViewModifier {
  @ObservedObject var themeProvider: Theme
  
  @Environment(\.colorScheme)
  private var colorScheme
  
  func body(content: Content) -> some View {
    content
      .onChange(of: colorScheme) { colorScheme in
        g_debounce?.invalidate()
        g_debounce = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { _ in
          themeProvider.changeColorScheme(with: colorScheme)
        }
      }
      .onAppear {
        themeProvider.changeColorScheme(with: colorScheme)
      }
      .environmentObject(themeProvider)
  }
  
  init(colorScheme: ColorScheme) {
  //  g_themeProvidingCalls += 1
   // let enviromentString = (Bundle.main.object(forInfoDictionaryKey: "Configuration") as? [String: Any])?["Enviroment"] as? String
   /* precondition(!(enviromentString == "qa" && g_themeProvidingCalls > 4), "This method should only be called once at top level of the app")
    */
    self._themeProvider = ObservedObject<Theme>(wrappedValue: .defaultTheme(colorScheme: colorScheme))
  }
}

//fileprivate var g_themeProvidingCalls = 0
fileprivate var g_debounce: Timer?
