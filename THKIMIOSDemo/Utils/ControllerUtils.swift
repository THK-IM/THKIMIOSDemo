
//
//  ControllerUtils.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import UIKit

class ControllerUtils {
    
    static func getTopViewController(base: UIViewController? = UIApplication.shared.windows.first?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            // 如果是导航控制器，则递归获取顶部的 ViewController
            return getTopViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            // 如果是标签控制器，则递归获取选中的 ViewController
            return getTopViewController(base: tab.selectedViewController)
        }
        if let presented = base?.presentedViewController {
            // 如果有模态弹出的 ViewController，则递归获取
            return getTopViewController(base: presented)
        }
        // 如果没有其他控制器，直接返回当前控制器
        return base
    }
}
