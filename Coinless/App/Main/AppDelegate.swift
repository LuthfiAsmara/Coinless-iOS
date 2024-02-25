//
//  AppDelegate.swift
//  Coinless
//
//  Created by Luthfi Asmara on 29/01/24.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  private let assembler = AppAssembler()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    let navigator: AuthNavigator = assembler.resolve()
    navigator.navigate(from: window)

    window?.makeKeyAndVisible()

    return true
  }
}

