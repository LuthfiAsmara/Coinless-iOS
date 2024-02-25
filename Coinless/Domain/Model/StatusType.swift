//
//  StatusType.swift
//  Coinless
//
//  Created by Luthfi Asmara on 17/02/24.
//

import SwiftUI

enum StatusType {
  case success
  case pending
  case failed
  
  var text: String {
    switch self {
    case .success:
      return "Success"
    case .pending:
      return "Pending"
    case .failed:
      return "Failed"
    }
  }
  
  var foregroundColor: Color {
    switch self {
    case .success:
      return Color.State.success
    case .pending:
      return Color.State.pending
    case .failed:
      return Color.State.failed
    }
  }
  
  var backgroundColor: Color {
    switch self {
    case .success:
      return Color.State.successLight
    case .pending:
      return Color.State.pendingLight
    case .failed:
      return Color.State.failedLight
    }
  }
}

extension String {
  func getTransactionStatus() -> StatusType {
    switch self {
    case "success":
      return .success
    case "failed":
      return .failed
      
    default:
      return .pending
    }
  }
}
