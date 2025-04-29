//
//  ViewController.swift
//  swiftynote
//
//  Created by taiyh on 2024/12/23.
//

import UIKit
import React

class ViewController: BaseViewController {
    
    @objc func btttc() {
        let xframe = UIApplication.shared.statusBarFrame
        print("statusBarFrame: \(xframe)")
        self.navigationController?.pushViewController(RCTBaseViewController(), animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad")
        statusBarStyle = .darkContent
        navigationItem.title = "ViewController"
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        button.setTitle("button", for: .normal)
        button.addTarget(self, action: #selector(btttc), for: .touchUpInside)
        view.addSubview(button)
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

        view.backgroundColor = .lightGray
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

