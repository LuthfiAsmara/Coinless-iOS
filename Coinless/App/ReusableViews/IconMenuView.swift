//
//  IconMenuView.swift
//  Coinless
//
//  Created by Luthfi Asmara on 10/02/24.
//

import SwiftUI

struct IconMenuView: View {
  var labelIcon: String
  var icon: ImageResource
    var body: some View {
      VStack(alignment: .center, spacing: 0){
        Image(icon)
          .resizable()
          .scaledToFit()
          .frame(width: 30)
          .padding(.bottom, 5)
        SemiBoldText(labelIcon, size: 14)
          .foregroundColor(.white)
      }
      .frame(width: 70, height: 65)
      .background(Color.Main.primary)
      .cornerRadius(10)
    }
}

#Preview {
  IconMenuView(labelIcon: "Transfer", icon: .icTransfer)
}
