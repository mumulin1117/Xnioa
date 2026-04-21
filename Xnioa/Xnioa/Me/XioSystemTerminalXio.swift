//
//  XioSystemTerminalXio.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/24.
//

import UIKit

class XioSystemTerminalXio: UIViewController {
    
    private let XioTerminalScrollXio = UIScrollView()
    private let XioMasterRackXio = UIView()
    
    private let XioNavigationHeaderXio = UIView()
    private let XioBackTriggerXio = UIButton()
    private let XioTitleTagXio = UILabel()
    
    private let XioWalletBadgeXio = UIView()
    private let XioWalletTitleXio = UILabel()
    private let XioDiamondIconXio = UIImageView()
    private let XioBalanceTagXio = UILabel()
    
    private let XioMenuStackXio = UIStackView()
    
    private let XioExitTriggerXio = UIButton()
    private let XioObliterateTriggerXio = UIButton()
    
    private let XioWidthRatioXio = UIScreen.main.bounds.width / 375
    private let XioHeightRatioXio = UIScreen.main.bounds.height / 812

    override func viewDidLoad() {
        super.viewDidLoad()
        XioInitialBaseXio()
        XioForgeLayoutXio()
        XioLoadLocalVibeXio()
    }
    
    private func XioInitialBaseXio() {
        view.backgroundColor = UIColor(white: 0.05, alpha: 1.0)
        XioTerminalScrollXio.contentInsetAdjustmentBehavior = .never
    }
    
