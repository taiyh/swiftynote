//
//  BaseViewController.swift
//  Swiftynote
//
//  Created by taiyh on 2025/1/12.
//

import UIKit

open class BaseViewController: UIViewController {
    
    // MARK: status bar style
    // requires the UIViewControllerBasedStatusBarAppearance key in the Info.plist is set to YES
    open var statusBarStyle: UIStatusBarStyle = .lightContent {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    open var statusBarHidden: Bool = false {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: status bar style
extension BaseViewController {
    open override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .fade
    }
    open override var prefersStatusBarHidden: Bool {
        return statusBarHidden
    }
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
}
