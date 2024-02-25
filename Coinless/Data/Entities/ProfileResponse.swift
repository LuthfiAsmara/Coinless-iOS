//
//  ProfileResponse.swift
//  Coinless
//
//  Created by Luthfi Asmara on 17/02/24.
//

import Foundation
import ObjectMapper

extension Profile: Mappable {

  public init?(map: Map) {
    mapping(map: map)
  }
  
  public mutating func mapping(map: Map) {
    id <- map["id"]
    name <- map["name"]
    email <- map["email"]
    emailVerifiedAt <- map["email_verified_at"]
    phone <- map["phone"]
    balance <- map["balance"]
    createdAt <- map["created_at"]
    updatedAt <- map["updated_at"]
  }
}
