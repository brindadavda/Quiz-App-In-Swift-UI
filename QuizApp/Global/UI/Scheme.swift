//
//  File.swift
//
//
//  Created by Guillermo Anaya on 6/21/23.
//

import Foundation

public struct Scheme<T> {
  public let light: T
  public let dark: T
  
  public init(light: T, dark: T) {
    self.light = light
    self.dark = dark
  }
}
