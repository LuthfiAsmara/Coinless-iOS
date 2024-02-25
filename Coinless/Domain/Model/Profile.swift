//
//  Profile.swift
//  Coinless
//
//  Created by Luthfi Asmara on 12/02/24.
//

import SwiftUI

public struct Profile {
  var id: Int?
  var name: String?
  var email: String?
  var emailVerifiedAt: String?
  var phone: String?
  var balance: String?
  var createdAt: String?
  var updatedAt: String? 
  
  public init(id: Int? = nil, name: String? = nil, email: String? = nil, emailVerifiedAt: String? = nil, phone: String? = nil, balance: String? = nil, createdAt: String? = nil, updatedAt: String? = nil) {
    self.id = id
    self.name = name
    self.email = email
    self.emailVerifiedAt = emailVerifiedAt
    self.phone = phone
    self.balance = balance
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }
}
