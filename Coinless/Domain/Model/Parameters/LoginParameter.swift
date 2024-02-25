//
//  LoginParameter.swift
//  Coinless
//
//  Created by Luthfi Asmara on 25/02/24.
//

import Foundation

public struct LoginParameter: Encodable {
  let email: String
  let password: String
  
  public init(email: String, password: String) {
    self.email = email
    self.password = password
  }
}
