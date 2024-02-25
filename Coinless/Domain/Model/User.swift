//
//  Login.swift
//  Coinless
//
//  Created by Luthfi Asmara on 25/02/24.
//

import SwiftUI

public struct User {
  var name: String?
  var token: String?
  
  public init(name: String? = nil, token: String? = nil) {
    self.name = name
    self.token = token
  }
}
