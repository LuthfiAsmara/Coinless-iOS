//
//  UserResponse.swift
//  Coinless
//
//  Created by Luthfi Asmara on 25/02/24.
//

import Foundation
import ObjectMapper

extension User: Mappable {

  public init(map: Map) {
    mapping(map: map)
  }
  
  public mutating func mapping(map: Map) {
    name <- map["name"]
    token <- map["token"]
  }
}

