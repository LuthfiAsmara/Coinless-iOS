//
//  DetailTransactionView.swift
//  Coinless
//
//  Created by Luthfi Asmara on 21/02/24.
//

import SwiftUI

struct DetailTransactionView: View {
  @ObservedObject var state: ViewState
  var onBackPressed: (() -> Void)?
  
    var body: some View {
      ZStack {
        Color.white
        
        VStack {
          Color.Main.primary
            .frame(maxWidth: .infinity, maxHeight: 300)
        
          Spacer()
        }
        
        VStack(alignment: .leading , spacing: 0) {
          HStack {
            Spacer()
            Image(.imgLogoCoinlessBlue)
            Spacer()
          }
        
          HStack {
            RegulerText(state.transactionDate, size: 12)
              .foregroundColor(Color.Text.gray)
            
            Spacer()
            
            RegulerText(state.transactionCode, size: 12)
              .foregroundColor(Color.Text.gray)
          }
          .padding(.top, 30)
          
          RegulerText("Transaction Success", size: 14)
            .foregroundColor(Color.black)
            .padding(.top, 10)
          
          RegulerText("Top Up", size: 14)
            .foregroundColor(Color.black)
            .padding(.top, 10)
          
          HStack {
            SemiBoldText("Total Payment", size: 16)
              .foregroundColor(Color.black)
            
            Spacer()
            
            SemiBoldText("Rp 11600", size: 16)
              .foregroundColor(Color.black)
          }
          .padding(10)
          .background(Rectangle().fill(Color.Main.primary.opacity(0.1)))
          .padding(.top, 10)
          
          HStack(alignment: .center){
            SemiBoldText("Transaction Detail", size: 15)
              .foregroundColor(Color.black)
              
            
            Spacer()
            Button {
              withAnimation {
                state.isShowTransactionDetail.toggle()
              }
            } label: {
              Image(systemName: state.isShowTransactionDetail ? "chevron.down" :  "chevron.up")
                .resizable()
                .scaledToFit()
                .frame(width: 15)
                .foregroundColor(Color.Text.gray)
            }
          }
          .padding(.top, 20)
          if state.isShowTransactionDetail {
            VStack(spacing: 0) {
              HStack {
                RegulerText("Transaction ID", size: 14)
                  .foregroundColor(Color.Text.gray)
                
                Spacer()
                
                RegulerText("CLX202304290002", size: 14)
                  .foregroundColor(Color.Text.gray)
              }
              .padding(.top, 10)
              
              HStack {
                RegulerText("Amount", size: 14)
                  .foregroundColor(Color.Text.gray)
                
                Spacer()
                
                RegulerText("Rp 12000", size: 14)
                  .foregroundColor(Color.Text.gray)
              }
              .padding(.top, 10)
              
              HStack {
                RegulerText("Fee", size: 14)
                  .foregroundColor(Color.Text.gray)
                
                Spacer()
                
                RegulerText("Rp 400", size: 14)
                  .foregroundColor(Color.Text.gray)
              }
              .padding(.top, 10)
            }
          }
          
          Spacer()
        }
          .padding(.top, 50)
          .padding(.horizontal, 25)
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .background(Color.white)
          .cornerRadius(5)
          .padding(.top, 100)
          .padding(.horizontal, 20)
          .shadow(radius: 2)
        
        AppBar(title: "Detail Transaction") {
          onBackPressed?()
        }
          
      }
      .edgesIgnoringSafeArea(.all)
    }
}

extension DetailTransactionView {
  class ViewState: ObservableObject {
    @Published var isShowTransactionDetail = true
    @Published var transactionCode = "CLX202304290002"
    @Published var transactionDate = "2023-04-29"
    @Published var transactionType = ""
    
  }
}

#Preview {
  DetailTransactionView(state: DetailTransactionView.ViewState())
}

