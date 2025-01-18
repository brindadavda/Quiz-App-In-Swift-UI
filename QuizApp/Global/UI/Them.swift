//
//  Theme.swift
//  ExploringThemes
//
//  Created by Guillermo Anaya on 28/05/23.
//

import SwiftUI

/// A class that abstract what a theme is
///
/// It will be in change or providing resoruces to the system such as colors, fonts and assets
/// this components will be inside the property wrapper @ThemeProviding see it
/// for more details of ussage
///
/// - Returns: ObservableObject
public final class Theme: ObservableObject {
  
  @Published public private(set) var colorScheme: ColorScheme
  
  public init(colorScheme: ColorScheme) {
    self._colorScheme = Published<ColorScheme>(wrappedValue: colorScheme)
    CPSFonts.registerFonts()
  }

  public func color<Style>(for provider: ColorProvider<Style>, type: ColorType, typeStyle: Style, enabled: Bool) -> Color {
    switch colorScheme {
    case .dark:
      return provider.color(type, typeStyle, enabled).dark
    case .light:
      return provider.color(type, typeStyle, enabled).light
    @unknown default:
      fatalError("fix: unknown colorScheme")
    }
  }
  
  public func image<Catalog>(for provider: ImageProvider<Catalog>, catalog: Catalog) -> Image {
    switch colorScheme {
    case .dark:
      return provider.image(catalog).dark
    case .light:
      return provider.image(catalog).light
    @unknown default:
      fatalError("fix: unknown colorScheme")
    }
  }
  
  public func changeColorScheme(with colorScheme: ColorScheme) {
    guard self.colorScheme != colorScheme else { return }
    self.colorScheme = colorScheme
  }
}

extension Theme {
  static func defaultTheme(colorScheme: ColorScheme) -> Theme {
    return Theme(colorScheme: colorScheme)
  }
}
