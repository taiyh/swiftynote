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
    open var statusBarStyle: UIStatusBarStyle = .default {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    open var statusBarHidden: Bool = false {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }

    // MARK: navigation bar visibility
    open var navigationBarHidden: Bool = false {
        didSet {
            updateNavigationBarVisibility()
        }
    }

    // MARK: view life cycle
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateNavigationBarVisibility()
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

// MARK: navigation bar visibility
extension BaseViewController {
    private func updateNavigationBarVisibility() {
        navigationController?.setNavigationBarHidden(navigationBarHidden, animated: true)
    }
}
