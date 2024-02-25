//
//  Form.swift
//  Coinless
//
//  Created by Luthfi Asmara on 20/02/24.
//

import SwiftUI

struct FormView: View {
  var title: String
  @Binding var formValue: String
  
  var body: some View {
    VStack(alignment: .leading, spacing: 0){
      RegulerText(title, size: 14)
        .foregroundColor(formValue.isEmpty ? Color.Main.disable : Color.black)
      TextField("", text: $formValue)
        .foregroundColor(.black)
        .font(.system(size: 14))
        .padding(.leading, 10)
        .frame(height: 45)
        .background(
          RoundedRectangle(cornerRadius: 10)
            .stroke(formValue.isEmpty ? Color.Main.disable : Color.black, lineWidth: 1)
        )
        .padding(.vertical, 10)
      
      
    }
  }
}

#Preview {
  FormView(title: "Email", formValue: .constant(""))
}
