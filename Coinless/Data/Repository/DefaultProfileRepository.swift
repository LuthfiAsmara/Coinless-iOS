//
//  CoinlessRepository.swift
//  Coinless
//
//  Created by Luthfi Asmara on 17/02/24.
//

import Foundation
import RxSwift

struct DefaultProfileRepository: ProfileRepository {
  
  fileprivate let remoteDataSource: RemoteDataSource
  
  init(remoteDataSource: RemoteDataSource) {
    self.remoteDataSource = remoteDataSource
  }
  
  func getProfile() -> Observable<Profile?> {
    return remoteDataSource.getProfile().map { $0 }
  }
}
