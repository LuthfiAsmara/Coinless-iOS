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
  private var viewModel: AuthViewModel
  private let disposeBag = DisposeBag()
  private var state = LoginView.ViewState()
  
  
  private let navigator: AuthNavigator
  
  init(navigator: AuthNavigator, viewModel: AuthViewModel) {
    self.navigator = navigator
    self.viewModel = viewModel
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
      self.viewModel.login(param: .init(email: state.emailValue, password: state.passwordValue))
    }
    
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    mapNavigation()
    configureViews(contentView: contentView)
    observeValues()
    
  }
  
  private func observeValues() {
    let defaults = UserDefaults.standard
    
    viewModel.resultLogin.subscribe(onNext: { [weak self] state in
      guard let self = self else { return }
      switch state {
      case .success(let data):
        defaults.set(data.token, forKey: "bearerToken")
        print(data.token!)
        print(data.name!)
        self.navigator.navigateToHome(from: self)
      default:
        break
      }
    }).disposed(by: disposeBag)
  }
  
  private func mapNavigation() {
    let defaults = UserDefaults.standard
    let bearerToken = defaults.string(forKey: "bearerToken") ?? ""
    delay(bySeconds: 0.8) { [weak self] in
      guard let self = self else { return }
      
      if !bearerToken.isEmpty {
        navigator.navigateToHome(from: view.window)
      }
    }
  }
}
