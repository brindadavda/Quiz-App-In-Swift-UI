//
//  ThemeProviding.swift
//  ExploringThemes
//
//  Created by Guillermo Anaya on 28/05/23.
//

import SwiftUI

/// A property wrapper used to react to changes in the theme
///
/// this is the main component bunlding the UI and the theme object
/// It will wrap an intance of the theme, givig acces to the accesor of it
///
/// ```swift
/// @ThemeProviding var themeProviding
/// themeProvider.color(for: aColorProvider, type: componentType)
/// ```
/// - Returns: some DynamicProperty<Theme>
@propertyWrapper
public struct ThemeProviding: DynamicProperty {
  @EnvironmentObject private var themeProvider: Theme
  
  public var wrappedValue: Theme {
    themeProvider
  }
  
  public init() {}
}
