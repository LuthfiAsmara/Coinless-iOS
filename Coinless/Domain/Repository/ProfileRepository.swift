//
//  CoinlessRepository.swift
//  Coinless
//
//  Created by Luthfi Asmara on 12/02/24.
//

import Foundation
import RxSwift

protocol ProfileRepository {
  func getProfile() -> Observable<Profile?>

}
