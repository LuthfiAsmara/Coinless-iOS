//
//  ContainedButton.swift
//  Coinless
//
//  Created by Luthfi Asmara on 20/02/24.
//

import SwiftUI

enum ButtonType {
  case primary
  case border
  
  var borderColor: Color {
    switch self {
    case .border:
      return Color.black
    default:
      return Color.clear
    }
  }
  
  var foregroundColor: Color {
    switch self {
    case .border:
      return Color.black
    default:
      return Color.white
    }
  }
  
  var backgroundColor: Color {
    switch self {
    case .primary:
      return Color.Main.primary
    default:
      return Color.clear
    }
  }
}

struct ContainedButton: View {
  var title: String
  var type: ButtonType
  var actionHandler: () -> Void
  
  var body: some View {
    Button(action: actionHandler, label: {
      RegulerText(title, size: 14)
        .foregroundColor(type.foregroundColor)
        .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
        .frame(minWidth: 0, maxWidth: .infinity)
    })
    .background(type.backgroundColor)
    .cornerRadius(10)
    .overlay(
      RoundedRectangle(cornerRadius: 10)
        .stroke(type.borderColor, lineWidth: 1)
    )
  }
}

#Preview {
  ContainedButton(title: "Text Button", type: .primary, actionHandler: {})
}

#Preview {
  ContainedButton(title: "Text Button", type: .border, actionHandler: {})
}
