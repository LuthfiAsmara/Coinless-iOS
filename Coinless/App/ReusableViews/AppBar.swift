//
//  AppBar.swift
//  Coinless
//
//  Created by Luthfi Asmara on 25/02/24.
//

import SwiftUI

struct AppBar: View {
  var title: String?
  var onBackPressed: (() -> Void)?
  
    var body: some View {
      VStack {
        HStack {
          Button {
            onBackPressed?()
          } label: {
            Image(systemName: "chevron.left")
              .resizable()
              .scaledToFit()
              .frame(height: 20)
              .foregroundColor(Color.white)
          }
          .padding(.trailing, 15)
          
          if let title = title {
            SemiBoldText(title, size: 17)
              .foregroundColor(Color.white)
          }
          Spacer()
        }
        .padding(.horizontal, 25)
        .padding(.vertical, 15)
        .frame(maxWidth: .infinity)
        .background(Color.Main.primary)
        
        Spacer()
      }
    }
}

#Preview {
    AppBar(title: "Detail Transaction")
}
