//
//  TransactionUseCase.swift
//  Coinless
//
//  Created by Luthfi Asmara on 20/02/24.
//

import Foundation
import RxSwift

protocol TransactionUseCase {
  func execute() -> Observable<[Transaction]?>
  func execute(param: String) -> Observable<Transaction?>
}

class ShowTransaction: TransactionUseCase {
  private let repository: TransactionRepository

  init(repository: TransactionRepository) {
    self.repository = repository
  }

  func execute() -> Observable<[Transaction]?> {
    return repository.getAllTransaction()
  }
  
  func execute(param: String) -> Observable<Transaction?> {
    return repository.getTransactionById(param: param)
  }
}
