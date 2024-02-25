//
//  Text.swift
//  Coinless
//
//  Created by Luthfi Asmara on 10/02/24.
//

import SwiftUI

struct RegulerText: View {
  private let string: String
  private let size: CGFloat
  
  
  init(_ string: String, size: CGFloat) {
    self.string = string
    self.size = size
  }
  
  var body: some View {
    Text(string)
      .font(.system(size: size))
      .fontWeight(.regular)
  }
}

struct SemiBoldText: View {
  private let string: String
  private let size: CGFloat
  
  
  init(_ string: String, size: CGFloat) {
    self.string = string
    self.size = size
  }
  
  var body: some View {
    Text(string)
      .font(.system(size: size))
      .fontWeight(.semibold)
  }
}

struct BoldText: View {
  private let string: String
  private let size: CGFloat
  
  
  init(_ string: String, size: CGFloat) {
    self.string = string
    self.size = size
  }
  
  var body: some View {
    Text(string)
      .font(.system(size: size))
      .fontWeight(.bold)
  }
}
