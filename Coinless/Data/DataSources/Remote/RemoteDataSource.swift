//
//  RemoteDataSource.swift
//  Coinless
//
//  Created by Luthfi Asmara on 17/02/24.
//

import RxSwift
import Alamofire

protocol RemoteDataSource {
  func getProfile() -> Observable<Profile?>
  func getAllTransaction() -> Observable<[Transaction]?>
  func getTransactionById(param: String) -> Observable<Transaction?>
  func login(param: LoginParameter) -> Observable<User?>
  func logout() -> Observable<String?>
  func register(param: RegisterParameter) -> Observable<User?>
  
}

struct DefaultRemoteDataSource: RemoteDataSource {
  
  func getProfile() -> Observable<Profile?> {
    return NetworkService.shared.connect(api: .profile, mappableType: Profile.self).compactMap { $0 }
  }
  
  func getAllTransaction() -> Observable<[Transaction]?> {
    return NetworkService.shared.connect(api: .allTransaction, mappableType: BaseResponseArray<Transaction>.self).compactMap { $0.data }
  }
  
  func getTransactionById(param: String) -> Observable<Transaction?> {
    return NetworkService.shared.connect(api: .transactionById(transactionId: param), mappableType: BaseResponse<Transaction>.self).compactMap { $0.data }
  }
  
  func login(param: LoginParameter) -> Observable<User?> {
    return NetworkService.shared.connect(api: .login(param: param), mappableType: BaseResponse<User>.self).compactMap { $0.data }
  }
  
  func logout() -> Observable<String?> {
    return NetworkService.shared.connect(api: .logout, mappableType: BaseResponse<LogoutMessage>.self).compactMap { $0.message }
  }
  
  func register(param: RegisterParameter) -> Observable<User?> {
    return NetworkService.shared.connect(api: .register(param: param), mappableType: BaseResponse<User>.self).compactMap { $0.data }
  }
  
}
