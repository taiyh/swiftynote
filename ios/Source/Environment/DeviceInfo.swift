//
//  DeviceInfo.swift
//  SwiftyNote
//
//  Created by taiyh on 2025/1/9.
//

import Foundation
import UIKit

@objc(TAIDeviceInfo)
open class DeviceInfo: NSObject {

    var systemName: String {
        return UIDevice.current.systemName
    }

    /// 获取设备名称。iOS 16以后返回 iPhone。 https://developer.apple.com/documentation/uikit/uidevice/name
    var name: String {
        return UIDevice.current.name
    }

    var model: String {
        return UIDevice.current.model
    }

    var localizedModel: String {
        return UIDevice.current.localizedModel
    }

    var systemVersion: String {
        return UIDevice.current.systemVersion
    }

    var orientation: UIDeviceOrientation {
        return UIDevice.current.orientation
    }

    var isSimulator: Bool {
#if targetEnvironment(simulator)
        return true
#else
        return false
#endif
    }
    
    var targetEnvironment: String {
#if targetEnvironment(simulator)
        return "simulator"
#elseif targetEnvironment(macCatalyst)
        return "macCatalyst"
#else
        return ""
#endif
//        ### swift 条件编译函数targetEnvironment
//        simulator：检查是否在模拟器环境中编译。
//        macCatalyst：检查是否在 macOS 环境中编译（使用 Mac Catalyst）。
//        tvOS：检查是否在 tvOS 环境中编译。
//        watchOS：检查是否在 watchOS 环境中编译。
    }
    
    /// 获取设备型号内部编码
    /// - Returns: 内部编码
    func modelId() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let modelId = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }

        #if targetEnvironment(simulator)
        if let simulatorModelIdentifier = ProcessInfo.processInfo.environment["SIMULATOR_MODEL_IDENTIFIER"] {
            return simulatorModelIdentifier
        }
        #endif

        return modelId
    }

    /// 获取设备型号
    /// - Returns: 市场销售型号
    var modelName: String {
        let modelId = self.modelId()
        let name = self.devideModelNameMapping[modelId]

        if name?.isEmpty == false {
            return name ?? ""
        }

        if modelId.hasPrefix("iPod") {
            return "iPod Touch"
        } else if modelId.hasPrefix("iPad") {
            return "iPad"
        } else if modelId.hasPrefix("iPhone") {
            return "iPhone"
        } else if modelId.hasPrefix("AppleTV") {
            return "Apple TV"
        } else if modelId.hasPrefix("RealityDevice") {
            return "Apple Vision"
        }

        return "unknown"
    }
    // NSProcessInfo
    // deviceId
    
    // 语言
    // 地区
    // ip
    // mac
    // 运营商
    // 时区

    // UIContentSizeCategory
    // 内存，可用，总量

}

