//
//  LoginViewModel.swift
//  Coinless
//
//  Created by Luthfi Asmara on 25/02/24.
//

import Foundation
import RxSwift
import RxCocoa

class AuthViewModel {
  let resultLogin: BehaviorRelay<DataState<User>> = .init(value: .initiate)
  let resultRegister: BehaviorRelay<DataState<User>> = .init(value: .initiate)
  private let disposeBag = DisposeBag()
  private let authUseCase: AuthUseCase
  
  
  init(authUseCase: AuthUseCase) {
    self.authUseCase = authUseCase
  }
  
  func login(param: LoginParameter) {
    resultLogin.accept(.loading)
    authUseCase.execute(param: param).subscribe(onNext: { [weak self] data in
      guard let data = data else {
        self?.resultLogin.accept(.empty)
        return
      }
      self?.resultLogin.accept(.success(data: data))
    }, onError: { [weak self] error in
      self?.resultLogin.accept(.failed(error: error))
    }).disposed(by: disposeBag)
  }
  
  func register(param: RegisterParameter) {
    resultRegister.accept(.loading)
    authUseCase.execute(param: param).subscribe(onNext: { [weak self] data in
      guard let data = data else {
        self?.resultRegister.accept(.empty)
        return
      }
      self?.resultRegister.accept(.success(data: data))
    }, onError: { [weak self] error in
      self?.resultRegister.accept(.failed(error: error))
    }).disposed(by: disposeBag)
  }
  
  
}
