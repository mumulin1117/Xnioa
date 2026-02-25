//
//  XioDiamondNoticeViewXio.swift
//  Xnioa
//
//  Created by mumu on 2026/2/25.
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
        
        XioVisualIconXio.image = UIImage(named: "dimonedfFell") // Use your diamond crown asset
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
        
        XioDismissXio.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
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
        XioMessageLabelXio.text = "Are you sure you wish to spend \(cost) diamonds to create it?"
        XioPrimaryActionXio.setBackgroundImage(UIImage.init(named: "yesdokajgu"), for: .normal)
        XioActionCallbackXio = action
    }
    
    func XioConfigureAsInsufficientXio(action: @escaping () -> Void) {
        XioMessageLabelXio.text = "You don't have enough coins, please recharge now."
        XioPrimaryActionXio.setBackgroundImage(UIImage.init(named: "rechaigeinGd"), for: .normal)
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
