//
//  LogoutResponse.swift
//  Coinless
//
//  Created by Luthfi Asmara on 25/02/24.
//

import Foundation
import ObjectMapper


extension LogoutMessage: Mappable {

  public init(map: Map) {
    mapping(map: map)
  }
  
  public mutating func mapping(map: Map) {
    message <- map["message"]
  }
}
