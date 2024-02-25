//
//  AuthNavigator.swift
//  Coinless
//
//  Created by Luthfi Asmara on 20/02/24.
//

import UIKit

protocol AuthNavigator: InitialNavigator {
  func navigateToLogin(window: UIWindow?)
  func navigateToRegister(from viewController: UIViewController)
  func navigateToHome(from window: UIWindow?)
  func navigateToHome(from viewController: UIViewController)
}

struct DefaultAuthNavigator: AuthNavigator {
  var viewController: UIViewController {
    let viewController: LoginViewController = assembler.resolve()
    let navigationController = UINavigationController(rootViewController: viewController)
    navigationController.navigationBar.isHidden = true
    navigationController.setNavigationBarHidden(true, animated: false)
    return navigationController
  }
  
  private let assembler: Assembler
  
  init(assembler: Assembler) {
    self.assembler = assembler
  }
  
  func navigateToLogin(window: UIWindow?) {
    let viewController: LoginViewController = assembler.resolve()
    window?.rootViewController = viewController
  }
  
  func navigateToRegister(from viewController: UIViewController) {
    let nextViewController: RegisterViewController = assembler.resolve()
    viewController.navigationController?.pushViewController(nextViewController, animated: true)
  }
  
  func navigateToHome(from window: UIWindow?) {
    let navigator: HomeNavigator = assembler.resolve()
    navigator.navigate(from: window)
  }
  func navigateToHome(from viewController: UIViewController) {
    let navigator: HomeNavigator = assembler.resolve()
    navigator.navigateToHome(from: viewController)
  }
  
}
