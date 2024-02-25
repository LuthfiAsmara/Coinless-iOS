//
//  ProfileAssembler.swift
//  Coinless
//
//  Created by Luthfi Asmara on 17/02/24.
//

import Foundation

protocol ProfileAssembler {
  func resolve() -> ProfileViewController
  func resolve() -> ProfileViewModel
  func resolve() -> ProfileUseCase
  func resolve() -> ProfileRepository
}

extension ProfileAssembler where Self: Assembler {
  
  func resolve() -> ProfileViewController {
    return ProfileViewController(viewModel: resolve())
  }
  
  func resolve() -> ProfileViewModel {
    ProfileViewModel(profileUseCase: resolve())
  }
  
  func resolve() -> ProfileUseCase {
    ShowProfile(repository: resolve())
  }
  
  func resolve() -> ProfileRepository {
    DefaultProfileRepository(remoteDataSource: resolve())
  }
  
}
