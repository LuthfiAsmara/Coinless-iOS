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
}

extension AuthAssembler where Self: Assembler {
  func resolve() -> AuthNavigator {
    DefaultAuthNavigator(assembler: self)
  }
  
  func resolve() -> LoginViewController {
    LoginViewController(navigator: resolve())
  }
  
  func resolve() -> RegisterViewController {
    RegisterViewController(navigator: resolve())
  }
  
  
  
}
