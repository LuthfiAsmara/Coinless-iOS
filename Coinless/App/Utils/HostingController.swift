//
//  HostingController.swift
//  Coinless
//
//  Created by Luthfi Asmara on 03/02/24.
//

import SwiftUI
import UIKit
import SnapKit

/// A view controller for hosting SwiftUI content.
class HostingViewController<ContentView: View>: UIViewController {
  
  /// The hosting controller for the SwiftUI content.
  private var hostingController: UIHostingController<ContentView>?
  
  /// Initializes a new HostingViewController with a nib name and bundle.
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  /// Initializes a new HostingViewController from data in a given decoder.
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  /// Configures the views with SwiftUI content.
  /// - Parameters:
  ///   - contentView: The SwiftUI content to be hosted.
  ///   - ignoreSafeArea: A boolean value indicating whether to ignore safe area constraints. Default is `true`.
  func configureViews(contentView: ContentView, ignoreSafeArea: Bool = true) {
    hostingController = UIHostingController(rootView: contentView, ignoreSafeArea: ignoreSafeArea)
    
    if let hostingView = hostingController?.view {
      view.addSubview(hostingView)
      
      hostingView.snp.makeConstraints { make in
        make.edges.equalToSuperview()
      }
    }
  }
}

extension UIViewController {
  
  /// Configures a content view with SwiftUI content.
  /// - Parameters:
  ///   - contentView: The SwiftUI content to be hosted.
  ///   - ignoreSafeArea: A boolean value indicating whether to ignore safe area constraints. Default is `true`.
  /// - Returns: The configured view.
  func configureContentView<ContentView: View>(contentView: ContentView, ignoreSafeArea: Bool = true) -> UIView {
    UIHostingController(rootView: contentView, ignoreSafeArea: ignoreSafeArea).view
  }
}

