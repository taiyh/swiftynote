//
//  RCTManager.swift
//  SwiftyNote
//
//  Created by 台源洪 on 2025/4/29.
//

import UIKit
import React
import React_RCTAppDelegate

class RCTManager: RCTDefaultReactNativeFactoryDelegate {

    public static let shared = RCTManager()

    lazy var factory: RCTReactNativeFactory = {
        return RCTReactNativeFactory(delegate: self)
    }()

    public func view(_ moduleName: String, initProps: [String: Any]? = [:]) -> UIView {
        return factory.rootViewFactory.view(withModuleName: moduleName, initialProperties: initProps)
    }

    override func sourceURL(for bridge: RCTBridge) -> URL? {
        return self.bundleURL()
    }

    override func bundleURL() -> URL? {
#if DEBUG
      RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index")
#else
      Bundle.main.url(forResource: "main", withExtension: "jsbundle")
#endif
    }

    override func newArchEnabled() -> Bool {
        return true
    }
}
