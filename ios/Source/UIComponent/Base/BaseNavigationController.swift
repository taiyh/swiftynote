////
////  BaseNavigationController.swift
////  SwiftyNote
////
////  Created by taiyh on 2025/1/17.
////
//
//import UIKit
//
//open class BaseNavigationController: UINavigationController {
//    
//    
////    let interactiveTransition = InteractiveTransition()
//
//
//    open override func viewDidLoad() {
//        super.viewDidLoad()
////        delegate = self
//        interactivePopGestureRecognizer?.isEnabled = true
//        interactivePopGestureRecognizer?.delegate = self
//        
//        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
//        pan.delegate = self
//        view.addGestureRecognizer(pan)
//    }
//    
//    
//    // MARK: - 手势处理
//
//    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
//        let translation = gesture.translation(in: view)
//        let progress = min(max(translation.y / view.bounds.height, 0), 1)
//
//        switch gesture.state {
//        case .began:
//            if viewControllers.count > 1 {
//                interactiveTransition.hasStarted = true
//                popViewController(animated: true)
//            }
//        case .changed:
//            interactiveTransition.update(progress)
//            interactiveTransition.shouldFinish = progress > 0.3
//        case .ended, .cancelled:
//            interactiveTransition.hasStarted = false
//            if interactiveTransition.shouldFinish {
//                interactiveTransition.finish()
//            } else {
//                interactiveTransition.cancel()
//            }
//        default:
//            break
//        }
//    }
//}
//
//// MARK: status bar style
//extension BaseNavigationController {
//    open override var preferredStatusBarStyle: UIStatusBarStyle {
//        return self.topViewController?.preferredStatusBarStyle ?? .default
//    }
//}
//
//extension BaseNavigationController: UIGestureRecognizerDelegate {
//    open func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//        if gestureRecognizer == interactivePopGestureRecognizer {
//            return viewControllers.count > 1
//        }
//        return true
//    }
//}
