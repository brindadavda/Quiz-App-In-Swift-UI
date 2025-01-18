//
//  BlockbusterLabelStyle.swift
//
//
//  Created by Leslie Yaneth Romero Ledezma on 11/08/23.
//

import Foundation
import SwiftUI
/// A label style representing the blockbuster label
///
/// You can create a BlockbusterLabelStyle using the ``labelStyle<S>(_ style: S)``
///
/// ```swift
/// labelStyle(BlockbusterLabelStyle())
/// ```
/// - Returns: some View
/// A label style representing the blockbuster label

private struct BlockbusterLabelStyle: LabelStyle {
  private var style: StyleLabel
  private var typeFont: Font
  
  func makeBody(configuration: Self.Configuration) -> some View {
    _BlockbusterLabelView(styleType: style, configuration: configuration, typeFont: typeFont)
  }
  
  init(style: StyleLabel = .primary, typeFont: Font) {
    self.style = style
    self.typeFont = typeFont
  }
  
  struct _BlockbusterLabelView: View {
    private var styleType: StyleLabel
    private var typeFont: Font
    @ThemeProviding var themeProvider
    let configuration: LabelStyle.Configuration
    var foregroundColor: Color {
      themeProvider.color(for: .blockbusterLabelStyleProvider, type: .foreground, typeStyle: styleType, enabled: true)
    }
    
    init(styleType: StyleLabel, configuration: LabelStyleConfiguration, typeFont: Font) {
      self.styleType = styleType
      self.configuration = configuration
      self.typeFont = typeFont
    }
    
    var body: some View {
      configuration.title
        .font(typeFont)
        .foregroundColor(foregroundColor)
    }
  }
}

public extension Label {
  /// A helper function to use the BlockbusterLabelStyle
  ///
  /// ```swift
  /// myView
  ///   .blockbusterLabelStyle()
  /// ```
  /// - Returns: some View
  func blockbusterLabelStyle(typeFont: Font) -> some View {
    labelStyle(BlockbusterLabelStyle(typeFont: typeFont))
  }
}

/// An enum defining all the styles type used in Label
public enum StyleLabel {
  case primary
  case title
  case subtitle
  case label
  case description
  case background
  case border
  case shadow
  case utilityOrders
  case location
  case borderCard
  case backgroundCard
  case backgroundPromo
  case titlePromo
  case datePromo
  case rating
  case status
  case seat
  case inactivePromo
}

public extension ColorProvider where Style == StyleLabel {
  /// default implementation for BlockbusterLabelStyle
  static let blockbusterLabelStyleProvider = ColorProvider<StyleLabel> { type, style, isEnabled in
    switch (type, style, isEnabled) {
    case (.foreground, .primary, true):
      return Scheme(light: Color.grey.g50, dark: Color.grey.g40)
    case (.foreground, .primary, false):
      return Scheme(light: Color.grey.g50, dark: Color.grey.g40)
    case (.foreground, .title, true):
      return Scheme(light: Color.primary.p100, dark: Color.neutral.white)
    case (.foreground, .title, false):
      return Scheme(light: Color.neutral.black, dark: Color.neutral.white)
    case (.foreground, .subtitle, true):
      return Scheme(light: Color.primary.p90, dark: Color.neutral.white)
    case (.foreground, .subtitle, false):
      return Scheme(light: Color.grey.g40, dark: Color.neutral.white)
    case (.foreground, .label, true):
      return Scheme(light: Color.grey.g50, dark: Color.neutral.white)
    case (.foreground, .description, true):
      return Scheme(light: Color.grey.g50, dark: Color.grey.g20)
    case (.foreground, .background, true):
      return Scheme(light: Color.grey.g10, dark: Color.primary.p100)
    case (.foreground, .background, false):
      return Scheme(light: Color.neutral.white, dark: Color.neutral.black)
    case (.foreground, .border, true):
      return Scheme(light: Color.grey.g10, dark: Color.primary.p100)
    case (.foreground, .border, false):
      return Scheme(light: Color.neutral.white, dark: Color.primary.p100)
    case (.foreground, .shadow, true):
      return Scheme(light: Color.grey.g30, dark: Color.primary.p100)
    case (.foreground, .utilityOrders, true):
      return Scheme(light: Color.grey.g20, dark: Color.grey.g50)
    case (.foreground, .location, true):
      return Scheme(light: Color.grey.g50, dark: Color.grey.g30)
    case (.foreground, .location, false):
      return Scheme(light: Color.grey.g60, dark: Color.neutral.white)
    case (.foreground, .borderCard, true):
      return Scheme(light: Color.primary.p60, dark: Color.primary.p60)
    case (.foreground, .borderCard, false):
      return Scheme(light: Color.primary.p60, dark: Color.neutral.white)
    case (.foreground, .backgroundCard, true):
      return Scheme(light: Color.grey.g10, dark: Color.primary.p100)
    case (.foreground, .backgroundCard, false):
      return Scheme(light: Color.neutral.white, dark: Color.primary.p100)
    case (.foreground, .backgroundPromo, true):
      return Scheme(light: Color.grey.g10, dark: Color.primary.p100)
    case (.foreground, .backgroundPromo, false):
      return Scheme(light: Color.grey.g30, dark: Color.primary.p90)
    case (.foreground, .titlePromo, true):
      return Scheme(light: Color.primary.p10, dark: Color.neutral.white)
    case (.foreground, .titlePromo, false):
      return Scheme(light: Color.promo.p50, dark: Color.neutral.white)
    case (.foreground, .datePromo, true):
      return Scheme(light: Color.promo.p50, dark: Color.promo.p50)
    case (.foreground, .rating, true):
      return Scheme(light: Color.grey.g20, dark: Color.primary.p90)
    case (.foreground, .status, true):
      return Scheme(light: Color.grey.g10, dark: Color.primary.p90)
    case (.foreground, .status, false):
      return Scheme(light: Color.grey.g30, dark: Color.primary.p60)
    case (.foreground, .seat, true):
      return Scheme(light: Color.grey.g30, dark: Color.grey.g20)
    case (.foreground, .inactivePromo, true):
      return Scheme(light: Color.grey.g80, dark: Color.grey.g90)
    default:
      return Scheme(light: .clear, dark: .clear)
    }
  }
}
