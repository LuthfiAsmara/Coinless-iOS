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
  let allTransaction = PublishRelay<[Transaction]>()

  
  private let disposeBag = DisposeBag()
  private let transactionUseCase: TransactionUseCase
  
  init(transactionUseCase: TransactionUseCase) {
    self.transactionUseCase = transactionUseCase
  }
  
  func getAllTransaction() {
    transactionUseCase.execute().subscribe(onNext: { [weak self] result in
      self?.allTransaction.accept(result!)
    }).disposed(by: disposeBag)
  }
}
