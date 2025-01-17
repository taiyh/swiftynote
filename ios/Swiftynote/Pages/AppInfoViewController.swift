//
//  AppInfoViewController.swift
//  Swiftynote
//
//  Created by taiyh on 2025/1/17.
//

import UIKit

class AppInfoViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        statusBarStyle = .lightContent
        navigationItem.title = "AppInfo"

        print("isEmulator \(DeviceInfo().isSimulator)")
        print("modelName \(DeviceInfo().modelName)")
        print("targetEnvironment \(DeviceInfo().targetEnvironment)")
    }
}
