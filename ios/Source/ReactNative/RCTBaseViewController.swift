//
//  RCTBaseViewController.swift
//  SwiftyNote
//
//  Created by 台源洪 on 2025/4/29.
//

import UIKit

class RCTBaseViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view = RCTManager.shared.view("AP79")
    }
}
