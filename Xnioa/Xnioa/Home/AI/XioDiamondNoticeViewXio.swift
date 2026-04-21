//
//  XioDiamondNoticeViewXio.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/25.
//

import UIKit

class XioDiamondNoticeViewXio: UIView {
    
    private let XioPanelXio = UIView()
    private let XioVisualIconXio = UIImageView()
    private let XioMessageLabelXio = UILabel()
    private let XioPrimaryActionXio = UIButton()
    private let XioDismissXio = UIButton()
    
    private var XioActionCallbackXio: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        XioBuildPopupStructureXio()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func XioBuildPopupStructureXio() {
        backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        XioPanelXio.backgroundColor = .clear//UIColor(white: 0.95, alpha: 1.0)
        XioPanelXio.layer.cornerRadius = 24
        XioPanelXio.translatesAutoresizingMaskIntoConstraints = false
        addSubview(XioPanelXio)
        
        XioVisualIconXio.image = UIImage(named: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMdUsvEus22I92oPwUOO9cMDb7RTz")) // Use your diamond crown asset
        XioVisualIconXio.contentMode = .scaleAspectFit
        XioVisualIconXio.translatesAutoresizingMaskIntoConstraints = false
        XioPanelXio.addSubview(XioVisualIconXio)
        
        XioMessageLabelXio.numberOfLines = 0
        XioMessageLabelXio.textAlignment = .center
        XioMessageLabelXio.textColor = .darkGray
        XioMessageLabelXio.font = .systemFont(ofSize: 18, weight: .medium)
        XioMessageLabelXio.translatesAutoresizingMaskIntoConstraints = false
        XioPanelXio.addSubview(XioMessageLabelXio)
        
        XioPrimaryActionXio.layer.cornerRadius = 20
        XioPrimaryActionXio.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        XioPrimaryActionXio.translatesAutoresizingMaskIntoConstraints = false
        XioPrimaryActionXio.addTarget(self, action: #selector(XioHandleMainClickXio), for: .touchUpInside)
        XioPanelXio.addSubview(XioPrimaryActionXio)
        
        XioDismissXio.setImage(UIImage(systemName: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMVW4PbLGkgeroBUuM+A/mBsLjcs33wMfJ6k=")), for: .normal)
        XioDismissXio.tintColor = .white
        XioDismissXio.translatesAutoresizingMaskIntoConstraints = false
        XioDismissXio.addTarget(self, action: #selector(XioRemoveSelfXio), for: .touchUpInside)
        addSubview(XioDismissXio)
        
        NSLayoutConstraint.activate([
            XioPanelXio.centerXAnchor.constraint(equalTo: centerXAnchor),
            XioPanelXio.centerYAnchor.constraint(equalTo: centerYAnchor),
            XioPanelXio.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            
            XioVisualIconXio.topAnchor.constraint(equalTo: XioPanelXio.topAnchor, constant: -50),
            XioVisualIconXio.leadingAnchor.constraint(equalTo: XioPanelXio.leadingAnchor),
            XioVisualIconXio.trailingAnchor.constraint(equalTo: XioPanelXio.trailingAnchor),
            XioVisualIconXio.bottomAnchor.constraint(equalTo: XioPanelXio.bottomAnchor),
            
            
            XioPrimaryActionXio.topAnchor.constraint(equalTo: XioMessageLabelXio.bottomAnchor, constant: 30),
            XioPrimaryActionXio.centerXAnchor.constraint(equalTo: XioPanelXio.centerXAnchor),
            XioPrimaryActionXio.widthAnchor.constraint(equalTo: XioPanelXio.widthAnchor, multiplier: 0.8),
            XioPrimaryActionXio.heightAnchor.constraint(equalToConstant: 50),
            XioPrimaryActionXio.bottomAnchor.constraint(equalTo: XioPanelXio.bottomAnchor, constant: -25),
            
            
            XioMessageLabelXio.bottomAnchor.constraint(equalTo: XioPrimaryActionXio.topAnchor, constant: -20),
            XioMessageLabelXio.leadingAnchor.constraint(equalTo: XioPanelXio.leadingAnchor, constant: 20),
            XioMessageLabelXio.trailingAnchor.constraint(equalTo: XioPanelXio.trailingAnchor, constant: -20),
           
            
            
            XioDismissXio.topAnchor.constraint(equalTo: XioPanelXio.bottomAnchor, constant: 20),
            XioDismissXio.centerXAnchor.constraint(equalTo: centerXAnchor),
            XioDismissXio.widthAnchor.constraint(equalToConstant: 44),
            XioDismissXio.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func XioConfigureAsConfirmXio(cost: Int, action: @escaping () -> Void) {
        XioMessageLabelXio.text = XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMaILQPt0D/r/SZDMoZ9ZWBT/cHOLsixhDEKows1Ry1JISvgUt+ycWg==") + String(cost) + XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMUvlBJf7RtkQPz3KCUtQW8DYmW7aYqtwO4LdG9/acqE=")
        XioPrimaryActionXio.setBackgroundImage(UIImage.init(named: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMRw4nnRKLvD+uKzzB9KTf0mY+A==")), for: .normal)
        XioActionCallbackXio = action
    }
    
    func XioConfigureAsInsufficientXio(action: @escaping () -> Void) {
        XioMessageLabelXio.text = XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMash+iOD6TzwIWJPVhqwjEVxoYoCLiBu+JqMHJrI3aHPFK8hN9GMVDQ326c2rpJEQAta45s6KJJPMg==")
        XioPrimaryActionXio.setBackgroundImage(UIImage.init(named: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMYsk4clkxW8bwiTfr7iIs0D7C1d3")), for: .normal)
        XioActionCallbackXio = action
    }
    
    @objc private func XioHandleMainClickXio() {
        XioActionCallbackXio?()
        XioRemoveSelfXio()
    }
    
    @objc private func XioRemoveSelfXio() {
        removeFromSuperview()
    }
}
