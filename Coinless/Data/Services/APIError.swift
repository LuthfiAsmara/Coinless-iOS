//
//  ApiError.swift
//  Coinless
//
//  Created by Luthfi Asmara on 17/02/24.
//

import Foundation

extension ApiError {
  var localizedDescription: String {
    switch self {
    case .unknown:
      return "An error occurred. Please try again later."
    case .connectionError:
      return "Connection problem. Please check your internet connection."
    case .invalidJSONError:
      return "Service response in an unexpected format."
    case .middlewareError(_, let message):
      return message ?? ""
    case .failedMappingError:
      return "Failed to read server's response."
    }
  }
}
