//
//  XioResilienceAnchorXio.swift
//  Xnioa
//
//  Created by mumu on 2026/2/26.
//

import UIKit

class XioResilienceAnchorXio: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        XioRegisterKeyboardSignalsXio()
    }

    private func XioRegisterKeyboardSignalsXio() {
        // 注册键盘弹出信号
        NotificationCenter.default.addObserver(self, selector: #selector(XioAdjustForKeyboardXio), name: UIResponder.keyboardWillShowNotification, object: nil)
        // 注册键盘收起信号
        NotificationCenter.default.addObserver(self, selector: #selector(XioAdjustForKeyboardXio), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func XioAdjustForKeyboardXio(notification: Notification) {
        guard let XioInfoXio = notification.userInfo else { return }
        
        // 获取键盘终点坐标
        let XioFrameXio = (XioInfoXio[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? .zero
        let XioDurationXio = (XioInfoXio[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double) ?? 0.25
        
        if notification.name == UIResponder.keyboardWillShowNotification {
            // 获取当前获得焦点的输入框
            if let XioActiveTerminalXio = view.XioFindActiveResponderXio() {
                let XioGlobalFrameXio = XioActiveTerminalXio.convert(XioActiveTerminalXio.bounds, to: self.view)
                let XioOverlapXio = XioGlobalFrameXio.maxY - (self.view.frame.height - XioFrameXio.height)
                
                // 如果遮挡，则上移
                if XioOverlapXio > -20 {
                    UIView.animate(withDuration: XioDurationXio) {
                        self.view.transform = CGAffineTransform(translationX: 0, y: -(XioOverlapXio + 20))
                    }
                }
            }
        } else {
            // 恢复原位
            UIView.animate(withDuration: XioDurationXio) {
                self.view.transform = .identity
            }
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - 辅助扩展 (xio后缀)
extension UIView {
    func XioFindActiveResponderXio() -> UIView? {
        if isFirstResponder { return self }
        for XioSubXio in subviews {
            if let XioFoundXio = XioSubXio.XioFindActiveResponderXio() {
                return XioFoundXio
            }
        }
        return nil
    }
}
