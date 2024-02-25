//
//  HomeViewController.swift
//  Coinless
//
//  Created by Luthfi Asmara on 29/01/24.
//

import SwiftUI
import SnapKit
import RxSwift

class HomeViewController: HostingViewController<HomeView> {
  private let navigator: HomeNavigator
  private let viewModel: HomeViewModel
  private var state = HomeView.ViewState()
  private let disposeBag = DisposeBag()

  
  init(navigator: HomeNavigator, viewModel: HomeViewModel) {
    self.navigator = navigator
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  @MainActor required dynamic init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  lazy var contentView: HomeView = {
    var view = HomeView(state: state)
    view.onClickProfile = { [weak self] in
      guard let self = self else { return }
      navigator.navigateToProfile(from: self)
    }
    
    view.onClickLogout = { [weak self] in
      guard let self = self else { return }
      navigator.navigateToLogin(from: self)
    }
    
    view.onClickDetailTransaction = { [weak self] transactionId in
      guard let self = self else { return }
      navigator.navigateToDetailTransaction(from: self, transactionId: transactionId)
    }
    
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViews(contentView: contentView)
    viewModel.getAllTransaction()
    observeValues()
  }
  
  private func observeValues() {
    viewModel.allTransaction.subscribe(onNext: { [weak self] result in
      self?.state.allTransaction = result
    }).disposed(by: disposeBag)
  }
}
