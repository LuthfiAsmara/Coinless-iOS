//
//  DetailTransactionViewModel.swift
//  Coinless
//
//  Created by Luthfi Asmara on 21/02/24.
//

import Foundation
import RxSwift
import RxCocoa

class DetailTransactionViewModel {
  let resultTransaction: BehaviorRelay<DataState<Transaction>> = .init(value: .initiate)
  private let disposeBag = DisposeBag()
  private let transactionUseCase: TransactionUseCase
  
  init(transactionUseCase: TransactionUseCase) {
    self.transactionUseCase = transactionUseCase
  }
  
  func getTransactionById(param: String) {
    resultTransaction.accept(.loading)
    transactionUseCase.execute(param: param).subscribe(onNext: { [weak self] data in
      guard let data = data else {
        self?.resultTransaction.accept(.empty)
        return
      }
      self?.resultTransaction.accept(.success(data: data))
    }, onError: { [weak self] error in
      self?.resultTransaction.accept(.failed(error: error))
    }).disposed(by: disposeBag)
  }
}
