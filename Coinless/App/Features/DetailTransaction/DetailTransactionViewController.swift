//
//  DetailTransactionViewController.swift
//  Coinless
//
//  Created by Luthfi Asmara on 21/02/24.
//

import Foundation
import RxSwift

class DetailTransactionViewController: HostingViewController<DetailTransactionView> {
  private let navigator: HomeNavigator
  private var state = DetailTransactionView.ViewState()
  private let disposeBag = DisposeBag()
  private let viewModel: DetailTransactionViewModel
  var transactionId = ""

  
  init(navigator: HomeNavigator, viewModel: DetailTransactionViewModel) {
    self.navigator = navigator
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  @MainActor required dynamic init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  lazy var contentView: DetailTransactionView = {
    var view = DetailTransactionView(state: state)
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViews(contentView: contentView)
    viewModel.getTransactionById(param: transactionId)
    observeValues()

  }
  
  private func observeValues() {
    viewModel.resultTransaction.subscribe(onNext: { [weak self] state in
      guard let self = self else { return }
      switch state {
      case .success(let data):
        self.state.transactionCode = data.code ?? ""
        self.state.transactionDate = data.createdAt?.convertDateFormat() ?? ""
        self.state.transactionType = getTransactionType(value: data.status!).titleTransaction 
      default:
        break
      }
    }).disposed(by: disposeBag)
  }
}

