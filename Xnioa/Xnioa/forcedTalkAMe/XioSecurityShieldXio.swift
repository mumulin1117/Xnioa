//
//  XioSecurityShieldXio.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/24.
//

import UIKit

class XioSecurityShieldXio: UIView {
    
    private let XioDimmerBackdropXio = UIView()
    private let XioSheetVesselXio = UIView()
    private let XioStatusIconXio = UIImageView()
    private let XioPromptTitleXio = UILabel()
    private let XioPromptBodyXio = UILabel()
    private let XioNegateTriggerXio = UIButton()
    private let XioConfirmTriggerXio = UIButton()
    
    private let XioWidthScaleXio = UIScreen.main.bounds.width / 375
    private let XioHeightScaleXio = UIScreen.main.bounds.height / 812
    private let XioWidthRatioXio = UIScreen.main.bounds.width / 375
    private let XioHeightRatioXio = UIScreen.main.bounds.height / 812

    var XioOnConfirmationXio: (() -> Void)?

    enum XioSafetyModeXio {
        case XioAbandonSessionXio
        case XioEraseIdentityXio
    }

    init(XioFrameXio: CGRect, XioModeXio: XioSafetyModeXio) {
        super.init(frame: XioFrameXio)
        XioAssembleShieldXio(XioModeXio)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func XioAssembleShieldXio(_ XioModeXio: XioSafetyModeXio) {
        XioDimmerBackdropXio.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        XioDimmerBackdropXio.frame = self.bounds
        addSubview(XioDimmerBackdropXio)
        
        XioSheetVesselXio.backgroundColor = UIColor(white: 0.15, alpha: 1.0)
        XioSheetVesselXio.layer.cornerRadius = 30 * XioWidthScaleXio
        XioSheetVesselXio.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        [XioSheetVesselXio, XioStatusIconXio, XioPromptTitleXio, XioPromptBodyXio, XioNegateTriggerXio, XioConfirmTriggerXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            if $0 != XioSheetVesselXio { XioSheetVesselXio.addSubview($0) } else { addSubview($0) }
        }
        
        XioNegateTriggerXio.setTitle(XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMfFUbgoHx40DsaAgCZF1Ibr3lQ=="), for: .normal)
        XioNegateTriggerXio.backgroundColor = UIColor(white: 0.25, alpha: 1.0)
        XioNegateTriggerXio.layer.cornerRadius = 12 * XioWidthScaleXio
        XioNegateTriggerXio.addTarget(self, action: #selector(XioDismissShieldXio), for: .touchUpInside)
        
        XioPromptTitleXio.font = .systemFont(ofSize: 22 * XioWidthScaleXio, weight: .bold)
        XioPromptTitleXio.textColor = .white
        
        XioPromptBodyXio.numberOfLines = 0
        XioPromptBodyXio.textColor = .lightGray
        XioPromptBodyXio.font = .systemFont(ofSize: 15 * XioWidthScaleXio)
        XioPromptBodyXio.textAlignment = .left
        
        if XioModeXio == .XioAbandonSessionXio {
            XioStatusIconXio.image = UIImage(named: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMUWsjoliD4tZGUgx38Of3VLCGwkGSyDyOWc="))
            XioStatusIconXio.tintColor = .systemOrange
            XioPromptTitleXio.text = XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMaaLgkOTBjI6xGNfWmO40tA=")
            XioPromptBodyXio.text = XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMXj2Yf8CRsz+Lj8KRlhDo+c4QEmwBo2jBdJE/nzny7dNoYcxxycY4uIe76C+m1zQSOKQrVJjErGkH8qZgJfzXGmyiYJ8gjD4/YKT8wu76/PzkGBlfg==")
            XioConfirmTriggerXio.setTitle(XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMV6OO/NXn1EDaRvyV3Hr+w=="), for: .normal)
            XioConfirmTriggerXio.backgroundColor = .systemOrange
        } else {
            XioStatusIconXio.image = UIImage(named: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMQHUR87OcbpGU6GnpYH32QvF5esqWIuQ5w==")) // Use asset "XioBrokenHeartAssetXio"
            XioStatusIconXio.tintColor = .systemRed
            XioPromptTitleXio.text = XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMTvXU/MMUnyepfn1JLvFfM33fRGL88i75V9wfSk=")
            XioPromptBodyXio.text = XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMX/sq3QsFdH8l5OavtFNKhTTOgCYQcSZRSr8G+f0mpS/md8r3NJd5f+rA0RrdGIAQhj7COj8GLabyzW940MvUJyX2Ue2AURf/MWVO/j7Qq3TY4BKZujvFLM8V4GTW2p32mQXt6E0rKjRO5hALEQwOgC4Sw4JlUOSnzBVHIvMOsMaH53INA4cLdiHdYwGatA3myNNk4vl")
            XioConfirmTriggerXio.setTitle(XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMduJGhv3otsfUAvVweO64vBLMg=="), for: .normal)
            XioConfirmTriggerXio.backgroundColor = .systemRed
        }
        
        XioConfirmTriggerXio.layer.cornerRadius = 12 * XioWidthScaleXio
        XioConfirmTriggerXio.addTarget(self, action: #selector(XioTriggerActionXio), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            XioSheetVesselXio.leadingAnchor.constraint(equalTo: leadingAnchor),
            XioSheetVesselXio.trailingAnchor.constraint(equalTo: trailingAnchor),
            XioSheetVesselXio.bottomAnchor.constraint(equalTo: bottomAnchor),
            XioSheetVesselXio.heightAnchor.constraint(equalToConstant: 380 * XioHeightScaleXio),
            
            XioStatusIconXio.topAnchor.constraint(equalTo: XioSheetVesselXio.topAnchor, constant: 40 * XioHeightScaleXio),
            XioStatusIconXio.leadingAnchor.constraint(equalTo: XioSheetVesselXio.leadingAnchor, constant: 25 * XioWidthScaleXio),
            XioStatusIconXio.widthAnchor.constraint(equalToConstant: 60 * XioWidthScaleXio),
            XioStatusIconXio.heightAnchor.constraint(equalToConstant: 60 * XioWidthScaleXio),
            
            XioPromptTitleXio.topAnchor.constraint(equalTo: XioStatusIconXio.bottomAnchor, constant: 20 * XioHeightScaleXio),
            XioPromptTitleXio.leadingAnchor.constraint(equalTo: XioStatusIconXio.leadingAnchor),
            
            XioPromptBodyXio.topAnchor.constraint(equalTo: XioPromptTitleXio.bottomAnchor, constant: 12 * XioHeightScaleXio),
            XioPromptBodyXio.leadingAnchor.constraint(equalTo: XioStatusIconXio.leadingAnchor),
            XioPromptBodyXio.trailingAnchor.constraint(equalTo: XioSheetVesselXio.trailingAnchor, constant: -25 * XioWidthScaleXio),
            
            XioNegateTriggerXio.leadingAnchor.constraint(equalTo: XioStatusIconXio.leadingAnchor),
            XioNegateTriggerXio.bottomAnchor.constraint(equalTo: XioSheetVesselXio.bottomAnchor, constant: -50 * XioHeightScaleXio),
            XioNegateTriggerXio.widthAnchor.constraint(equalToConstant: 155 * XioWidthScaleXio),
            XioNegateTriggerXio.heightAnchor.constraint(equalToConstant: 55 * XioHeightRatioXio),
            
            XioConfirmTriggerXio.trailingAnchor.constraint(equalTo: XioPromptBodyXio.trailingAnchor),
            XioConfirmTriggerXio.bottomAnchor.constraint(equalTo: XioNegateTriggerXio.bottomAnchor),
            XioConfirmTriggerXio.widthAnchor.constraint(equalToConstant: 155 * XioWidthScaleXio),
            XioConfirmTriggerXio.heightAnchor.constraint(equalToConstant: 55 * XioHeightRatioXio)
        ])
    }
    
    @objc private func XioDismissShieldXio() {
        UIView.animate(withDuration: 0.3, animations: {
            self.XioSheetVesselXio.transform = CGAffineTransform(translationX: 0, y: 400)
            self.alpha = 0
        }) { _ in
            self.removeFromSuperview()
        }
    }
    
    @objc private func XioTriggerActionXio() {
        XioOnConfirmationXio?()
        XioDismissShieldXio()
    }
    
    func XioPresentInStageXio(_ XioTargetXio: UIView) {
        XioTargetXio.addSubview(self)
        XioSheetVesselXio.transform = CGAffineTransform(translationX: 0, y: 400)
        UIView.animate(withDuration: 0.3) {
            self.XioSheetVesselXio.transform = .identity
        }
    }
}
