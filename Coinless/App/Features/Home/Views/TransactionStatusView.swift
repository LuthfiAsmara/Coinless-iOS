//
//  TransactionStatusView.swift
//  Coinless
//
//  Created by Luthfi Asmara on 10/02/24.
//

import SwiftUI

struct TransactionStatusView: View {
  var type: StatusType
  
  var body: some View {
    SemiBoldText(type.text, size: 10)
      .foregroundColor(type.foregroundColor)
      .frame(width: 58, height: 17)
      .background(type.backgroundColor)
      .clipShape(Capsule())
  }
}

#Preview {
  TransactionStatusView(type: .success)
}

#Preview {
  TransactionStatusView(type: .pending)
}

#Preview {
  TransactionStatusView(type: .failed)
}

