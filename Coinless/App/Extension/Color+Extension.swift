//
//  Color+Extension.swift
//  Coinless
//
//  Created by Luthfi Asmara on 10/02/24.
//

import SwiftUI

extension Color {
  enum Main {
    static let primary = Color("Primary")
    static let disable = Color("Disable")
    static let background = Color("Background")
    static let backgroundIcon = Color("BackgroundIcon")
  }
  
  enum State {
    static let success = Color("Success")
    static let successLight = Color("SuccessLight")
    static let pending = Color("Pending")
    static let pendingLight = Color("PendingLight")
    static let failed = Color("Failed")
    static let failedLight = Color("FailedLight")
  }
  
  enum Text {
    static let gray = Color("Gray")
  }
}