    private func XioForgeLayoutXio() {
        XioTerminalScrollXio.translatesAutoresizingMaskIntoConstraints = false
        XioMasterRackXio.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(XioTerminalScrollXio)
        XioTerminalScrollXio.addSubview(XioMasterRackXio)
        
        XioBackTriggerXio.setImage(UIImage(systemName: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMRNU2VqsS4ICI/AhX/QUQxNb6vuv")), for: .normal)
        XioBackTriggerXio.tintColor = .white
        XioBackTriggerXio.addTarget(self, action: #selector(XioPerformRetreatXio), for: .touchUpInside)
        
        XioTitleTagXio.text = XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMawfpy5Q4jbZp9nua/0jGw==")
        XioTitleTagXio.textColor = .white
        XioTitleTagXio.font = .systemFont(ofSize: 20 * XioWidthRatioXio, weight: .bold)
        
        XioWalletBadgeXio.layer.cornerRadius = 12 * XioWidthRatioXio
        XioWalletBadgeXio.clipsToBounds = true
        let XioGradiantXio = CAGradientLayer()
        XioGradiantXio.frame = CGRect(x: 0, y: 0, width: 335 * XioWidthRatioXio, height: 80 * XioHeightRatioXio)
        XioGradiantXio.colors = [UIColor.systemPurple.cgColor, UIColor.systemIndigo.cgColor]
        XioGradiantXio.startPoint = CGPoint(x: 0, y: 0.5)
        XioGradiantXio.endPoint = CGPoint(x: 1, y: 0.5)
        XioWalletBadgeXio.layer.insertSublayer(XioGradiantXio, at: 0)
        
        XioWalletTitleXio.text = XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMY488wk3KqHstBJBOADyhpTK")
        XioWalletTitleXio.textColor = .white
        XioWalletTitleXio.font = .italicSystemFont(ofSize: 20 * XioWidthRatioXio)
        
        XioDiamondIconXio.image = UIImage(systemName: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMZhobrD/WO+FErgnH00Ln2pTEMMYUHa0WLE="))
        XioDiamondIconXio.tintColor = .white
        XioBalanceTagXio.text = String(XioGovernanceHubXio.XioPrincipalXio.XioCurrentReserveXio)
        XioBalanceTagXio.textColor = .white
        XioBalanceTagXio.font = .systemFont(ofSize: 20 * XioWidthRatioXio, weight: .bold)
        
        XioMenuStackXio.axis = .vertical
        XioMenuStackXio.spacing = 12 * XioHeightRatioXio
        XioPopulateTerminalItemsXio()
        
        XioExitTriggerXio.backgroundColor = .systemOrange
        XioExitTriggerXio.setTitle(XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMWwtyHVLUVETIXOghrJT0g=="), for: .normal)
        XioExitTriggerXio.layer.cornerRadius = 10 * XioWidthRatioXio
        XioExitTriggerXio.addTarget(self, action: #selector(XioExecuteLogoutXio), for: .touchUpInside)
        
        XioObliterateTriggerXio.backgroundColor = .systemRed
        XioObliterateTriggerXio.setTitle(XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMbR5gYz5e+sp2bDbNMBir6RALJudiKw="), for: .normal)
        XioObliterateTriggerXio.layer.cornerRadius = 10 * XioWidthRatioXio
        XioObliterateTriggerXio.addTarget(self, action: #selector(XioExecuteObliterationXio), for: .touchUpInside)
        
        [XioNavigationHeaderXio, XioWalletBadgeXio, XioMenuStackXio, XioExitTriggerXio, XioObliterateTriggerXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioMasterRackXio.addSubview($0)
        }
        
        [XioBackTriggerXio, XioTitleTagXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioNavigationHeaderXio.addSubview($0)
        }
        
        [XioWalletTitleXio, XioDiamondIconXio, XioBalanceTagXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioWalletBadgeXio.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            XioTerminalScrollXio.topAnchor.constraint(equalTo: view.topAnchor),
            XioTerminalScrollXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioTerminalScrollXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioTerminalScrollXio.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            XioMasterRackXio.topAnchor.constraint(equalTo: XioTerminalScrollXio.topAnchor),
            XioMasterRackXio.widthAnchor.constraint(equalTo: XioTerminalScrollXio.widthAnchor),
            XioMasterRackXio.bottomAnchor.constraint(equalTo: XioTerminalScrollXio.bottomAnchor),
            
            XioNavigationHeaderXio.topAnchor.constraint(equalTo: XioMasterRackXio.topAnchor, constant: 50 * XioHeightRatioXio),
            XioNavigationHeaderXio.leadingAnchor.constraint(equalTo: XioMasterRackXio.leadingAnchor),
            XioNavigationHeaderXio.trailingAnchor.constraint(equalTo: XioMasterRackXio.trailingAnchor),
            XioNavigationHeaderXio.heightAnchor.constraint(equalToConstant: 44),
            
            XioBackTriggerXio.leadingAnchor.constraint(equalTo: XioNavigationHeaderXio.leadingAnchor, constant: 20 * XioWidthRatioXio),
            XioBackTriggerXio.centerYAnchor.constraint(equalTo: XioNavigationHeaderXio.centerYAnchor),
            XioTitleTagXio.leadingAnchor.constraint(equalTo: XioBackTriggerXio.trailingAnchor, constant: 15 * XioWidthRatioXio),
            XioTitleTagXio.centerYAnchor.constraint(equalTo: XioNavigationHeaderXio.centerYAnchor),
            
            XioWalletBadgeXio.topAnchor.constraint(equalTo: XioNavigationHeaderXio.bottomAnchor, constant: 20 * XioHeightRatioXio),
            XioWalletBadgeXio.leadingAnchor.constraint(equalTo: XioMasterRackXio.leadingAnchor, constant: 20 * XioWidthRatioXio),
            XioWalletBadgeXio.trailingAnchor.constraint(equalTo: XioMasterRackXio.trailingAnchor, constant: -20 * XioWidthRatioXio),
            XioWalletBadgeXio.heightAnchor.constraint(equalToConstant: 80 * XioHeightRatioXio),
            
            XioWalletTitleXio.leadingAnchor.constraint(equalTo: XioWalletBadgeXio.leadingAnchor, constant: 20),
            XioWalletTitleXio.centerYAnchor.constraint(equalTo: XioWalletBadgeXio.centerYAnchor),
            XioBalanceTagXio.trailingAnchor.constraint(equalTo: XioWalletBadgeXio.trailingAnchor, constant: -20),
            XioBalanceTagXio.centerYAnchor.constraint(equalTo: XioWalletBadgeXio.centerYAnchor),
            XioDiamondIconXio.trailingAnchor.constraint(equalTo: XioBalanceTagXio.leadingAnchor, constant: -5),
            XioDiamondIconXio.centerYAnchor.constraint(equalTo: XioWalletBadgeXio.centerYAnchor),
            
            XioMenuStackXio.topAnchor.constraint(equalTo: XioWalletBadgeXio.bottomAnchor, constant: 25 * XioHeightRatioXio),
            XioMenuStackXio.leadingAnchor.constraint(equalTo: XioMasterRackXio.leadingAnchor, constant: 20 * XioWidthRatioXio),
            XioMenuStackXio.trailingAnchor.constraint(equalTo: XioMasterRackXio.trailingAnchor, constant: -20 * XioWidthRatioXio),
            
            XioExitTriggerXio.topAnchor.constraint(equalTo: XioMenuStackXio.bottomAnchor, constant: 40 * XioHeightRatioXio),
            XioExitTriggerXio.leadingAnchor.constraint(equalTo: XioMasterRackXio.leadingAnchor, constant: 20 * XioWidthRatioXio),
            XioExitTriggerXio.trailingAnchor.constraint(equalTo: XioMasterRackXio.trailingAnchor, constant: -20 * XioWidthRatioXio),
            XioExitTriggerXio.heightAnchor.constraint(equalToConstant: 55 * XioHeightRatioXio),
            
            XioObliterateTriggerXio.topAnchor.constraint(equalTo: XioExitTriggerXio.bottomAnchor, constant: 15 * XioHeightRatioXio),
            XioObliterateTriggerXio.leadingAnchor.constraint(equalTo: XioMasterRackXio.leadingAnchor, constant: 20 * XioWidthRatioXio),
            XioObliterateTriggerXio.trailingAnchor.constraint(equalTo: XioMasterRackXio.trailingAnchor, constant: -20 * XioWidthRatioXio),
            XioObliterateTriggerXio.heightAnchor.constraint(equalToConstant: 55 * XioHeightRatioXio),
            XioObliterateTriggerXio.bottomAnchor.constraint(equalTo: XioMasterRackXio.bottomAnchor, constant: -40 * XioHeightRatioXio)
        ])
    }
    
    private func XioPopulateTerminalItemsXio() {
        let XioLabelsXio = [XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMaJJFMd5b5k4EUlvK7EmEIMXE6uyomQ="), XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMZo5yGiAwz/Un2uf8Lf4sKGEK4IbM3ubCQQ="), XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMd5850Kw2trfbrGKVM4WdPvj/5A="), XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMW1P38CAEQyujz+IwIv9SGM=")]
        for (i,XioTextXio) in XioLabelsXio.enumerated() {
            let XioItemXio = XioTerminalItemViewXio()
            XioItemXio.XioSyncTextXio(XioTextXio)
            XioItemXio.isUserInteractionEnabled = true
            XioItemXio.translatesAutoresizingMaskIntoConstraints = false
            XioItemXio.heightAnchor.constraint(equalToConstant: 60 * XioHeightRatioXio).isActive = true
            XioItemXio.tag = 1000 + i
            XioItemXio.addTarget(self, action: #selector(XiotermiNgatXio(piz:)), for: .touchUpInside)
            XioMenuStackXio.addArrangedSubview(XioItemXio)
        }
        
    }
    
    
    
    
    @objc private func XiotermiNgatXio(piz:UIButton) {
        let piao = piz.tag
        switch piao {
        case 1000:
            XioTriggerLegalFlowXio(from: self, XioCategoryXio: .XioTermsXio)
            
        case 1001:
            XioTriggerLegalFlowXio(from: self, XioCategoryXio: .XioPrivacyXio)
        case 1002:
            
            XioClearCacheTappedXio()
                    // 震动反馈
        case 1003:
            self.navigationController?.pushViewController(XioChroniclePortalXio(), animated: true)
       
        
            
        default:
            break
        }
    }
    @objc private func XioPerformRetreatXio() {
        navigationController?.popViewController(animated: true)
    }
    

    @objc private func XioClearCacheTappedXio() {
          
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            
            
            let alert = UIAlertController(
                title: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMXdHX4wttRHCCJfpB9axc1sMW2o="),
                message: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMWkkU9wI9+zbIYvfLppziGxIbUmATkgZXCNP4HzDYpJW+IQFJ8d0x3XCgC1gUIHNYKjTXiOL2BAXOOvIm/2kislQuJjjLw9P3b+Kx1t7ryLrEyM="),
                preferredStyle: .alert
            )
            
            alert.addAction(UIAlertAction(title: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMRFkSwaFjs6DwXoJZeHH"), style: .cancel))
            alert.addAction(UIAlertAction(title: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMcBqtu+gFgbacVl/NNU="), style: .destructive, handler: { _ in
               
                    let notificationGenerator = UINotificationFeedbackGenerator()
                    notificationGenerator.notificationOccurred(.success)
                
            }))
            
            present(alert, animated: true)
       
    }
    private func XioLoadLocalVibeXio() {
        XioBalanceTagXio.text = String(XioGovernanceHubXio.XioPrincipalXio.XioCurrentReserveXio)
    }
    
    @objc private func XioExecuteLogoutXio() {
        let XioPopupXio = XioSecurityShieldXio(XioFrameXio: view.bounds, XioModeXio: .XioAbandonSessionXio)
        XioPopupXio.XioOnConfirmationXio = {
            XioGovernanceHubXio.XioPrincipalXio.XioTerminateSessionXio() 
            guard let XioActiveWinXio = UIApplication.shared.connectedScenes
                    .filter({ $0.activationState == .foregroundActive })
                    .compactMap({ $0 as? UIWindowScene })
                    .first?.windows
                    .filter({ $0.isKeyWindow }).first else { return }
                
                if let XioDelegateXio = XioActiveWinXio.windowScene?.delegate as? SceneDelegate {
                    let XIOLobbyVCXIO = XioMainCoordinatorXio()
                   
                    let XIONavXIO = XioEmailAuthPortalXio()
                    XioDelegateXio.window?.rootViewController = XIONavXIO
                }
        }
        XioPopupXio.XioPresentInStageXio(view)
    }

    @objc private func XioExecuteObliterationXio() {
        let XioPopupXio = XioSecurityShieldXio(XioFrameXio: view.bounds, XioModeXio: .XioEraseIdentityXio)
        XioPopupXio.XioOnConfirmationXio = {
            XioGovernanceHubXio.XioPrincipalXio.XioTerminateSessionXio()
            guard let XioActiveWinXio = UIApplication.shared.connectedScenes
                    .filter({ $0.activationState == .foregroundActive })
                    .compactMap({ $0 as? UIWindowScene })
                    .first?.windows
                    .filter({ $0.isKeyWindow }).first else { return }
                
                if let XioDelegateXio = XioActiveWinXio.windowScene?.delegate as? SceneDelegate {
                    let XIOLobbyVCXIO = XioMainCoordinatorXio()
                   
                    let XIONavXIO = XioEmailAuthPortalXio()
                    XioDelegateXio.window?.rootViewController = XIONavXIO
                }
        }
        XioPopupXio.XioPresentInStageXio(view)
    }
}

class XioTerminalItemViewXio: UIButton {
    
    private let XioTitleLabelXio = UILabel()
    private let XioArrowIconXio = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        XioBuildXio()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func XioBuildXio() {
        self.backgroundColor = UIColor(white: 0.12, alpha: 1.0)
        self.layer.cornerRadius = 10
        
        XioTitleLabelXio.textColor = .white
        XioTitleLabelXio.font = .systemFont(ofSize: 16)
        
        XioArrowIconXio.image = UIImage(systemName: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMXJZUiFjdX7+l/MPX3XbRDuqo+mblQ=="))
        XioArrowIconXio.tintColor = .gray
        XioArrowIconXio.contentMode = .scaleAspectFit
        
        [ XioTitleLabelXio, XioArrowIconXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
           
            XioTitleLabelXio.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            XioTitleLabelXio.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            XioArrowIconXio.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            XioArrowIconXio.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            XioArrowIconXio.widthAnchor.constraint(equalToConstant: 12),
            XioArrowIconXio.heightAnchor.constraint(equalToConstant: 12)
        ])
    }
    
    func XioSyncTextXio(_ XioContentXio: String) {
        XioTitleLabelXio.text = XioContentXio
    }
    
    
}
