//
//  ProfileViewModel.swift
//  Coinless
//
//  Created by Luthfi Asmara on 17/02/24.
//

import Foundation
import RxSwift
import RxCocoa

class ProfileViewModel {
  let profileUser = PublishRelay<Profile>()
  
  private let disposeBag = DisposeBag()
  private let profileUseCase: ProfileUseCase
  
  init(profileUseCase: ProfileUseCase) {
    self.profileUseCase = profileUseCase
  }
  
  func getProfile() {
    profileUseCase.execute().subscribe(onNext: { [weak self] result in
      self?.profileUser.accept(result!)
    }).disposed(by: disposeBag)
  }
}
