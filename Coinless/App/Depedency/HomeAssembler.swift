//
//  HomeAssembler.swift
//  Coinless
//
//  Created by Luthfi Asmara on 03/02/24.
//

import UIKit

protocol HomeAssembler {
  func resolve() -> HomeNavigator
  func resolve() -> HomeViewController
  func resolve() -> HomeViewModel
  func resolve() -> DetailTransactionViewController
  func resolve() -> DetailTransactionViewModel
  func resolve() -> TransactionUseCase
  func resolve() -> TransactionRepository
  func resolve() -> RemoteDataSource
}

extension HomeAssembler where Self: Assembler {
  func resolve() -> HomeNavigator {
    DefaultHomeNavigator(assembler: self)
  }
  
  func resolve() -> HomeViewController {
    HomeViewController(navigator: resolve(), viewModel: resolve())
  }
  
  func resolve() -> HomeViewModel {
    HomeViewModel(transactionUseCase: resolve())
  }
  
  func resolve() -> DetailTransactionViewController {
    DetailTransactionViewController(navigator: resolve(), viewModel: resolve())
  }
  
  func resolve() -> DetailTransactionViewModel {
    DetailTransactionViewModel(transactionUseCase: resolve())
  }
  
  func resolve() -> TransactionUseCase {
    ShowTransaction(repository: resolve())
  }
  
  func resolve() -> TransactionRepository {
    DefaultTransactionRepository(remoteDataSource: resolve())
  }
  
  func resolve() -> RemoteDataSource {
    DefaultRemoteDataSource()
  }
  
}
