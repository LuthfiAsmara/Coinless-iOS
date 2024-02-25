//
//  HomeViewModel.swift
//  Coinless
//
//  Created by Luthfi Asmara on 10/02/24.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
  let resultTransaction: BehaviorRelay<DataState<[Transaction]>> = .init(value: .initiate)
  let resultLogout: BehaviorRelay<DataState<String>> = .init(value: .initiate)
  let resultProfile: BehaviorRelay<DataState<Profile>> = .init(value: .initiate)

  
  private let disposeBag = DisposeBag()
  private let transactionUseCase: TransactionUseCase
  private let authUseCase: AuthUseCase
  private let profileUseCase: ProfileUseCase
  
  init(transactionUseCase: TransactionUseCase, authUseCase: AuthUseCase, profileUseCase: ProfileUseCase) {
    self.transactionUseCase = transactionUseCase
    self.authUseCase = authUseCase
    self.profileUseCase = profileUseCase
  }
  
  func getAllTransaction() {
    resultTransaction.accept(.loading)
    transactionUseCase.execute().subscribe(onNext: { [weak self] data in
      guard let data = data else {
        self?.resultTransaction.accept(.empty)
        return
      }
      self?.resultTransaction.accept(.success(data: data))
    }, onError: { [weak self] error in
      self?.resultTransaction.accept(.failed(error: error))
    }).disposed(by: disposeBag)
  }
  
  func logout() {
    resultLogout.accept(.loading)
    authUseCase.execute().subscribe(onNext: { [weak self] data in
      guard let data = data else {
        self?.resultLogout.accept(.empty)
        return
      }
      self?.resultLogout.accept(.success(data: data))
    }, onError: { [weak self] error in
      self?.resultLogout.accept(.failed(error: error))
    }).disposed(by: disposeBag)
  }
  
  func getProfile() {
    resultProfile.accept(.loading)
    profileUseCase.execute().subscribe(onNext: { [weak self] data in
      guard let data = data else {
        self?.resultProfile.accept(.empty)
        return
      }
      self?.resultProfile.accept(.success(data: data))
    }, onError: { [weak self] error in
      self?.resultProfile.accept(.failed(error: error))
    }).disposed(by: disposeBag)
  }
}
