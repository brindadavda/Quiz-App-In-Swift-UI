//
//  CPSColors.swift
//  CPSCUI
//
//  Created by Guillermo Anaya on 30/05/23.
//

import SwiftUI

public extension Color {
    static var coinColor : Color = Color("Colors/coin", bundle: .main)
    static var textColor : Color = Color("Colors/text", bundle: .main)
    static var shadowColor : Color = Color("Colors/shadow", bundle: .main)
}

public extension Color {
  /// A enum odefining all the primary colors used in the theme
  enum primary {
    public static let p150 = Color(hex: 0xAE9E6B)
    public static let p140 = Color(hex: 0xFFFFFF)
    public static let p130 = Color(hex: 0x202633)
    public static let p120 = Color(hex: 0xEDF2FF)
    public static let p110 = Color(hex: 0x05102A)
    public static let p100 = Color(hex: 0x13213F)
    public static let p90 = Color(hex: 0x1C3466)
    public static let p80 = Color(hex: 0x2B4D99)
    public static let p70 = Color(hex: 0x3967CC)
    public static let p60 = Color(hex: 0x4781FF)
    public static let p50 = Color(hex: 0x6C9AFF)
    public static let p40 = Color(hex: 0x91B3FF)
    public static let p30 = Color(hex: 0xB5CDFF)
    public static let p20 = Color(hex: 0xDAE6FF)
    public static let p10 = Color(hex: 0x15274D)
  }
}

public extension Color {
  /// A enum defining all the greay scale of colors used in the theme
  enum grey {
    public static let g10 = Color(hex: 0xECEEF1)
    public static let g20 = Color(hex: 0xC7CDD6)
    public static let g30 = Color(hex: 0xA2ACBA)
    public static let g40 = Color(hex: 0x7D8A9E)
    public static let g50 = Color(hex: 0x455875)
    public static let g60 = Color(hex: 0x37475E)
    public static let g70 = Color(hex: 0xF8F8F8)
    public static let g80 = Color(hex: 0xA1A9B8)
    public static let g90 = Color(hex: 0xC7CDDA)
  }
}

public extension Color {
  /// A enum defining all the promo scale of colors used in the theme
  enum promo {
    public static let p20 = Color(hex: 0xCDAEEC)
    public static let p30 = Color(hex: 0xB485E2)
    public static let p40 = Color(hex: 0x9B5DD9)
    public static let p50 = Color(hex: 0x8234CF)
    public static let p60 = Color(hex: 0x682AA6)
  }
}

public extension Color {
  /// A enum defining all the brand scale of colors used in the theme
  enum brand {
    public static let junior = Color(hex: 0xFFBE06)
    public static let stellar = Color(hex: 0x8234CF)
    public static let pluus = Color(hex: 0x35CBCC)
    public static let macroxe = Color(hex: 0xF64E4E)
    public static let vip = Color(hex: 0xAE9E6B)
    public static let fanColorBlue = Color(hex: 0x4782FF)
    public static let fanColorGreen = Color(hex: 0x36CCCC)
    public static let superFanSecondColor = Color(hex: 0xD3168F)
    public static let errorServiceFavorities = Color(hex: 0xFCEBEB)
  }
}

public extension Color {
  /// An enum defining all the shadows used in the theme
  enum shadows {
    static let primaryButtonLight = Color(hex: 0x000000, alpha: 0.8)
    static let primaryButtonDark = Color(hex: 0x000000, alpha: 0.8)
    public static let image = Color(hex: 0x000000, alpha: 0.16)
  }
}

public extension Color {
  /// An enum defining all the shadows used in the theme
  enum opacity {
    static let light = Color(hex: 0x08285B, alpha: 0.04)
    static let test = Color(hex: 0xFFFFFF, alpha: 0.25)
    static let dark = Color(hex: 0x67758A, alpha: 0.08)
    static let backgroundLight = Color(hex: 0xA2ACBA, alpha: 0.30)
    static let backgroundDark = Color(hex: 0x67758A, alpha: 0.25)
  }
}

