//
//  AuthViewController.swift
//  Coinless
//
//  Created by Luthfi Asmara on 20/02/24.
//

import SwiftUI
import RxSwift
import RxCocoa

class LoginViewController: HostingViewController<LoginView> {
  
  private let disposeBag = DisposeBag()
  
  private var state = LoginView.ViewState()
  
  var isAuthorized = true
  
  var profile: Profile? {
    didSet {
      configureViews(contentView: contentView)
    }
  }
  
  private let navigator: AuthNavigator
  
  init(navigator: AuthNavigator) {
    self.navigator = navigator
    super.init(nibName: nil, bundle: nil)
  }
  
  @MainActor required dynamic init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  lazy var contentView: LoginView = {
    var view = LoginView(state: state)
    
    view.onNavigateToSignUp = { [weak self] in
      guard let self else { return }
      navigator.navigateToRegister(from: self)
    }
    
    view.onClickLogin = { [weak self] in
      guard let self else { return }
      navigator.navigateToHome(from: self)
    }
    
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViews(contentView: contentView)    
  }
  
  private func mapNavigation() {
    delay(bySeconds: 0.8) { [weak self] in
      guard let self = self else { return }
      
      if !isAuthorized {
        
      } else {
        navigator.navigateToHome(from: view.window)
      }
    }
  }
}
