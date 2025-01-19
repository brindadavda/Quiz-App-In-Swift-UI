////
////  CPSToolbarItem.swift
////
////
////  Created by Enrique Bautista Álvarez on 05/07/23.
////
//
//import SwiftUI
//
//public struct CPSToolbarItem: View {
//  
//  private let type: ItemsNavigationButton
//  private let onAction: () -> Void
//  @ThemeProviding var themeProvider
//  
//  var foregroundSystemColor: Color {
//    return themeProvider.color(for: .toolbarStyleProvider, type: .foreground, typeStyle: .systemMode, enabled: true)
//  }
//
//  public init(type: ItemsNavigationButton, onAction: @escaping () -> Void = {}) {
//    self.type = type
//    self.onAction = onAction
//  }
//  
//  public var body: some View {
//    switch type {
////    case .profile(let image):
////      if let url = URL(string: image ?? "") {
////        Button {
////          onAction()
////        } label: {
////          WebImage(url: url) { image in
////            image
////              .resizable()
////          } placeholder: {
////            Color.grey.g20
////          }
////          .frame(width: 32, height: 32)
////          .cornerRadius(16)
////        }
////      } else {
////        Button("", action: {
////          onAction()
////        })
////        .blockbusterNavigationButtonStyle(
////          type: .buttonProfile,
////          withBackground: false)
////        .isHidden(!Settings.shared.clientFlagActive(.countryLoyalty))
////      }
//    case .title(let title):
//      Text(title)
//        .font(Font.caption)
//        .foregroundColor(foregroundSystemColor)
//    case let .navigationTitle(title, style):
//      Button {
//        onAction()
//      } label: {
//        Text(title)
//          .font(Font.labelsSemiBold)
//          .foregroundColor(getColorByStyleMode(style))
//      }
//    case .profileWithoutBackground:
//        Button("", action: {
//            onAction()
//        })
////      }).blockbusterNavigationButtonStyle(type: .profile, withBackground: false)
//    case .settings:
//      Button("", action: {
//        onAction()
//      }).blockbusterSettingsButtonStyle()
//    }
//  }
//}
//
//extension CPSToolbarItem {
//  private func getColorByStyleMode(_ style: ToolbarStyle) -> Color {
//    return themeProvider.color(for: .toolbarStyleProvider, type: .foreground, typeStyle: style, enabled: true)
//  }
//}
//
///// An enum defining all types objects used in Navigation bar
//public enum ItemsNavigationButton {
//  case profile(String)
//  case title(String)
//  case navigationTitle(_ title: String, style: ToolbarStyle = .systemMode)
//  case profileWithoutBackground
//  case settings
//}
//
//public extension View {
//  /// A helper function to use the [CPSToolbarItem]
//  ///
//  /// ```swift
//  /// myView
//  ///   .blockbusterToolbar(navigationBarLeading: [], navigationCenterView: [], navigationBarTrailing: [])
//  /// ```
//  /// - Returns: some View
//  func blockbusterToolbar(navigationBarLeading: [CPSToolbarItem], navigationCenterView: [CPSToolbarItem], navigationBarTrailing: [CPSToolbarItem], bakgroundColor: CAGradientLayer? = nil) -> some View {
//    if let gradientColor = bakgroundColor {
//      self.updateStyleBackgroundNavigationBar(gradient: gradientColor)
//    }
//    return self.navigationBarTitleDisplayMode(.inline)
//      .navigationBarBackButtonHidden(true)
//      .toolbar {
//        ToolbarItemGroup(placement: .navigationBarLeading) {
//          HStack(spacing: 0) {
//            ForEach(0..<navigationBarLeading.count, id: \.self) { index in
//              navigationBarLeading[index]
//            }
//          }
//        }
//        ToolbarItemGroup(placement: .principal) {
//          HStack(spacing: 0) {
//            ForEach(0..<navigationCenterView.count, id: \.self) { index in
//              navigationCenterView[index]
//            }
//          }
//        }
//        ToolbarItemGroup(placement: .navigationBarTrailing) {
//          HStack(spacing: 0) {
//            ForEach(0..<navigationBarTrailing.count, id: \.self) { index in
//              navigationBarTrailing[index]
//            }
//          }
//        }
//      }
//  }
//  
////  private func updateStyleBackgroundNavigationBar(gradient: CAGradientLayer) {
////    UINavigationBar.appearance().setBackgroundImage(UIImage.imageLayer(fromLayer: gradient), for: .default)
////  }
//}
//
//public enum ToolbarStyle {
//  case systemMode
//  case ligthMode
//  case darkMode
//}
//
//extension ColorProvider where Style == ToolbarStyle {
//  
//  /// default implementation for DropdownSeat
//  static let toolbarStyleProvider = ColorProvider<ToolbarStyle> { type, style, isEnabled in
//    switch (type, style, isEnabled) {
//    case (.foreground, .systemMode, _):
//      return Scheme(light: Color.primary.p100, dark: Color.neutral.white)
//    case (.foreground, .ligthMode, _):
//      return Scheme(light: Color.primary.p60, dark: Color.primary.p60)
//    case (.foreground, .darkMode, _):
//      return Scheme(light: Color.neutral.white, dark: Color.neutral.white)
//    default:
//      return Scheme(light: .clear, dark: .clear)
//    }
//  }
//}
