//
//  DefaultUserRepository.swift
//  Coinless
//
//  Created by Luthfi Asmara on 25/02/24.
//

import Foundation
import RxSwift

struct DefaultAuthRepository: AuthRepository {
  
  fileprivate let remoteDataSource: RemoteDataSource
  
  init(remoteDataSource: RemoteDataSource) {
    self.remoteDataSource = remoteDataSource
  }
  
  func login(param: LoginParameter) -> Observable<User?> {
    return remoteDataSource.login(param: param).map { $0 }
  }
  
  func logout() -> Observable<String?> {
    return remoteDataSource.logout().map { $0 }
  }
  
  func register(param: RegisterParameter) -> Observable<User?> {
    return remoteDataSource.register(param: param).map { $0 }
  }
}
