//
//  ShimmerView.swift
//  Coinless
//
//  Created by Luthfi Asmara on 25/02/24.
//

import SwiftUI

struct ShimmerView: View {
  @State private var shimmering = false
  
  var body: some View {
    LinearGradient(
      gradient: Gradient(
        colors: [Color.white, Color.Main.background]),
      startPoint: .leading,
      endPoint: shimmering ? .trailing : .leading)
    .frame(width: 200, height: 40)
    .mask(RoundedRectangle(cornerRadius: 10))
    .animation(
      .easeOut(duration: 1)
      .repeatForever(autoreverses: false),value: shimmering)
    .onAppear {
      shimmering.toggle()
    }
  }
}

#Preview {
  ShimmerView()
}
