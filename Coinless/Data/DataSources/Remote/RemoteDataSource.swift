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
  
  
}
