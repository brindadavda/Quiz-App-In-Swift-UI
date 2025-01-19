//
//  View+Extension.swift
//  QuizApp
//
//  Created by Brinda Davda on 25/06/24.
//

import Foundation
import SwiftUI

extension View {
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}


public extension View {
  
  /// A modifier that initiates theme provider and inject view as an environment object. This modifier should be called only once at the top of view hierarchy.
  /// - Parameter colorScheme: the initial colorScheme for start the app
  /// - Returns: view
  func themeProviding(colorScheme: ColorScheme = .light) -> some View {
    return self.modifier(ThemeProvidingViewModifier(colorScheme: colorScheme))
  }
}


//
//  View+Ext.swift
//  ExploringThemes
//
//  Created by Guillermo Anaya on 01/06/23.
//

import SwiftUI


public extension View {
  func themed() -> some View {
    self.modifier(ThemedView())
  }
}


public extension View {
  func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
    clipShape(RoundedCorner(radius: radius, corners: corners))
  }
}

public struct RoundedCorner: Shape {
  var radius: CGFloat = .infinity
  var corners: UIRectCorner = .allCorners
  
  public func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    return Path(path.cgPath)
  }
}

public extension View {
  func hidekeyboard() {
    let resign = #selector(UIResponder.resignFirstResponder)
    UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
  }
}

public struct DismissKeyboardOnTap: ViewModifier {
  public func body(content: Content) -> some View {
    content
      .onTapGesture {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
      }
  }
}

public extension View {
  func dismissKeyboardOnTap() -> some View {
    self.modifier(DismissKeyboardOnTap())
  }
}

public extension View {
  func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
    background(
      GeometryReader { geometryProxy in
        Color.clear
          .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
      }
    )
    .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
  }
}

struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}
