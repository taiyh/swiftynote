//
//  CodeComments.swift
//  SwiftyNote
//
//  Created by taiyh on 2025/1/8.
//

import Foundation

/// 类描述
/// - Version: 1.0
/// - Authors: Wei You, Fang Wang:
/// - Copyright: kkk
/// - Date: 2024-11-12
/// - Since: 2021-01-31
/// - Attention: 注意
/// - Note: 备注
/// - Remark: 备注
/// - warning: 警告，会被标红
/// - Bug: 这个方法有bug
/// - Experiment : 试验点新玩法
/// - Precondition: 前置条件
/// - Postcondition: 后置条件
/// - Requires: 必须条件
/// - Invariant: 不变条件
/// - Test
///
class CodeComments: NSObject {
    
    // MARK: 添加MARK标记
    // TODO: 添加待办提示
    // FIXME: 添加修复提示
    
    
    // MARK: 使用函数注释
    
    /// 求两个Int变量的和
    /// - Parameters:
    ///   - a: 加数
    ///   - b: 被加数
    /// - Returns: 和
    /// - Throws: 抛出错误
    /// - Version: 1.0
    /// - Authors: Wei You, Fang Wang:
    /// - Copyright: kkk
    /// - Date: 2024-11-12
    /// - Since: 2021-01-31
    /// - Attention: 注意
    /// - Note: 备注
    /// - Remark: 备注
    /// - warning: 警告，会被标红
    /// - Bug: 这个方法有bug
    /// - Experiment : 试验点新玩法
    /// - Precondition: 前置条件
    /// - Postcondition: 后置条件
    /// - Requires: 必须条件
    /// - Invariant: 不变条件
    /// - Custom: 自定义
    func add(a: Int, b: Int) throws -> Int {
        return a + b
    }
}

class CodeCommentsDemo: NSObject {
    func addDemo() {
        let codeComments = CodeComments()
        let result = try! codeComments.add(a: 1, b: 2)
        print(result)
    }
}
