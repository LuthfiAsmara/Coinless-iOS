//
//  AuthRepository.swift
//  Coinless
//
//  Created by Luthfi Asmara on 25/02/24.
//

import Foundation
import RxSwift

protocol AuthRepository {
  func login(param: LoginParameter) -> Observable<User?>
  func logout() -> Observable<String?>
  func register(param: RegisterParameter) -> Observable<User?>

}

