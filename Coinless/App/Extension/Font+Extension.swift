//
//  Font+Extension.swift
//  Coinless
//
//  Created by Luthfi Asmara on 10/02/24.
//

import SwiftUI

enum FontType: String {
  case poppinsRegular = "Poppins-Regular"
  case poppinsSemiBold = "Poppins-SemiBold"
  case poppinsBold = "Poppins-Bold"
}

extension Font {
  static func reguler(size: CGFloat) -> Font {
    custom(type: .poppinsRegular, size: size)
  }
  
  static func semiBold(size: CGFloat) -> Font {
    custom(type: .poppinsSemiBold, size: size)
  }
  
  static func bold(size: CGFloat) -> Font {
    custom(type: .poppinsBold, size: size)
  }
  
  static func custom(type: FontType, size: CGFloat) -> Font {
    return Font.custom(type.rawValue, size: size)
  }
}

extension UIFont {
  static func reguler(size: CGFloat) -> UIFont {
    custom(type: .poppinsRegular, size: size)
  }
  
  static func semiBold(size: CGFloat) -> UIFont {
    custom(type: .poppinsSemiBold, size: size)
  }
  
  static func bold(size: CGFloat) -> UIFont {
    custom(type: .poppinsBold, size: size)
  }
  
  static func custom(type: FontType, size: CGFloat) -> UIFont {
    return UIFont(name: type.rawValue, size: size) ?? .systemFont(ofSize: size)
  }
}

