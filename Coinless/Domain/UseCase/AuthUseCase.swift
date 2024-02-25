//
//  AuthUseCase.swift
//  Coinless
//
//  Created by Luthfi Asmara on 25/02/24.
//

import RxSwift

protocol AuthUseCase {
  func execute(param: LoginParameter) -> Observable<User?>
  func execute(param: RegisterParameter) -> Observable<User?>
  func execute() -> Observable<String?>
}

class ShowUser: AuthUseCase {
  private let repository: AuthRepository

  init(repository: AuthRepository) {
    self.repository = repository
  }

  func execute(param: LoginParameter) -> Observable<User?> {
    return repository.login(param: param)
  }
  
  func execute(param: RegisterParameter) -> Observable<User?> {
    return repository.register(param: param)
  }
  
  func execute() -> Observable<String?> {
    return repository.logout()
  }
}

