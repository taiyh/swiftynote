//
//  AppDelegate.swift
//  swiftynote
//
//  Created by taiyh on 2024/12/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: UISceneSession Lifecycle

    func application(
        _ application: UIApplication,
        willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        return true
    }
    /// UIKit 直到方法返回后才会显示您的应用界面。
    /// 推迟初始化不需要立即执行的功能。
    /// 将长时间运行的任务移出主线程.
    /// 执行一次性任务
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let url = launchOptions?[.url]
        let sourceApplication = launchOptions?[.sourceApplication]
        let remoteNotification = launchOptions?[.remoteNotification]
        let location = launchOptions?[.location]
        let newsstandDownloads = launchOptions?[.newsstandDownloads]
        let bluetoothCentrals = launchOptions?[.bluetoothCentrals]
        let bluetoothPeripherals = launchOptions?[.bluetoothPeripherals]
        let shortcutItem = launchOptions?[.shortcutItem]
        let userActivityDictionary = launchOptions?[.userActivityDictionary]
        let userActivityType = launchOptions?[.userActivityType]
        let cloudKitShareMetadata = launchOptions?[.cloudKitShareMetadata]
        print(
            """
            url:\(url ?? "")
            sourceApplication:\(sourceApplication ?? "")
            remoteNotification:\(remoteNotification ?? "")
            location:\(location ?? "")
            newsstandDownloads:\(newsstandDownloads ?? "")
            bluetoothCentrals:\(bluetoothCentrals ?? "")
            bluetoothPeripherals:\(bluetoothPeripherals ?? "")
            shortcutItem:\(shortcutItem ?? "")
            userActivityDictionary:\(userActivityDictionary ?? "")
            userActivityType:\(userActivityType ?? "")
            cloudKitShareMetadata:\(cloudKitShareMetadata ?? "")
            """
        )
        if #available(iOS 14.5, *) {
            let eventAttribution = launchOptions?[.eventAttribution]
            print("eventAttribution:\(eventAttribution ?? "")")
        }
        
        
        return true
    }
    
    
    /// 使用此方法执行应用的任何最终清理任务，例如释放共享资源、保存用户数据和使计时器无效。
    /// 您对此方法的实现大约有五秒钟的时间执行任何任务并返回。
    /// 如果该方法在时间到期之前未返回，系统可能会完全终止该进程。
    /// 调用此方法后，应用程序还会发布一条通知 `willTerminateNotification`，此通知没有 `userInfo`
    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
    /// 应用知道设备现已解锁，可以再次访问某些类型的受保护文件
    func applicationProtectedDataDidBecomeAvailable(_ application: UIApplication) {
        
    }
    /// 应用知道设备即将被锁定，并且它当前正在访问的任何受保护文件可能很快变得不可用。
    func applicationProtectedDataWillBecomeUnavailable(_ application: UIApplication) {
        
    }
    
    /// 重大时间变化，包括午夜到来、运营商更新时间以及夏令时更改
    /// 调用此方法之前，应用程序还会发布一个通知 `significantTimeChangeNotification`
    /// 如果应用当前处于暂停状态，则此消息将排队等待，直到应用返回前台，此时才会传送。
    /// 如果发生多个时间变化，则只会传送最近的一个。
    func applicationSignificantTimeChange(_ application: UIApplication) {
        
    }
    
    /// 当 UIKit 管理的用户活动已更新时，此方法在主线程上调用。
    /// 可以实现此方法作为向用户活动对象添加数据的最后机会。
    func application(_ application: UIApplication, didUpdate userActivity: NSUserActivity) {
        
    }
    
    /// 使用此方法向用户提供即时反馈，告知用户某项活动即将在此设备上继续。
    func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {
        return true
    }
    
    /// 当应用程序接收到与用户活动相关的数据时，它会调用此方法，例如，当用户使用 Handoff 从其他设备传输活动时。
    /// 调用中的`restorationHandler`是可选的，并且仅当特定对象能够继续活动时才需要
    /// 每当应用启动以处理 SiriKit 意图时，都会调用此方法。
    func application(
        _ application: UIApplication,
        continue userActivity: NSUserActivity,
        restorationHandler: @escaping ([any UIUserActivityRestoring]?) -> Void
    ) -> Bool {
        return true
    }
    
    /// 使用此方法让用户知道无法继续执行指定的活动。
    /// 如果不实现此方法，UIKit 会向用户显示错误，并附带有关失败原因的适当消息。
    func application(
        _ application: UIApplication,
        didFailToContinueUserActivityWithType userActivityType: String,
        error: any Error
    ) {
        
    }
    
    /// 基于场景`UIScene`的应用不会调用此方法。
    func application(
        _ application: UIApplication,
        performActionFor shortcutItem: UIApplicationShortcutItem
    ) async -> Bool {
        return true
    }
    
//    func application(
//        _ application: UIApplication,
//        performActionFor shortcutItem: UIApplicationShortcutItem,
//        completionHandler: @escaping (Bool) -> Void
//    ) {
//        
//    }
    
    /// 如果在应用暂停或在后台运行时收到 URL，系统会在调用此方法之前将应用移至前台。
    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        
        let sourceApplication = options[.sourceApplication]
        let annotation = options[.annotation]
        let openInPlace = options[.openInPlace]
        print(
            """
            open url:\(url)
            sourceApplication:\(sourceApplication ?? "")
            annotation:\(annotation ?? "")
            openInPlace:\(openInPlace ?? "")
            """
        )
        if #available(iOS 14.5, *) {
            let eventAttribution = options[.eventAttribution]
            print("eventAttribution:\(eventAttribution ?? "")")
        }
        
        return true
    }

    /// 如果系统可用内存不足，且无法通过终止已暂停的应用来回收内存，则 UIKit 会向正在运行的应用发送内存不足警告。
    /// 发送通知 `didReceiveMemoryWarningNotification`
    /// 请尽快释放尽可能多的内存。
    /// 删除对图像、媒体文件或任何已经在磁盘上表示并可稍后重新加载的大型数据文件的引用。
    /// 删除对不再需要的任何临时对象的引用。
    /// 如果活动任务可能会消耗大量内存，请暂停调度队列或限制应用执行的同时操作数。
    /// 可以使用 iOS 模拟器中的“模拟内存警告”命令模拟。
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

