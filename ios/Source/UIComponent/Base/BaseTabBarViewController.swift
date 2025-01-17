//
//  BaseTabBarViewController.swift
//  SwiftyNote
//
//  Created by taiyh on 2025/1/17.
//

import UIKit

open class BaseTabBarViewController: UITabBarController {

}

// MARK: status bar style
extension BaseTabBarViewController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.selectedViewController?.preferredStatusBarStyle ?? .default
    }
}
