//
//  AppString.swift
//  Coinless
//
//  Created by Luthfi Asmara on 20/02/24.
//

import Foundation

enum AppString: String {
  
  case titleLogin = "title_login"
  case messageLogin = "message_login"
  case titleRegister = "title_register"
  case messageRegister = "message_register"

  var localized: String {
    NSLocalizedString(self.rawValue, comment: "")
  }
}
