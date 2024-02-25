//
//  DataState.swift
//  Coinless
//
//  Created by Luthfi Asmara on 17/02/24.
//

import Foundation

public enum DataState<T> {
  public var value: T? {
    if case .success(let data) = self {
      return data
    }
    return nil
  }

  public var error: Error? {
    if case .failed(let error) = self {
      return error
    }
    return nil
  }

  public var progress: Float? {
    if case .progress(let procent) = self {
      return procent
    }
    return nil
  }

  case initiate
  case loading
  case progress(procent: Float)
  case success(data: T)
  case empty
  case failed(error: Error)
}
