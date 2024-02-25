//
//  Delay.swift
//  Coinless
//
//  Created by Luthfi Asmara on 20/02/24.
//

import Foundation

public func delay(bySeconds seconds: Double, closure: @escaping () -> Void) {
  DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
    closure()
  }
}
