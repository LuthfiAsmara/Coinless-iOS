//
//  TransactionResponse.swift
//  Coinless
//
//  Created by Luthfi Asmara on 20/02/24.
//

import SwiftUI
import ObjectMapper

extension Transaction: Mappable {
  
  public init?(map: Map) {
    mapping(map: map)
  }
  
  public mutating func mapping(map: Map) {
    id <- map["id"]
    code <- map["code"]
    amount <- map["amount"]
    fee <- map["fee"]
    total <- map["total"]
    status <- map["status"]
    reason <- map["reason"]
    userId <- map["user_id"]
    transactionableType <- map["transactionable_type"]
    transactionableId <- map["transactionable_id"]
    createdAt <- map["created_at"]
    updatedAt <- map["updated_at"]
    transactionable <- map["transactionable"]
  }
}

extension Transactionable: Mappable {
  
  public init?(map: Map) {
    mapping(map: map)
  }
  
  public mutating func mapping(map: Map) {
    id <- map["id"]
    deviceId <- map["device_id"]
    status <- map["status"]
    createdAt <- map["created_at"]
    updatedAt <- map["updated_at"]
  }
}
