//
//  DefaultTransactionRepository.swift
//  Coinless
//
//  Created by Luthfi Asmara on 20/02/24.
//

import Foundation
import RxSwift

struct DefaultTransactionRepository: TransactionRepository {
  
  private let remoteDataSource: RemoteDataSource
  
  init(remoteDataSource: RemoteDataSource) {
    self.remoteDataSource = remoteDataSource
  }
  
  func getAllTransaction() -> Observable<[Transaction]?> {
    return remoteDataSource.getAllTransaction().map { $0 }
  }
  
  func getTransactionById(param: String) -> Observable<Transaction?> {
    return remoteDataSource.getTransactionById(param: param).map { $0 }
  }
}

