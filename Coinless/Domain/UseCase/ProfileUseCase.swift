//
//  ProfileUseCase.swift
//  Coinless
//
//  Created by Luthfi Asmara on 17/02/24.
//

import RxSwift

protocol ProfileUseCase {
  func execute() -> Observable<Profile?>
}

class ShowProfile: ProfileUseCase {
  private let repository: ProfileRepository

  init(repository: ProfileRepository) {
    self.repository = repository
  }

  func execute() -> Observable<Profile?> {
    return repository.getProfile()
  }
}
