//
//  File.swift
//
//
//  Created by Guillermo Anaya on 6/21/23.
//

import SwiftUI

/// A protocol that represent a component that will be in charge of
/// providing images for light and dar themes of the system
///
///
/// ```swift
/// enum ImagesCheckBox {
///   case checkIcon
/// }
///
/// extension ImageProvider where ImageCatalog == ImagesCheckBox {
///   static let blockbusterCheckBoxImageProvider = ImageProvider<ImagesCheckBox> { catalog in
///     switch catalog {
///     case .checkIcon:
///       return Scheme(light: Image("Check"), dark: Image("Check"))
///     }
///   }
/// }
/// ```
/// - Returns: Scheme<Image>
public struct ImageProvider<ImageCatalog> {
  var image: (_ catalog: ImageCatalog) -> Scheme<Image>
  
  public init(image: @escaping (_: ImageCatalog) -> Scheme<Image>) {
    self.image = image
  }
}
