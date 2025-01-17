//
//  AppInfo.swift
//  SwiftyNote
//
//  Created by taiyh on 2025/1/9.
//

import Foundation
import UIKit

@objc(TAIAppInfo)
open class AppInfo: NSObject {
    static let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    static let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    static let displayName = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String
    static let bundleIdentifier = Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String
}

// MARK: window scene
extension AppInfo {
    @available(iOS 13.0, *)
    var activeWindowScene: UIWindowScene? {
        UIApplication.shared.connectedScenes.filter({
            $0.activationState == .foregroundActive
        }).compactMap({
            $0 as? UIWindowScene
        }).first
    }

    @available(iOS 13.0, *)
    var sceneKeyWindow: UIWindow? {
        if #available(iOS 15.0, *) {
            return self.activeWindowScene?.keyWindow
        } else {
            return self.activeWindowScene?.windows.filter({
                $0.isKeyWindow
            }).first
        }
    }
}

// MARK: statusBarFrame
extension AppInfo {
    var statusBarFrame: CGRect {
        if #available(iOS 13.0, *) {
            return self.activeWindowScene?.statusBarManager?.statusBarFrame ?? .zero
        } else {
            return UIApplication.shared.statusBarFrame
        }
    }
    var statusBarHeight: CGFloat {
        return self.statusBarFrame.height
    }
}
