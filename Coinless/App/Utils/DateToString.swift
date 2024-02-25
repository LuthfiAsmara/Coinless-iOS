//
//  DateToString.swift
//  Coinless
//
//  Created by Luthfi Asmara on 21/02/24.
//

import Foundation

extension String {
  func convertDateFormat() -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    
    if let date = dateFormatter.date(from: self) {
      dateFormatter.dateFormat = "yyyy-MM-dd"
      return dateFormatter.string(from: date)
    }
    
    return nil
  }
}

