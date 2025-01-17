//
//  BaseNavigationController.swift
//  SwiftyNote
//
//  Created by taiyh on 2025/1/17.
//

import UIKit

open class BaseNavigationController: UINavigationController {

    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.isEnabled = true
        interactivePopGestureRecognizer?.delegate = self
    }
}

// MARK: status bar style
extension BaseNavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.topViewController?.preferredStatusBarStyle ?? .default
    }
}

extension BaseNavigationController: UIGestureRecognizerDelegate {
    open func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer == interactivePopGestureRecognizer {
            return viewControllers.count > 1
        }
        return true
    }
}
