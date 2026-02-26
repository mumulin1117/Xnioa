//
//  XioVerdeoCabyllPortalXio.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/24.
//

import UIKit
//video
class XioVerdeoCabyllPortalXio: UIViewController {
    
    private let XioRemoteVibeViewXio = UIImageView()
    private let XioLocalVibeViewXio = UIImageView()
    private let XioVisualOverlayXio = UIView()
    
    private let XioHeaderRackXio = UIView()
    private let XioRetreatTriggerXio = UIButton()
    private let XioPartnerTitleXio = UILabel()
    private let XioFollowActionXio = UIButton()
    private let XioExtraServiceXio = UIButton()
    
    private let XioTerminateTriggerXio = UIButton()
    
    private let XioWidthRatioXio = UIScreen.main.bounds.width / 375
    private let XioHeightRatioXio = UIScreen.main.bounds.height / 812

    override func viewDidLoad() {
        super.viewDidLoad()
        XioPrepareStageXio()
        XioForgeArchitectureXio()
        XioInjectFakeDynamicXio()
    }
    
    private func XioPrepareStageXio() {
        view.backgroundColor = .black
        navigationController?.isNavigationBarHidden = true
    }
    
    private func XioForgeArchitectureXio() {
        XioRemoteVibeViewXio.contentMode = .scaleAspectFill
        XioRemoteVibeViewXio.image = UIImage(named: "XioRemoteUserProxyXio")
        XioRemoteVibeViewXio.backgroundColor = .darkGray
        
        XioVisualOverlayXio.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
        XioLocalVibeViewXio.contentMode = .scaleAspectFill
        XioLocalVibeViewXio.layer.cornerRadius = 12 * XioWidthRatioXio
        XioLocalVibeViewXio.clipsToBounds = true
        XioLocalVibeViewXio.layer.borderWidth = 1
        XioLocalVibeViewXio.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        XioLocalVibeViewXio.image = UIImage(named: "XioLocalUserProxyXio")
        XioLocalVibeViewXio.backgroundColor = .lightGray
        
        XioPartnerTitleXio.text = "Holt Hamlet"
        XioPartnerTitleXio.textColor = .white
        XioPartnerTitleXio.font = .systemFont(ofSize: 20 * XioWidthRatioXio, weight: .bold)
        
        XioRetreatTriggerXio.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        XioRetreatTriggerXio.tintColor = .white
        
        XioFollowActionXio.setImage(UIImage(systemName: "person.badge.plus"), for: .normal)
        XioFollowActionXio.tintColor = .white
        
        XioExtraServiceXio.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        XioExtraServiceXio.tintColor = .white
        
        XioTerminateTriggerXio.backgroundColor = UIColor(red: 1.0, green: 0.35, blue: 0.35, alpha: 1.0)
        XioTerminateTriggerXio.layer.cornerRadius = 14 * XioWidthRatioXio
        XioTerminateTriggerXio.setImage(UIImage(systemName: "phone.down.fill"), for: .normal)
        XioTerminateTriggerXio.tintColor = .white
        XioTerminateTriggerXio.addTarget(self, action: #selector(XioExecuteHangupXio), for: .touchUpInside)
        
        [XioRemoteVibeViewXio, XioVisualOverlayXio, XioHeaderRackXio, XioLocalVibeViewXio, XioTerminateTriggerXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        [XioRetreatTriggerXio, XioPartnerTitleXio, XioFollowActionXio, XioExtraServiceXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioHeaderRackXio.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            XioRemoteVibeViewXio.topAnchor.constraint(equalTo: view.topAnchor),
            XioRemoteVibeViewXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioRemoteVibeViewXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioRemoteVibeViewXio.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            XioVisualOverlayXio.topAnchor.constraint(equalTo: view.topAnchor),
            XioVisualOverlayXio.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            XioVisualOverlayXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioVisualOverlayXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            XioHeaderRackXio.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10 * XioHeightRatioXio),
            XioHeaderRackXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioHeaderRackXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioHeaderRackXio.heightAnchor.constraint(equalToConstant: 50 * XioHeightRatioXio),
            
            XioRetreatTriggerXio.leadingAnchor.constraint(equalTo: XioHeaderRackXio.leadingAnchor, constant: 20 * XioWidthRatioXio),
            XioRetreatTriggerXio.centerYAnchor.constraint(equalTo: XioHeaderRackXio.centerYAnchor),
            
            XioPartnerTitleXio.leadingAnchor.constraint(equalTo: XioRetreatTriggerXio.trailingAnchor, constant: 15 * XioWidthRatioXio),
            XioPartnerTitleXio.centerYAnchor.constraint(equalTo: XioHeaderRackXio.centerYAnchor),
            
            XioFollowActionXio.leadingAnchor.constraint(equalTo: XioPartnerTitleXio.trailingAnchor, constant: 8 * XioWidthRatioXio),
            XioFollowActionXio.centerYAnchor.constraint(equalTo: XioHeaderRackXio.centerYAnchor),
            
            XioExtraServiceXio.trailingAnchor.constraint(equalTo: XioHeaderRackXio.trailingAnchor, constant: -20 * XioWidthRatioXio),
            XioExtraServiceXio.centerYAnchor.constraint(equalTo: XioHeaderRackXio.centerYAnchor),
            
            XioLocalVibeViewXio.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * XioWidthRatioXio),
            XioLocalVibeViewXio.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 60 * XioHeightRatioXio),
            XioLocalVibeViewXio.widthAnchor.constraint(equalToConstant: 100 * XioWidthRatioXio),
            XioLocalVibeViewXio.heightAnchor.constraint(equalToConstant: 150 * XioHeightRatioXio),
            
            XioTerminateTriggerXio.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50 * XioHeightRatioXio),
            XioTerminateTriggerXio.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            XioTerminateTriggerXio.widthAnchor.constraint(equalToConstant: 80 * XioWidthRatioXio),
            XioTerminateTriggerXio.heightAnchor.constraint(equalToConstant: 65 * XioHeightRatioXio)
        ])
    }
    
    private func XioInjectFakeDynamicXio() {
        XioLocalVibeViewXio.alpha = 0
        UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseIn) {
            self.XioLocalVibeViewXio.alpha = 1.0
        }
    }
    
    @objc private func XioExecuteHangupXio() {
        let XioAlertXio = UIAlertController(title: "Call Ended", message: "The video session has finished.", preferredStyle: .alert)
        XioAlertXio.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { _ in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(XioAlertXio, animated: true)
    }
}
