//
//  BaseResponse.swift
//  Coinless
//
//  Created by Luthfi Asmara on 20/02/24.
//

import Foundation
import ObjectMapper

public struct BaseResponse<T>: Mappable where T: Mappable {
  public var success: Bool?
  public var data: T?
  public var message: String?
  
  public init?(map: Map) {
    mapping(map: map)
  }
  
  public mutating func mapping(map: Map) {
    success <- map["success"]
    data <- map["data"]
    message <- map["message"]
  }
}
