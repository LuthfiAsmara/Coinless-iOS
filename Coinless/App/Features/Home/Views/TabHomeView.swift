//
//  TabHomeView.swift
//  Coinless
//
//  Created by Luthfi Asmara on 25/02/24.
//

import SwiftUI

struct TabHomeView: View {
    var body: some View {
      HStack(spacing: 45) {
        TabHomeIcon(icon: "house.fill", title: "Home")
        TabHomeIcon(icon: "clock.fill", title: "History")
        VStack {
          Image(systemName: "qrcode")
            .resizable()
            .scaledToFit()
            .frame(height: 30)
            .foregroundColor(Color.white)
            .background(Circle().fill(Color.Main.primary).frame(width: 60, height: 60))
          
          RegulerText("Scan", size: 9)
            .foregroundColor(Color.white)
        }
       TabHomeIcon(icon: "newspaper.fill", title: "Info")
        TabHomeIcon(icon: "person.fill", title: "Profil")
      }
      .padding(.top, 15)
      .padding(.bottom, 45)
      .frame(maxWidth: .infinity)
      .background(Color.white)
      .shadow(radius: 1)
    }
}

struct TabHomeIcon : View {
  var icon: String
  var title: String
  var body: some View {
    VStack {
      Image(systemName: icon)
        .resizable()
        .scaledToFit()
        .frame(height: 30)
        .foregroundColor(Color.black)
      RegulerText(title, size: 9)
        .foregroundColor(Color.black)
    }
  }
}

#Preview {
    TabHomeView()
}
