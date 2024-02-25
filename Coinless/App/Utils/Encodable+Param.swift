//
//  Encodable+Param.swift
//  Coinless
//
//  Created by Luthfi Asmara on 17/02/24.
//

import Foundation

public extension Encodable {
  var parameters: [String: Any] {
    guard let data = try? JSONEncoder().encode(self),
          let dict = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
      return [:]
    }
    return dict
  }
}
