//
//  TheamedView.swift
//  QuizApp
//
//  Created by Brinda Davda on 18/01/25.
//

//
//  File.swift
//
//
//  Created by Guillermo Anaya on 7/1/23.
//

import SwiftUI

/// A view modifier representing generic View
///
/// this is the View component, will encapsulate
/// colorSchema UI changes
///
/// ```swift
/// myView
///   .modifier(ThemedView())
/// ```
/// - Returns: some View
struct ThemedView: ViewModifier {
  @ThemeProviding var themeProviding
  
  func body(content: Content) -> some View {
    let backgroundColor = themeProviding.color(
      for: .themedViewStyleProvider,
      type: .background,
      typeStyle: .primary,
      enabled: true
    )
    return content
            .background(backgroundColor)
            .listRowBackground(backgroundColor)
  }
}

/// An enum defining all the styles type used in ThemedView
public enum StyleView {
  case primary
  case alternative
}

extension ColorProvider where Style == StyleView {
  static let themedViewStyleProvider = ColorProvider<StyleView> { type, style, _ in
    switch (type, style) {
    case (.border, .primary):
      return Scheme(light: Color.neutral.white, dark: Color.neutral.black)
    case (.background, _):
      return Scheme(light: Color.neutral.white, dark: Color.neutral.black)
    case (.foreground, _):
      return Scheme(light: Color.neutral.white, dark: Color.neutral.black)
    case (.border, .alternative):
      return Scheme(light: Color.neutral.whiteAlpha, dark: Color.neutral.whiteAlpha)
    }
  }
}
