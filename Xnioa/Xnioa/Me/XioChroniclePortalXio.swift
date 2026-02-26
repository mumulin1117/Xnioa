//
//  XioChroniclePortalXio.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/24.
//

import UIKit
//about us
class XioChroniclePortalXio: UIViewController {
    
    private let XioNavigationDockXio = UIView()
    private let XioRetreatTriggerXio = UIButton()
    private let XioPortalTitleXio = UILabel()
    
    private let XioBrandHaloXio = UIImageView()
    private let XioBrandNameTagXio = UILabel()
    private let XioEditionTagXio = UILabel()
    
    private let XioWidthRatioXio = UIScreen.main.bounds.width / 375
    private let XioHeightRatioXio = UIScreen.main.bounds.height / 812

    override func viewDidLoad() {
        super.viewDidLoad()
        XioPrepareCanvasXio()
        XioForgeStructureXio()
        XioApplyPulseEffectXio()
    }
    
    private func XioPrepareCanvasXio() {
        view.backgroundColor = UIColor(white: 0.05, alpha: 1.0)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func XioForgeStructureXio() {
        XioRetreatTriggerXio.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        XioRetreatTriggerXio.tintColor = .white
        XioRetreatTriggerXio.addTarget(self, action: #selector(XioPerformRetreatXio), for: .touchUpInside)
        
        XioPortalTitleXio.text = "About us"
        XioPortalTitleXio.textColor = .white
        XioPortalTitleXio.font = .systemFont(ofSize: 20 * XioWidthRatioXio, weight: .bold)
        
        XioBrandHaloXio.image = UIImage(named: "XioAppLogoAssetXio")
        XioBrandHaloXio.contentMode = .scaleAspectFit
        XioBrandHaloXio.layer.cornerRadius = 45 * XioWidthRatioXio
        XioBrandHaloXio.clipsToBounds = true
        XioBrandHaloXio.backgroundColor = .systemIndigo // Placeholder color for the glow effect
        
        XioBrandNameTagXio.text = "------"
        XioBrandNameTagXio.textColor = .white
        XioBrandNameTagXio.font = .systemFont(ofSize: 24 * XioWidthRatioXio, weight: .black)
        XioBrandNameTagXio.textAlignment = .center
        
        XioEditionTagXio.text = "Version 1.0.0"
        XioEditionTagXio.textColor = .gray
        XioEditionTagXio.font = .systemFont(ofSize: 14 * XioWidthRatioXio)
        XioEditionTagXio.textAlignment = .center
        
        [XioNavigationDockXio, XioBrandHaloXio, XioBrandNameTagXio, XioEditionTagXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        [XioRetreatTriggerXio, XioPortalTitleXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioNavigationDockXio.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            XioNavigationDockXio.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            XioNavigationDockXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioNavigationDockXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioNavigationDockXio.heightAnchor.constraint(equalToConstant: 50 * XioHeightRatioXio),
            
            XioRetreatTriggerXio.leadingAnchor.constraint(equalTo: XioNavigationDockXio.leadingAnchor, constant: 20 * XioWidthRatioXio),
            XioRetreatTriggerXio.centerYAnchor.constraint(equalTo: XioNavigationDockXio.centerYAnchor),
            
            XioPortalTitleXio.leadingAnchor.constraint(equalTo: XioRetreatTriggerXio.trailingAnchor, constant: 15 * XioWidthRatioXio),
            XioPortalTitleXio.centerYAnchor.constraint(equalTo: XioNavigationDockXio.centerYAnchor),
            
            XioBrandHaloXio.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            XioBrandHaloXio.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80 * XioHeightRatioXio),
            XioBrandHaloXio.widthAnchor.constraint(equalToConstant: 90 * XioWidthRatioXio),
            XioBrandHaloXio.heightAnchor.constraint(equalToConstant: 90 * XioWidthRatioXio),
            
            XioBrandNameTagXio.topAnchor.constraint(equalTo: XioBrandHaloXio.bottomAnchor, constant: 20 * XioHeightRatioXio),
            XioBrandNameTagXio.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            XioEditionTagXio.topAnchor.constraint(equalTo: XioBrandNameTagXio.bottomAnchor, constant: 10 * XioHeightRatioXio),
            XioEditionTagXio.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func XioApplyPulseEffectXio() {
        let XioPulseXio = CABasicAnimation(keyPath: "transform.scale")
        XioPulseXio.duration = 2.0
        XioPulseXio.fromValue = 0.95
        XioPulseXio.toValue = 1.05
        XioPulseXio.autoreverses = true
        XioPulseXio.repeatCount = .infinity
        XioBrandHaloXio.layer.add(XioPulseXio, forKey: "XioLogoPulseXio")
    }
    
    @objc private func XioPerformRetreatXio() {
        navigationController?.popViewController(animated: true)
    }
}
