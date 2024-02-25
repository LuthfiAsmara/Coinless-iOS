//
//  RegisterView.swift
//  Coinless
//
//  Created by Luthfi Asmara on 20/02/24.
//

import SwiftUI

struct RegisterView: View {
  @ObservedObject var state: ViewState
  
  var onNavigateToLogIn: (() -> Void)?
  var onClickSignUp: (() -> Void)?

    var body: some View {
      ZStack {
        Color.white
        
        VStack(spacing: 0) {
          Image(.imgLogoCoinlessLogin)
            .resizable()
            .scaledToFit()
            .frame(width: 150)
            .padding(.top, 70)
          
          BoldText(AppString.titleRegister.localized, size: 16)
            .foregroundColor(.black)
            .padding(.top, 30)
          
          RegulerText(AppString.messageRegister.localized, size: 14)
            .foregroundColor(.black)
            .multilineTextAlignment(.center)
            .padding(.top, 15)
          
          ContainedButton(title: "Sign Up With Google", type: .border) {
            
          }
          .padding(.horizontal, 35)
          .padding(.top, 30)
          
          HStack{
            Rectangle()
              .frame(width: 128, height: 1)
              .foregroundColor(Color.gray)
            
            RegulerText("ATAU", size: 10)
              .foregroundColor(Color.gray)
            
            Rectangle()
              .frame(width: 128, height: 1)
              .foregroundColor(Color.gray)
            
          }
          .padding(.top, 20)
          
          FormView(title: "Nama", formValue: $state.nameValue)
            .padding(.top, 20)
            .padding(.horizontal, 35)
          
          FormView(title: "Email", formValue: $state.emailValue)
            .padding(.top, 20)
            .padding(.horizontal, 35)
          
          FormView(title: "Password", formValue: $state.passwordValue)
            .padding(.top, 20)
            .padding(.horizontal, 35)
          
          FormView(title: "Konfirmasi Password", formValue: $state.confirmPasswordValue)
            .padding(.top, 20)
            .padding(.horizontal, 35)
          
          ContainedButton(title: AppString.titleRegister.localized, type: .primary) {
            onClickSignUp?()
          }
          .padding(.top, 20)
          .padding(.horizontal, 35)
          
          HStack {
            RegulerText("Sudah Punya akun?", size: 14)
              .foregroundColor(Color.gray)
            
            Button{
              onNavigateToLogIn?()
            }label: {
              BoldText("Log in", size: 14)
                .foregroundColor(Color.Main.primary)
            }
          }
          .padding(.top, 10)
          
          Spacer()
        }
      }
    }
}

extension RegisterView {
  class ViewState: ObservableObject {
    @Published var nameValue: String = ""
    @Published var emailValue: String = ""
    @Published var passwordValue: String = ""
    @Published var confirmPasswordValue: String = ""
  }
}

#Preview {
    RegisterView(state: RegisterView.ViewState())
}
