//
//  APIAvailability.swift
//  Swiftynote
//
//  Created by taiyh on 2025/1/8.
//

import Foundation

/// 项目不会编译此文件，可以忽略报红
@available(iOS 2.0, *)
class APIAvailability: NSObject {
    
    // MARK: 使用@available
    /// https://www.hackingwithswift.com/example-code/language/how-to-use-available-to-deprecate-old-apis

    @available(*, unavailable, renamed: "abc")
    func def() { }
    
    @available(*, deprecated, message: "Parse your data by hand instead")
    func parseData() { }
    
    @available(*, deprecated, renamed: "loadData")
    func fetchData() { }
    
    @available(swift, obsoleted: 4.1, renamed: "attemptConnection")
    func testConnection() { }
    
    @available(swift, deprecated: 4.0, obsoleted: 7.0, message: "This will be removed in v7.0; please migrate to a different API.")
    func loadData() { }
    
    @available(swift, introduced: 4.2)
    func loadUsers() { }
    
    func chooseBestColor() -> String {
        guard #available(iOS 13.0, macOS 11.0, *) else {
           return "gray"
        }
        return "red"
    }
}


class APIAvailabilityDemo: NSObject {
    func addDemo() {
        let availability = APIAvailability()

        availability.def()

        availability.parseData()
        
        availability.fetchData()
        
        availability.testConnection()
        
        availability.loadData()
        
        availability.loadUsers()
    }
}
