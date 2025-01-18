//
//  ColorProvider.swift
//  ExploringThemes
//
//  Created by Guillermo Anaya on 28/05/23.
//

import SwiftUI

/// A protocol that represent a component that will be in charge of
/// providing colors for light and dar themes of the system
///
///
/// ```swift
/// struct ButtonColor: ColorProvider {
/// func color(for type: ColorType) -> ColorTheme {
///   return ColorTheme(light: .white, dark: .black)
/// }
/// ```
/// - Returns: ColorTheme
public struct ColorProvider<Style> {
  public var color: (ColorType, Style, Bool) -> Scheme<Color>
  
  public init(color: @escaping (ColorType, Style, Bool) -> Scheme<Color>) {
    self.color = color
  }
}

/// A enum that holds all the different colors types for component  property
/// such as border or background
///
/// - Returns: ColorType
public enum ColorType {
  case background
  case border
  case foreground
}
