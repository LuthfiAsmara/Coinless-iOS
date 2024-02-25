//
//  RegisterViewController.swift
//  Coinless
//
//  Created by Luthfi Asmara on 20/02/24.
//

import SwiftUI
import RxSwift

class RegisterViewController: HostingViewController<RegisterView> {
  
  private let disposeBag = DisposeBag()
  
  private var state = RegisterView.ViewState()
  
  private let navigator: AuthNavigator
  
  init(navigator: AuthNavigator) {
    self.navigator = navigator
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
    
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViews(contentView: contentView)
  }
}
