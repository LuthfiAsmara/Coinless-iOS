//
//  TransactionView.swift
//  Coinless
//
//  Created by Luthfi Asmara on 10/02/24.
//

import SwiftUI

struct TransactionView: View {
  var data: Transaction
  var body: some View {
    VStack(spacing: 0){
      HStack(alignment: .center){
        ZStack{
          Rectangle().fill(.white).frame(width: 50, height: 50)
            .overlay(
              RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray, lineWidth: 0.2)
            )
          
          Image(.icChangeBlue)
            .resizable()
            .scaledToFit()
            .frame(width: 30)
        }
        
        VStack(alignment: .leading, spacing: 0){
          HStack{
            RegulerText(getTransactionType(value: data.transactionableType!).titleTransaction, size: 14)
              .foregroundColor(.black)
            
            TransactionStatusView(type: data.status!.getTransactionStatus())
          }
          
          RegulerText(data.code!, size: 12)
            .foregroundColor(Color.gray)
          
          Spacer()
        }
        
        Spacer()
        
        SemiBoldText("+ Rp \(data.amount!)", size: 16)
          .foregroundColor(.black)
      }.padding(.bottom, 15)
      
      Divider()
    }
  }
}

#Preview {
  HomeView(state: HomeView.ViewState())
}
