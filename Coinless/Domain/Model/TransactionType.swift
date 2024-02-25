//
//  TransactionType.swift
//  Coinless
//
//  Created by Luthfi Asmara on 17/02/24.
//

import SwiftUI

enum TransactionType {
  case exchange
  case transfer
  
  var titleTransaction: String {
    switch self {
    case .exchange:
      return "Penukaran Koin"
    case .transfer:
      return "Transfer"
    }
  }
  
  var iconTransaction: ImageResource{
    switch self {
    case .exchange:
      return .icChange
    case .transfer:
      return .icTransfer
    }
  }
}

func getTransactionType(value: String) -> TransactionType {
  switch value {
  case "App\\Models\\Exchange":
    return .exchange
  case "App\\Models\\Payout":
    return .transfer
  default:
    return .exchange
  }
}


