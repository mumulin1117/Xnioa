//
//  XioResilienceAnchorXio.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/26.
//

import UIKit

class XioResilienceAnchorXio: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        XioRegisterKeyboardSignalsXio()
    }

    private func XioRegisterKeyboardSignalsXio() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(XioAdjustForKeyboardXio), name: UIResponder.keyboardWillShowNotification, object: nil)
      
        NotificationCenter.default.addObserver(self, selector: #selector(XioAdjustForKeyboardXio), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func XioAdjustForKeyboardXio(notification: Notification) {
        guard let XioInfoXio = notification.userInfo else { return }
        
      
        let XioFrameXio = (XioInfoXio[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? .zero
        let XioDurationXio = (XioInfoXio[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double) ?? 0.25
        
        if notification.name == UIResponder.keyboardWillShowNotification {
         
            if let XioActiveTerminalXio = view.XioFindActiveResponderXio() {
                let XioGlobalFrameXio = XioActiveTerminalXio.convert(XioActiveTerminalXio.bounds, to: self.view)
                let XioOverlapXio = XioGlobalFrameXio.maxY - (self.view.frame.height - XioFrameXio.height)
                
               
                if XioOverlapXio > -20 {
                    UIView.animate(withDuration: XioDurationXio) {
                        self.view.transform = CGAffineTransform(translationX: 0, y: -(XioOverlapXio + 20))
                    }
                }
            }
        } else {
         
            UIView.animate(withDuration: XioDurationXio) {
                self.view.transform = .identity
            }
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}


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
