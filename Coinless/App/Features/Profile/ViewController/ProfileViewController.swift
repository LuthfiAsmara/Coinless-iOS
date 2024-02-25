//
//  ProfileViewController.swift
//  Coinless
//
//  Created by Luthfi Asmara on 17/02/24.
//

import SwiftUI
import RxSwift
import RxCocoa

class ProfileViewController: HostingViewController<ProfileView> {
  private let viewModel: ProfileViewModel
  
  private let disposeBag = DisposeBag()
  
  private var state = ProfileView.ViewState()
  
  
  init(viewModel: ProfileViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  @MainActor required dynamic init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  lazy var contentView: ProfileView = {
    var view = ProfileView(state: state)
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViews(contentView: contentView)
    viewModel.getProfile()
    observeValues()

  }
  
  private func observeValues() {
    viewModel.profileUser.subscribe(onNext: { [weak self] result in
      self?.state.profile = result
    }).disposed(by: disposeBag)
  }
}
