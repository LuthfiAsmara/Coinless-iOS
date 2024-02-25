//
//  HomeNavigator.swift
//  Coinless
//
//  Created by Luthfi Asmara on 29/01/24.
//

import UIKit

protocol HomeNavigator: InitialNavigator {
  func navigateToHome(from viewController: UIViewController)
  func navigateToProfile(from viewController: UIViewController)
  func navigateToLogin(from viewController: UIViewController)
  func navigateToDetailTransaction(from viewController: UIViewController, transactionId: String)
}

struct DefaultHomeNavigator: HomeNavigator {
  var viewController: UIViewController {
    let viewController: HomeViewController = assembler.resolve()
    let navigationController = UINavigationController(rootViewController: viewController)
    navigationController.navigationBar.isHidden = true
    navigationController.setNavigationBarHidden(true, animated: false)
    return navigationController
  }
  
  private let assembler: Assembler
  
  init(assembler: Assembler) {
    self.assembler = assembler
  }
  
  func navigateToHome(from viewController: UIViewController) {
    let nextViewController: HomeViewController = assembler.resolve()
    viewController.navigationController?.pushViewController(nextViewController, animated: true)
  }
  
  func navigateToProfile(from viewController: UIViewController) {
    let nextViewController: ProfileViewController = assembler.resolve()
    viewController.navigationController?.pushViewController(nextViewController, animated: true)
  }
  
  func navigateToLogin(from viewController: UIViewController) {
    viewController.navigationController?.popToRootViewController(animated: true)
  }
  
  func navigateToDetailTransaction(from viewController: UIViewController, transactionId: String) {
    let nextViewController: DetailTransactionViewController = assembler.resolve()
    nextViewController.transactionId = transactionId
    viewController.navigationController?.pushViewController(nextViewController, animated: true)
  }
}

