//
//  HeroView.swift
//  Coinless
//
//  Created by Luthfi Asmara on 10/02/24.
//

import SwiftUI

struct HeroView: View {
  var actionHandler: () -> Void
  var body: some View {
    ZStack(alignment: .top){
      Color.Main.primary
        .frame(maxWidth: .infinity, maxHeight: 250)
      VStack(alignment: .leading, spacing: 0){
        HStack{
          Image(.imgLogoCoinlessWhite)
            .resizable()
            .scaledToFit()
            .frame(width: 133)
          
          Spacer()
          
          Button{
            
          }label: {
            Image(.icLogout)
              .resizable()
              .scaledToFit()
              .frame(width: 24)
              .background(Circle().fill(Color.white).frame(width: 40, height: 40))
          }
        }
        .padding(.top, 60)
        
        BoldText("Luthfi Asmara", size: 18)
          .foregroundColor(.white)
          .padding(.top, 30)
        
        HStack(alignment: .top, spacing: 0){
          RegulerText("Rp", size: 14)
            .foregroundColor(.white)
          
          RegulerText("200,000.00", size: 16)
            .padding(.top, 7)
            .foregroundColor(.white)
        }
        .padding(.bottom, 30)
        
        HStack(spacing: 15){
          IconMenuView(labelIcon: "Tukar", icon: .icChange)
          
          IconMenuView(labelIcon: "Transfer", icon: .icTransfer)
          
          IconMenuView(labelIcon: "Lokasi", icon: .icLocation)
          
          Button(action: actionHandler) {
            IconMenuView(labelIcon: "Bantuan", icon: .icSupport)
          }
            

            
          
        }
        .padding(15)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
        Spacer()
      }
      .padding(.horizontal, 20)
      .frame(maxWidth: .infinity)
      
    }
  }
}