public extension Color {
  /// A enum defining neutral scale of colors used in the theme
  enum neutral {
    public static let black = Color(hex: 0x070D1A)
    public static let white = Color(hex: 0xFDFDFD)
    public static let blackAlpha = Color(hex: 0x070D1A, alpha: 0.1)
    public static let blackMiddleAlpha = Color(hex: 0x070D1A, alpha: 0.5)
    public static let whiteAlpha = Color(hex: 0xFDFDFD, alpha: 0.1)
  }
}

public extension Color {
  /// A enum defining status scale of colors used in the theme
  enum status {
    public static let green = Color(hex: 0x4FC974)
    public static let warnig = Color(hex: 0xFFF2CD)
  }
}

public extension Color {
  // An enum defining all the colors used in shimmer
  enum shimmer {
    public static let dark = Color(hex: 0x12213F)
    public static let darkHighlight = Color(hex: 0x070D1A)
    public static let light = Color(hex: 0xECEEF1)
    public static let lightHighlight = Color(hex: 0xFDFDFD)
  }
}

public extension UIColor {
  enum opacity {
    static let alpha36 = UIColor(red: 0.03, green: 0.05, blue: 0.10, alpha: 0.46)
    static let alpha0 = UIColor(red: 0.03, green: 0.05, blue: 0.10, alpha: 0.0)
    static let sheetLight = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08)
  }
}


public extension Color {
    static let onboarding1: [Color] = [
      Color(red: 0.21, green: 0.8, blue: 0.8),
      Color(red: 0.28, green: 0.51, blue: 1),
      Color(red: 0.03, green: 0.05, blue: 0.1),
      Color(red: 0.21, green: 0.8, blue: 0.8)
    ]
    
    static let onboarding2: [Color] = [
      Color(red: 0.96, green: 0.05, blue: 0.58),
      Color(red: 0.58, green: 0.19, blue: 0.84),
      Color(red: 0.03, green: 0.05, blue: 0.1),
      Color(red: 0.58, green: 0.19, blue: 0.84)
    ]
    
    static let onboarding3: [Color] = [
      Color(red: 255 / 255, green: 76 / 255, blue: 79 / 255),
      Color(red: 246 / 255, green: 13 / 255, blue: 147 / 255)
    ]
    
    static let onboarding4: [Color] = [
      Color(red: 0 / 255, green: 128 / 255, blue: 255 / 255),
      Color(red: 35 / 255, green: 35 / 255, blue: 92 / 255)
    ]
    
    static let onboardingGradient1: [Color] = [
      Color(red: 0.21, green: 0.8, blue: 0.8).opacity(0),
      Color(red: 0.28, green: 0.51, blue: 1).opacity(0.1),
      Color(red: 0.03, green: 0.05, blue: 0.1).opacity(1),
      Color(red: 0.21, green: 0.8, blue: 0.8).opacity(1)
    ]
    
    static let onboardingGradient2: [Color] = [
      Color(red: 0.96, green: 0.05, blue: 0.58).opacity(0),
      Color(red: 0.58, green: 0.19, blue: 0.84).opacity(0.1),
      Color(red: 0.03, green: 0.05, blue: 0.1).opacity(1),
      Color(red: 0.58, green: 0.19, blue: 0.84).opacity(1)
    ]
    
    static let onboardingGradient3: [Color] = [
      Color(red: 255 / 255, green: 76 / 255, blue: 79 / 255).opacity(0),
      Color(red: 246 / 255, green: 13 / 255, blue: 147 / 255).opacity(0.1),
      Color(red: 7 / 255, green: 13 / 255, blue: 26 / 255).opacity(1),
      Color(red: 243 / 255, green: 20 / 255, blue: 150 / 255).opacity(1)
    ]
    
    static let onboardingGradient4: [Color] = [
      Color(red: 0 / 255, green: 128 / 255, blue: 255 / 255).opacity(0),
      Color(red: 7 / 255, green: 13 / 255, blue: 26 / 255).opacity(0),
      Color(red: 7 / 255, green: 13 / 255, blue: 26 / 255).opacity(1),
      Color(red: 35 / 255, green: 35 / 255, blue: 92 / 255).opacity(1)
    ]
}
