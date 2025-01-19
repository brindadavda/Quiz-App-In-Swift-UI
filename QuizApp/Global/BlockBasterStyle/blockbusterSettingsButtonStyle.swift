////
////  BlockbusterSettingsButtonStyle.swift
////
////
////  Created by Ricardo García Rodríguez on 11/09/24.
////
//
//import SwiftUI
//
///// A button style representing the blockbuster Settings  button
/////
///// You can create a BlockbusterSettingsButtonStyle using the ``buttonStyle<S>(_ style: S)``
/////
///// ```swift
///// buttonStyle(BlockbusterSettingsButtonStyle())
///// ```
///// - Returns: some View
//private struct BlockbusterSettingsButtonStyle: ButtonStyle {
//  
//  private var style: SettingsButtonStyle
//  private var title: String
//  
//  func makeBody(configuration: Self.Configuration) -> some View {
//    _BlockbusterSettingsButtonView(title: self.title, style: self.style, configuration: configuration)
//  }
//  
//  public init(_ title: String, _ style: SettingsButtonStyle = .systemMode) {
//    self.style = style
//    self.title = title
//  }
//  
//  struct _BlockbusterSettingsButtonView: View {
//    @ThemeProviding var themeProvider
//    let configuration: ButtonStyle.Configuration
//    private var title: String
//    private var style: SettingsButtonStyle
//    
//    var foregroundColor: Color {
//      return themeProvider.color(for: .settingsButtonStyleProvider, type: .foreground, typeStyle: style, enabled: true)
//    }
//    
////    var icon: Image {
////      themeProvider.image(for: .blockbusterSettingsButtonImageProvider, catalog: .settings)
////    }
//    
//    init(title: String = "", style: SettingsButtonStyle, configuration: ButtonStyleConfiguration) {
//      self.title = title
//      self.style = style
//      self.configuration = configuration
//    }
//    
//    var body: some View {
//      HStack(spacing: 0) {
////        icon
////          .fontWeight(.semibold)
////          .foregroundColor(foregroundColor)
////          .frame(width: Spacing.six.rawValue, height: Spacing.six.rawValue)
//        Text(title)
//          .font(.footnote)
//          .foregroundColor(foregroundColor)
//          .multilineTextAlignment(.leading)
//          .lineLimit(1)
//          .isHidden(title.isEmpty)
//        Spacer()
//      }
//    }
//  }
//}
//
//public extension Button {
//  /// A helper function to use the BlockbusterSettingsButtonStyle
//  ///
//  /// ```swift
//  /// myView
//  ///   .blockbusterSettingsButtonStyle()
//  /// ```
//  /// - Returns: some View
//  func blockbusterSettingsButtonStyle(title: String = "", styleColor: SettingsButtonStyle = .systemMode) -> some View {
//    buttonStyle(BlockbusterSettingsButtonStyle(title, styleColor))
//  }
//}
//
//public enum ImagesSettingsButton {
//  case settings
//}
//
//extension ImageProvider where ImageCatalog == ImagesSettingsButton {
//  static let blockbusterSettingsButtonImageProvider = ImageProvider<ImagesSettingsButton> { catalog in
//    switch catalog {
//    case .settings:
//      return Scheme(light: Image("SettingsLight", bundle: Bundle.module), dark: Image("SettingsDark", bundle: Bundle.module))
//    }
//  }
//}
//
//public enum SettingsButtonStyle {
//  case systemMode
//  case ligthMode
//  case darkMode
//}
//
//extension ColorProvider where Style == SettingsButtonStyle {
//  static let settingsButtonStyleProvider = ColorProvider<SettingsButtonStyle> { type, style, isEnabled in
//    switch (type, style, isEnabled) {
//    case (.foreground, .systemMode, _):
//      return Scheme(light: Color.primary.p100, dark: Color.neutral.white)
//    case (.foreground, .ligthMode, _):
//      return Scheme(light: Color.primary.p100, dark: Color.primary.p100)
//    case (.foreground, .darkMode, _):
//      return Scheme(light: Color.neutral.white, dark: Color.neutral.white)
//    default:
//      return Scheme(light: .clear, dark: .clear)
//    }
//  }
//}
