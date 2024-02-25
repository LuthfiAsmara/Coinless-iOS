//
//  RegisterViewController.swift
//  Coinless
//
//  Created by Luthfi Asmara on 20/02/24.
//

import SwiftUI
import RxSwift

class RegisterViewController: HostingViewController<RegisterView> {
  private var viewModel: AuthViewModel
  private let disposeBag = DisposeBag()
  private var state = RegisterView.ViewState()
  private let navigator: AuthNavigator
  
  init(navigator: AuthNavigator, viewModel: AuthViewModel) {
    self.navigator = navigator
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  @MainActor required dynamic init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  lazy var contentView: RegisterView = {
    var view = RegisterView(state: state)
    
    view.onNavigateToLogIn = { [weak self] in
      guard let self else { return }
      self.navigationController?.popViewController(animated: true)
    }
    
    view.onClickSignUp = { [weak self] in
      guard let self else { return }
      self.viewModel.register(param: .init(name: state.nameValue ,email: state.emailValue, password: state.passwordValue, confirm_password: state.confirmPasswordValue))
    }
    
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViews(contentView: contentView)
    observeValues()
  }
  
  private func observeValues() {
    let defaults = UserDefaults.standard
    
    viewModel.resultRegister.subscribe(onNext: { [weak self] state in
      guard let self = self else { return }
      switch state {
      case .success(let data):
        defaults.set(data.token, forKey: "bearerToken")
        defaults.set(data.name, forKey: "username")
        print(data.token!)
        print(data.name!)
        self.navigator.navigateToHome(from: self)
      default:
        break
      }
    }).disposed(by: disposeBag)
  }
}
