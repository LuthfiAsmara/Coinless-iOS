//
//  ApiError.swift
//  Coinless
//
//  Created by Luthfi Asmara on 17/02/24.
//

import Foundation

enum ApiError: Error {
  case unknown
  case connectionError
  case invalidJSONError
  case middlewareError(code: Int, message: String?)
  case failedMappingError
}

