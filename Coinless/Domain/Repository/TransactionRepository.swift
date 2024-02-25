//
//  TransactionRepository.swift
//  Coinless
//
//  Created by Luthfi Asmara on 20/02/24.
//

import Foundation
import RxSwift

public protocol TransactionRepository {
  func getAllTransaction() -> Observable<[Transaction]?>
  func getTransactionById(param: String) -> Observable<Transaction?>
}
