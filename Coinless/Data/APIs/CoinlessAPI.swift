//
//  CoinlessApi.swift
//  Coinless
//
//  Created by Luthfi Asmara on 17/02/24.
//

import SwiftUI
import Moya


enum CoinlessAPI {
  case login
  case register
  case logout
  case profile
  case allTransaction
  case transactionById(transactionId: String)
}

extension CoinlessAPI: TargetType {
  var baseURL: URL { Constants.baseURL }
  
  var path: String {
    switch self {
    case .login:
      return "login"
    case .register:
      return "register"
    case .logout:
      return "logout"
    case .profile:
      return "profile"
    case .allTransaction:
      return "transactions"
    case .transactionById(let transactionId):
      return "transactions/\(transactionId)"
      
      
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .login, .register, .logout:
      return .post
    case .profile:
      return .get
    default:
      return .get
    }
  }
  
  var task: Task {
    switch self {
    case .profile:
      return .requestParameters(parameters: [:], encoding: URLEncoding.queryString)
    case .login:
      return .requestParameters(parameters: [:], encoding: URLEncoding.queryString)
    case .register:
      return .requestParameters(parameters: [:], encoding: URLEncoding.queryString)
    case .logout:
      return .requestParameters(parameters: [:], encoding: URLEncoding.queryString)
    case .allTransaction:
      return .requestParameters(parameters: [:], encoding: URLEncoding.queryString)
    case .transactionById(transactionId: let transactionId):
      return .requestParameters(parameters: transactionId.parameters, encoding: URLEncoding.queryString)
    }
    
  }
  
  var headers: [String: String]? {
    switch self {
    case .profile:
      return getHeaders(type: .authorized)
    default:
      return getHeaders(type: .authorized)
    }
  }
  var sampleData: Foundation.Data { Data() }
  
}


private enum HeaderType {
  case authorized
}

extension CoinlessAPI {
  static var sampleResponse: EndpointSampleResponse = .networkResponse(200, Data())
  
  var endpointClosure: (CoinlessAPI) -> Endpoint {
    return { _ in
      return Endpoint(
        url: URL(target: self).absoluteString,
        sampleResponseClosure: { Self.sampleResponse },
        method: self.method,
        task: self.task,
        httpHeaderFields: self.headers
      )
    }
  }
  
  private func getHeaders(type: HeaderType) -> [String: String] {
    var header = ["Accept": "application/json"]
    
    switch type {
    case .authorized:
      header["Authorization"] = "Bearer \(Constants.token)"
    }
    
    return header
  }
  
  var composedUrl: URL? {
    let endpoint = endpointClosure(self)
    
    do {
      let url = try endpoint.urlRequest().url
      return url
    } catch {
      return nil
    }
  }
}

