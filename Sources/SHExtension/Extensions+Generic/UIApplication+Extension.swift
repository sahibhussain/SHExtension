//
//  UIApplication+Extension.swift
//  SahibExtension
//
//  Created by Sahib Hussain on 16/03/22.
//

import UIKit

extension UIApplication {
    
    static var fullWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    static var fullHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    
    public var topVC: UIViewController? {
        return topViewController(rootVC)
    }
    
    public var rootVC: UIViewController? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return nil }
        return windowScene.windows.first?.rootViewController
    }
    
    private func topViewController(_ base: UIViewController?) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
    
    public func showAlert(_ msg: String,
                          title: String = "",
                          actionText: String? = nil,
                          cancelText: String = "OK",
                          action: (() -> Void)? = nil,
                          cancelAction: (() -> Void)? = nil)
    {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: cancelText, style: .cancel, handler: { action in
            cancelAction?()
        }))
        if let actionText = actionText {
            alert.addAction(UIAlertAction(title: actionText, style: .default, handler: { act in
                action?()
            }))
        }
        topVC?.present(alert, animated: true)
    }
    
}
