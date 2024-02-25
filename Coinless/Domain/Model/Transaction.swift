//
//  Transaction.swift
//  Coinless
//
//  Created by Luthfi Asmara on 20/02/24.
//

import SwiftUI

public struct Transaction: Identifiable {
  public var id: Int?
  public var code: String?
  public var amount: String?
  public var fee: Double?
  public var total: Double?
  public var status: String?
  public var reason: String?
  public var userId: Int?
  public var transactionableType: String?
  public var transactionableId: Int?
  public var createdAt: String?
  public var updatedAt: String?
  public var transactionable: Transactionable?
  
  public init(id: Int? = nil, code: String? = nil, amount: String? = nil, fee: Double? = nil, total: Double? = nil, status: String? = nil, reason: String? = nil, userId: Int? = nil, transactionableType: String? = nil, transactionableId: Int? = nil, createdAt: String? = nil, updatedAt: String? = nil, transactionable: Transactionable? = nil) {
    self.id = id
    self.code = code
    self.amount = amount
    self.fee = fee
    self.total = total
    self.status = status
    self.reason = reason
    self.userId = userId
    self.transactionableType = transactionableType
    self.transactionableId = transactionableId
    self.createdAt = createdAt
    self.updatedAt = updatedAt
    self.transactionable = transactionable
  }
}

public struct Transactionable {
    var id: Int?
    var deviceId: Int?
    var status: String?
    var createdAt: Date?
    var updatedAt: Date?
  
  public init(id: Int? = nil, deviceId: Int? = nil, status: String? = nil, createdAt: Date? = nil, updatedAt: Date? = nil) {
    self.id = id
    self.deviceId = deviceId
    self.status = status
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }
}
