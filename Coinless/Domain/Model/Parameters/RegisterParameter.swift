//
//  RegisterParameter.swift
//  Coinless
//
//  Created by Luthfi Asmara on 25/02/24.
//

import Foundation

public struct RegisterParameter: Encodable {
  let name: String
  let email: String
  let password: String
  let confirm_password: String
  
  public init(name: String, email: String, password: String, confirm_password: String) {
    self.name = name
    self.email = email
    self.password = password
    self.confirm_password = confirm_password
  }
}
