//
//  AppInfoViewController.swift
//  SwiftyNote
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
        navigationBarHidden = true
        
        
        let textField = UITextField(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        textField.text = "textField"
        view.addSubview(textField)


        print("isEmulator \(DeviceInfo().systemName)")
        print("UIDevice.current.name \(UIDevice.current.name)")
        print("targetEnvironment \(DeviceInfo().model)")
        print("isEmulator \(DeviceInfo().localizedModel)")
        print("modelName \(DeviceInfo().systemVersion)")
        print("targetEnvironment \(DeviceInfo().orientation)")
        print("targetEnvironment \(DeviceInfo().modelId())")
        print("targetEnvironment \(DeviceInfo().modelName)")
        
        for item in Locale.preferredLanguages {
            print("Locale-preferredLanguages - \(item)")
        }
//        Locale.preferredLanguages.first
        for item in Bundle.main.preferredLocalizations {
            print("Bundle preferredLanguages - \(item)")
        }
        
        
        // 获取当前设备的语言代码
        if #available(iOS 16, *) {
            let languageCode = Locale.current.language.languageCode?.identifier
            print("Language Code: \(languageCode ?? "Unknown")")
        } else {
            // Fallback on earlier versions
            let languageCode = Locale.current.languageCode
            print("Language Code: \(languageCode ?? "Unknown")")
        }
        
         
        // 获取当前地区的标识符
        let regionCode = Locale.current.regionCode
        print("Region Code: \(regionCode ?? "Unknown")")
         
        // 获取完整的Locale信息
        let currentLocale = Locale.current
        print("Current Locale: \(currentLocale)")
    }
}
