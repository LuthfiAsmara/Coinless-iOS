//
//  String+Extension.swift
//  Coinless
//
//  Created by Luthfi Asmara on 26/02/24.
//

import Foundation

extension String {
  func amountInRupiah() -> String {
    guard let inputValue = Double(self) else {
      return "Invalid input"
    }
    
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = 0
    formatter.maximumFractionDigits = 0
    
    if let formattedString = formatter.string(from: NSNumber(value: inputValue)) {
      return formattedString
    } else {
      return "Error formatting amount"
    }
  }
  
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
