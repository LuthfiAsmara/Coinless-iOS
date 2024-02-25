//
//  AuthAssembler.swift
//  Coinless
//
//  Created by Luthfi Asmara on 20/02/24.
//

import Foundation

protocol AuthAssembler {
  func resolve() -> AuthNavigator
  func resolve() -> LoginViewController
  func resolve() -> RegisterViewController
  func resolve() -> AuthViewModel
  func resolve() -> AuthUseCase
  func resolve() -> AuthRepository
}

extension AuthAssembler where Self: Assembler {
  func resolve() -> AuthNavigator {
    DefaultAuthNavigator(assembler: self)
  }
  
  func resolve() -> LoginViewController {
    LoginViewController(navigator: resolve(), viewModel: resolve())
  }
  
  func resolve() -> RegisterViewController {
    RegisterViewController(navigator: resolve(), viewModel: resolve())
  }
  
  func resolve() -> AuthViewModel {
    AuthViewModel(authUseCase: resolve())
  }
  
  func resolve() -> AuthUseCase {
    ShowUser(repository: resolve() )
  }
  
  func resolve() -> AuthRepository {
    DefaultAuthRepository(remoteDataSource: resolve())
  }
  
  
}
