//
//  LoginView.swift
//  Coinless
//
//  Created by Luthfi Asmara on 20/02/24.
//

import SwiftUI

struct LoginView: View {
  @ObservedObject var state: ViewState
  
  var onNavigateToSignUp: (() -> Void)?
  var onClickLogin: (() -> Void)?
  
  var body: some View {
    ZStack {
      Color.white
      
      VStack(spacing: 0) {
        Image(.imgLogoCoinlessLogin)
          .resizable()
          .scaledToFit()
          .frame(width: 150)
          .padding(.top, 100)
        
        BoldText(AppString.titleLogin.localized, size: 16)
          .foregroundColor(.black)
          .padding(.top, 50)
        
        RegulerText(AppString.messageLogin.localized, size: 14)
          .foregroundColor(.black)
          .padding(.top, 15)
        
        FormView(title: "Email", formValue: $state.emailValue)
          .padding(.top, 50)
          .padding(.horizontal, 35)
        
        FormView(title: "Password", formValue: $state.passwordValue)
          .padding(.top, 20)
          .padding(.horizontal, 35)
        
        ContainedButton(title: AppString.titleLogin.localized, type: .primary){
          onClickLogin?()
        }
        .padding(.horizontal, 35)
        .padding(.top, 35)
        
        ContainedButton(title: AppString.titleLogin.localized, type: .border){
          
        }
        .padding(.horizontal, 35)
        .padding(.top, 20)
        
        HStack {
          RegulerText("Belum punya akun?", size: 14)
            .foregroundColor(Color.gray)
          Button{
            onNavigateToSignUp?()
          }label: {
            BoldText("Sign up?", size: 14)
              .foregroundColor(Color.Main.primary)
          }
        }
        .padding(.top, 40)
        
        RegulerText("Lupa password?", size: 14)
          .foregroundColor(Color.Main.primary)
          .padding(.top, 10)

        Spacer()
      }
    }.edgesIgnoringSafeArea(.all)
  }
}

extension LoginView {
  class ViewState: ObservableObject {
    @Published var emailValue: String = ""
    @Published var passwordValue: String = ""
    @Published var isHaveAccount: Bool = true
  }
}

#Preview {
  LoginView(state: LoginView.ViewState())
}
