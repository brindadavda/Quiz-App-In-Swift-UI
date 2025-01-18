//
//  Fonts.swift
//  QuizApp
//
//  Created by Brinda Davda on 18/01/25.
//

import SwiftUI


/// A enum that represents the custom font type used in the theme
enum CPSFontsType: String, CaseIterable {
    case italic = "ABeeZee-Italic"
    case ragular = "ABeeZee-Regular"
}

/// A enum that represents the sizes font  used in the theme
//public enum CPSSize: CGFloat {
//  case fortyFour = 44.0
//  case thirtyTwo = 32.0
//  case twentyEight = 28.0
//  case twentyFour = 24
//  case twenty = 20.0
//  case sixteen = 16.0
//  case fourteen = 14.0
//  case twelve = 12.0
//  case ten = 10.0
//}

public extension Font {
  /// A convinience initializer to help create fonts accepting the custom style
  ///
  /// You can create a Color using the ``init(font:relativeTo:)`` initializer
  ///
  /// ```swift
  /// let font = custom(.h5, relativeTo: .body)
  /// ```
  /// - Returns: Font
  private static func custom(_ type: CPSFontsType, _ size: CGFloat, relativeTo style: Font.TextStyle = .body) -> Font {
    custom(type.rawValue, size: size, relativeTo: style)
  }
  
  // TODO: we need to work over the relativeTo property provide the right one
//  static let h6 = custom(CPSFontsType.bold, CPSSize.twelve.rawValue)
//  static let h5 = custom(CPSFontsType.bold, CPSSize.sixteen.rawValue)
//  static let h4 = custom(CPSFontsType.extraBold, CPSSize.twenty.rawValue)
//  static let h3 = custom(CPSFontsType.extraBold, CPSSize.twentyEight.rawValue)
//  static let h2 = custom(CPSFontsType.extraBold, CPSSize.thirtyTwo.rawValue)
//  static let h1 = custom(CPSFontsType.extraBold, CPSSize.fortyFour.rawValue)
//  
//  static let paragraph = custom(CPSFontsType.regular, CPSSize.twentyFour.rawValue)
//  static let cpsbody = custom(CPSFontsType.medium, CPSSize.twentyFour.rawValue)
//  static let subtitles = custom(CPSFontsType.medium, CPSSize.twenty.rawValue)
//  static let subtitlesBold = custom(CPSFontsType.bold, CPSSize.twenty.rawValue)
//  static let labels = custom(CPSFontsType.medium, CPSSize.sixteen.rawValue)
//  static let labelsRegular = custom(CPSFontsType.regular, CPSSize.sixteen.rawValue)
//  static let labelsSemiBold = custom(CPSFontsType.bold, CPSSize.sixteen.rawValue)
//  static let captions = custom(CPSFontsType.regular, CPSSize.fourteen.rawValue)
//  static let bannersMedium = custom(CPSFontsType.medium, CPSSize.fourteen.rawValue)
//  static let captionsSemiBold = custom(CPSFontsType.semiBold, CPSSize.fourteen.rawValue)
//  static let captionsBold = custom(CPSFontsType.bold, CPSSize.fourteen.rawValue)
//  static let utility = custom(CPSFontsType.medium, CPSSize.twelve.rawValue)
//  static let utilityBold = custom(CPSFontsType.bold, CPSSize.twelve.rawValue)
//  static let utilitySemiBold = custom(CPSFontsType.semiBold, CPSSize.twelve.rawValue)
//  static let utilityUppercase = custom(CPSFontsType.regular, CPSSize.twelve.rawValue)
//  static let extraSmall = custom(CPSFontsType.medium, CPSSize.ten.rawValue)
//  static let extraSmallRegular = custom(CPSFontsType.regular, CPSSize.ten.rawValue)
//  static let utilityOrders = custom(CPSFontsType.semiBold, CPSSize.twelve.rawValue)
//  static let titleMembership = custom(CPSFontsType.bold, CPSSize.twentyFour.rawValue)
//  static let titleBold = custom(CPSFontsType.bold, CPSSize.twentyEight.rawValue)
}

struct CPSFonts {
  /// Function to help register custom fonts
  static func registerFonts() {
    CPSFontsType.allCases.forEach {
        registerFont(bundle: .main, fontName: $0.rawValue, fontExtension: "ttf")
    }
  }
  
  fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
    guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
          let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
          let font = CGFont(fontDataProvider) else {
      fatalError("Couldn't create font from data")
    }
    
    var error: Unmanaged<CFError>?
    
    CTFontManagerRegisterGraphicsFont(font, &error)
  }
}
