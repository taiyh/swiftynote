//
//  ViewController.swift
//  swiftynote
//
//  Created by taiyh on 2024/12/23.
//

import UIKit
//import React
import Alamofire
import os.log
import SnapKit

class ViewController: BaseViewController {
    
    func req() async {
        // Automatic String to URL conversion, Swift concurrency support, and automatic retry.
        let response = await AF.request("https://httpbin.org/get", interceptor: .retryPolicy)
                               // Automatic HTTP Basic Auth.
                               .authenticate(username: "user", password: "pass")
                               // Caching customization.
                               .cacheResponse(using: .cache)
                               // Redirect customization.
                               .redirect(using: .follow)
                               // Validate response code and Content-Type.
                               .validate()
                               // Produce a cURL command for the request.
                               .cURLDescription { description in
                                 print(description)
                               }
                               // Automatic Decodable support with background parsing.
//                               .serializingDecodable(DecodableType.self)
                               // Await the full response with metrics and a parsed body.
                               .response
        // Detailed response description for easy debugging.
        debugPrint(response)
    }
    
    @objc func btttc() {
        let xframe = UIApplication.shared.statusBarFrame
        print("statusBarFrame: \(xframe)")
        
        self.present(RCTBaseViewController(), animated: true)
//        self.navigationController?.pushViewController(RCTBaseViewController(), animated: true)
        
        Task {
            await req()
        }
    }
    
    @available(iOS 14.0, *)
    func testlogger() {
        let logger = Logger()
        let xxx = 42
        logger.info("The answer is \(xxx)")
//        
//        let logger = OSLog(subsystem: "sub", category: "network")
//        os_log("Image loaded: %@", log: logger, "imageName")  // 优于 "Image loaded: \(imageName)"

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad")
        statusBarStyle = .darkContent
        
        var corners = CACornerMask.layerMinXMinYCorner
        if view.effectiveUserInterfaceLayoutDirection == .rightToLeft {
            corners = .layerMaxXMinYCorner
        }
        
        navigationItem.title = "ViewController"
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        button.setTitle(String(localized: "button"), for: .normal)
        button.addTarget(self, action: #selector(btttc), for: .touchUpInside)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 25
        button.layer.maskedCorners = corners
//        button.layer.shadowColor
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.06).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 1)
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 3
//        button.layer.shadowPath = UIBezierPath(rect: button.bounds).cgPath
        
//        button.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner ]
//        button.layer.cornerRadius = 10
        
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(100)
            make.width.height.equalTo(100)
            make.top.equalTo(view).offset(100)
        }
//        let bundleURL = RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index");
//        [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
        
//        guard let bridge = RCTBridge(bundleURL: bundleURL, moduleProvider: nil, launchOptions: nil) else {
//            return
//        }
//        _bridge = [[RCTBridge alloc] initWithBundleURL:[self jsLocation]
//                                        moduleProvider:nil
//                                         launchOptions:nil];
        
//        let rootView = RCTRootView(bridge: bridge, moduleName: "AwesomeNote", initialProperties: nil)
        
//        view = rootView

//        view.backgroundColor = .lightGray
        if #available(iOS 14.0, *) {
            testlogger()
        } else {
            // Fallback on earlier versions
        }

        let label = UILabel()
        view.addSubview(label)
        label.text = String(localized: "Add a description for your collection here.")
        label.backgroundColor = .systemPink
        label.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10)
            make.top.equalTo(view).offset(200)
        }
    }
    override func viewWillTransition(
        to size: CGSize,
        with coordinator: any UIViewControllerTransitionCoordinator
    ) {
        super.viewWillTransition(to: size, with: coordinator)
        print("view size: \(size) ")
        print("view coordinator: \(coordinator) ")

    }

    override func willTransition(
        to newCollection: UITraitCollection,
        with coordinator: any UIViewControllerTransitionCoordinator
    ) {
        super.willTransition(to: newCollection, with: coordinator)
        print("newCollection: \(newCollection) ")
        print("coordinator: \(coordinator) ")
    }

//    viewWillTransitionToSize(_ size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        print("viewWillTransitionToSize")
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
#Preview {
    ViewController()
}

