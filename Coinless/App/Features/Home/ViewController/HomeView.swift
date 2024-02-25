//
//  HomeView.swift
//  Coinless
//
//  Created by Luthfi Asmara on 29/01/24.
//

import SwiftUI

struct HomeView: View {
  @ObservedObject var state: ViewState
  
  var onClickProfile: (() -> Void)?
  var onClickLogout: (() -> Void)?
  var onClickDetailTransaction: ((_ transactionId: String) -> Void)?
  
  var listBanner: [ImageResource] = [.imgBannerFirst, .imgBannerSecond, .imgBannerThird]
  

  var body: some View {
    ZStack{
      ScrollView(.vertical, showsIndicators: false){
        VStack(alignment: .leading, spacing: 0){
          Spacer().frame(height: 320)
          ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 20){
              ForEach(listBanner, id: \.self){ banner in
                Button{
                  
                }label: {
                  Image(banner)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 145)
                    .cornerRadius(10)
                }
              }
            }
            .padding(.horizontal, 10)
          }.padding(.bottom, 20)
          
          
          
          BoldText("Transaksi Terkini", size: 16)
            .foregroundColor(.black)
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
          
          ForEach (state.allTransaction) { data in
            Button {
              onClickDetailTransaction?(String(data.id!))
            } label: {
              TransactionView(data: data)
                .padding(.bottom, 15)
            }
          }
          .padding(.horizontal, 30)
          Spacer()
        }
      }
      
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
              onClickLogout?()
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
            
            Button{
              onClickProfile?()
            } label: {
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
      
      VStack {
        Spacer()
        TabHomeView()
      }
    }
    .background(Color.white)
    .edgesIgnoringSafeArea(.all)
  }
}

extension HomeView {
  class ViewState: ObservableObject {
    @Published var allTransaction: [Transaction] = []
  }
}

#Preview {
  HomeView(state: HomeView.ViewState())
}


