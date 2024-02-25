//
//  ProfileView.swift
//  Coinless
//
//  Created by Luthfi Asmara on 17/02/24.
//

import SwiftUI

struct ProfileView: View {
  @ObservedObject var state: ViewState

    var body: some View {
      ZStack{
        Color.white
        Text(state.profile?.name ?? "sss")
          .foregroundColor(.black)
      }
    }
}

extension ProfileView {
  class ViewState: ObservableObject {
    @Published var profile : Profile?
  }
}