extension DeviceInfo {
    var devideModelNameMapping: [String: String] {
        return [
            "iPhone1,1": "iPhone", // (Original)
            "iPhone1,2": "iPhone 3G", // (3G)
            "iPhone2,1": "iPhone 3GS", // (3GS)
            "iPhone3,1": "iPhone 4", // (GSM)
            "iPhone3,2": "iPhone 4", // iPhone 4
            "iPhone3,3": "iPhone 4", // (CDMA/Verizon/Sprint)
            "iPhone4,1": "iPhone 4S", //
            "iPhone5,1": "iPhone 5", // (model A1428, AT&T/Canada)
            "iPhone5,2": "iPhone 5", // (model A1429, everything else)
            "iPhone5,3": "iPhone 5c", // (model A1456, A1532 | GSM)
            "iPhone5,4": "iPhone 5c", // (model A1507, A1516, A1526 (China), A1529 | Global)
            "iPhone6,1": "iPhone 5s", // (model A1433, A1533 | GSM)
            "iPhone6,2": "iPhone 5s", // (model A1457, A1518, A1528 (China), A1530 | Global)
            "iPhone7,1": "iPhone 6 Plus", //
            "iPhone7,2": "iPhone 6", //
            "iPhone8,1": "iPhone 6s", //
            "iPhone8,2": "iPhone 6s Plus", //
            "iPhone8,4": "iPhone SE", //
            "iPhone9,1": "iPhone 7", // (model A1660 | CDMA)
            "iPhone9,2": "iPhone 7 Plus", // (model A1661 | CDMA)
            "iPhone9,3": "iPhone 7", // (model A1778 | Global)
            "iPhone9,4": "iPhone 7 Plus", // (model A1784 | Global)
            "iPhone10,1": "iPhone 8", // (model A1863, A1906, A1907)
            "iPhone10,2": "iPhone 8 Plus", // (model A1864, A1898, A1899)
            "iPhone10,3": "iPhone X", // (model A1865, A1902)
            "iPhone10,4": "iPhone 8", // (model A1905)
            "iPhone10,5": "iPhone 8 Plus", // (model A1897)
            "iPhone10,6": "iPhone X", // (model A1901)
            "iPhone11,2": "iPhone XS", // (model A2097, A2098)
            "iPhone11,4": "iPhone XS Max", // (model A1921, A2103)
            "iPhone11,6": "iPhone XS Max", // (model A2104)
            "iPhone11,8": "iPhone XR", // (model A1882, A1719, A2105)
            "iPhone12,1": "iPhone 11",
            "iPhone12,3": "iPhone 11 Pro",
            "iPhone12,5": "iPhone 11 Pro Max",
            "iPhone12,8": "iPhone SE", // (2nd Generation iPhone SE),
            "iPhone13,1": "iPhone 12 mini",
            "iPhone13,2": "iPhone 12",
            "iPhone13,3": "iPhone 12 Pro",
            "iPhone13,4": "iPhone 12 Pro Max",
            "iPhone14,2": "iPhone 13 Pro",
            "iPhone14,3": "iPhone 13 Pro Max",
            "iPhone14,4": "iPhone 13 mini",
            "iPhone14,5": "iPhone 13",
            "iPhone14,6": "iPhone SE", // (3nd Generation iPhone SE),
            "iPhone14,7": "iPhone 14",
            "iPhone14,8": "iPhone 14 Plus",
            "iPhone15,2": "iPhone 14 Pro",
            "iPhone15,3": "iPhone 14 Pro Max",
            "iPhone15,4": "iPhone 15",
            "iPhone15,5": "iPhone 15 Plus",
            "iPhone16,1": "iPhone 15 Pro",
            "iPhone16,2": "iPhone 15 Pro Max",
            "iPhone17,1": "iPhone 16 Pro",
            "iPhone17,2": "iPhone 16 Pro Max",
            "iPhone17,3": "iPhone 16",
            "iPhone17,4": "iPhone 16 Plus",

            "iPod1,1": "iPod Touch", // (Original)
            "iPod2,1": "iPod Touch", // (Second Generation)
            "iPod3,1": "iPod Touch", // (Third Generation)
            "iPod4,1": "iPod Touch", // (Fourth Generation)
            "iPod5,1": "iPod Touch", // (Fifth Generation)
            "iPod7,1": "iPod Touch", // (Sixth Generation)
            "iPod9,1": "iPod Touch", // (Seventh Generation)

            "iPad1,1": "iPad",
            "iPad1,2": "iPad 3G",
            "iPad2,1": "iPad 2",
            "iPad2,2": "iPad 2",
            "iPad2,3": "iPad 2",
            "iPad2,4": "iPad 2",
            "iPad3,1": "iPad",
            "iPad3,2": "iPad",
            "iPad3,3": "iPad",
            "iPad2,5": "iPad mini",
            "iPad2,6": "iPad mini",
            "iPad2,7": "iPad mini",
            "iPad3,4": "iPad",
            "iPad3,5": "iPad",
            "iPad3,6": "iPad",
            "iPad4,1": "iPad Air",
            "iPad4,2": "iPad Air",
            "iPad4,3": "iPad Air",
            "iPad4,4": "iPad Mini 2",
            "iPad4,5": "iPad Mini 2",
            "iPad4,6": "iPad Mini 2",
            "iPad4,7": "iPad Mini 3",
            "iPad4,8": "iPad Mini 3",
            "iPad4,9": "iPad Mini 3",
            "iPad5,1": "iPad Mini 4",
            "iPad5,2": "iPad Mini 4",
            "iPad5,3": "iPad Air 2",
            "iPad5,4": "iPad Air 2",
            "iPad6,3": "iPad Pro 9.7-inch",
            "iPad6,4": "iPad Pro 9.7-inch",
            "iPad6,7": "iPad Pro 12.9-inch",
            "iPad6,8": "iPad Pro 12.9-inch",
            "iPad6,11": "iPad (5th generation)",
            "iPad6,12": "iPad (5th generation)",
            "iPad7,1": "iPad Pro 12.9-inch",
            "iPad7,2": "iPad Pro 12.9-inch",
            "iPad7,3": "iPad Pro 10.5-inch",
            "iPad7,4": "iPad Pro 10.5-inch",
            "iPad7,5": "iPad (6th generation)",
            "iPad7,6": "iPad (6th generation)",
            "iPad7,11": "iPad (7th generation)",
            "iPad7,12": "iPad (7th generation)",
            "iPad8,1": "iPad Pro 11-inch (3rd generation)",
            "iPad8,2": "iPad Pro 11-inch (3rd generation)",
            "iPad8,3": "iPad Pro 11-inch (3rd generation)",
            "iPad8,4": "iPad Pro 11-inch (3rd generation)",
            "iPad8,5": "iPad Pro 12.9-inch (3rd generation)",
            "iPad8,6": "iPad Pro 12.9-inch (3rd generation)",
            "iPad8,7": "iPad Pro 12.9-inch (3rd generation)",
            "iPad8,8": "iPad Pro 12.9-inch (3rd generation)",
            "iPad8,9": "iPad Pro 11-inch (4th generation)",
            "iPad8,10": "iPad Pro 11-inch (4th generation)",
            "iPad8,11": "iPad Pro 12.9-inch (4th generation)",
            "iPad8,12": "iPad Pro 12.9-inch (4th generation)",
            "iPad11,1": "iPad Mini 5",
            "iPad11,2": "iPad Mini 5",
            "iPad11,3": "iPad Air 3rd Gen (WiFi)",
            "iPad11,4": "iPad Air (3rd generation)",
            "iPad11,6": "iPad Air (3rd generation)",
            "iPad11,7": "iPad (8th generation)",
            "iPad12,1": "iPad (9th generation)",
            "iPad12,2": "iPad (9th generation)",
            "iPad14,1": "iPad Mini (6th generation)",
            "iPad14,2": "iPad Mini (6th generation)",
            "iPad13,1": "iPad Air (4th generation)",
            "iPad13,2": "iPad Air (4th generation)",
            "iPad13,4": "iPad Pro 11-inch (5th generation)",
            "iPad13,5": "iPad Pro 11-inch (5th generation)",
            "iPad13,6": "iPad Pro 11-inch (5th generation)",
            "iPad13,7": "iPad Pro 11-inch (5th generation)",
            "iPad13,8": "iPad Pro 12.9-inch (5th generation)",
            "iPad13,9": "iPad Pro 11-inch (5th generation)",
            "iPad13,10": "iPad Pro 11-inch (5th generation)",
            "iPad13,11": "iPad Pro 11-inch (5th generation)",
            "iPad13,16": "iPad Air (5th generation)",
            "iPad13,17": "iPad Air (5th generation)",
            "iPad13,18": "iPad (10th generation)",
            "iPad13,19": "iPad (10th generation)",
            "iPad14,3": "iPad Pro 11-inch (4th generation)",
            "iPad14,4": "iPad Pro 11-inch (4th generation)",
            "iPad14,5": "iPad Pro 12.9-inch (6th generation)",
            "iPad14,6": "iPad Pro 12.9-inch (6th generation)",
            "iPad14,8": "iPad Air (6th generation)",
            "iPad14,9": "iPad Air (6th generation)",
            "iPad14,10": "iPad Air (7th generation)",
            "iPad14,11": "iPad Air (7th generation)",
            "iPad16,3": "iPad Pro 11-inch (5th generation)",
            "iPad16,4": "iPad Pro 11-inch (5th generation)",
            "iPad16,5": "iPad Pro 12.9-inch (7th generation)",
            "iPad16,6": "iPad Pro 12.9-inch (7th generation)",

            "AppleTV2,1": "Apple TV", // Apple TV (2nd Generation)
            "AppleTV3,1": "Apple TV", // Apple TV (3rd Generation)
            "AppleTV3,2": "Apple TV", // Apple TV (3rd Generation - Rev A)
            "AppleTV5,3": "Apple TV", // Apple TV (4th Generation)
            "AppleTV6,2": "Apple TV 4K", // Apple TV 4K

            "RealityDevice14,1": "Apple Vision Pro" // Apple Vision Pro
        ]
    }
}
