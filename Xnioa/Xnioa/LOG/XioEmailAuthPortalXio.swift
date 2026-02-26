//
//  XioEmailAuthPortalXio.swift
//  Xnioa
//
//  Created by  on 2026/2/24.
//

import UIKit
import SafariServices

class XioEmailAuthPortalXio: XioResilienceAnchorXio, UITextFieldDelegate {

    private let XioBackCanvasXio = UIView()
    private let XioReturnTriggerXio = UIButton(type: .custom)
    private let XioHeaderTitleXio = UILabel()
    private let XioGramophoneArtXio = UIImageView()
    private let XioEmailCaptionXio = UILabel()
    private let XioEmailInputXio = UITextField()
    private let XioPassCaptionXio = UILabel()
    private let XioPassInputXio = UITextField()
    private let XioActionTriggerXio = UIButton(type: .system)
    
    private let XioRatioWXio = UIScreen.main.bounds.width / 375
    private let XioRatioHXio = UIScreen.main.bounds.height / 812
    private var XioCenterOffsetConstXio: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        XioSetupBaseOrbitXio()
        XioSyncStyleNodeXio()
        XioConstructMotionXio()
    }

    private func XioSetupBaseOrbitXio() {
        view.backgroundColor = UIColor(white: 0.05, alpha: 1.0)
        
        [XioBackCanvasXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        [XioReturnTriggerXio, XioHeaderTitleXio, XioGramophoneArtXio,
         XioEmailCaptionXio, XioEmailInputXio, XioPassCaptionXio,
         XioPassInputXio, XioActionTriggerXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioBackCanvasXio.addSubview($0)
        }

        XioCenterOffsetConstXio = XioBackCanvasXio.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        NSLayoutConstraint.activate([
            XioBackCanvasXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioBackCanvasXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioBackCanvasXio.heightAnchor.constraint(equalTo: view.heightAnchor),
            XioCenterOffsetConstXio!,

            XioReturnTriggerXio.topAnchor.constraint(equalTo: XioBackCanvasXio.topAnchor, constant: 60 * XioRatioHXio),
            XioReturnTriggerXio.leadingAnchor.constraint(equalTo: XioBackCanvasXio.leadingAnchor, constant: 20 * XioRatioWXio),
            XioReturnTriggerXio.widthAnchor.constraint(equalToConstant: 44),
            XioReturnTriggerXio.heightAnchor.constraint(equalToConstant: 44),

            XioHeaderTitleXio.centerYAnchor.constraint(equalTo: XioReturnTriggerXio.centerYAnchor),
            XioHeaderTitleXio.leadingAnchor.constraint(equalTo: XioReturnTriggerXio.trailingAnchor, constant: 10),

            XioGramophoneArtXio.topAnchor.constraint(equalTo: XioHeaderTitleXio.bottomAnchor, constant: 20 * XioRatioHXio),
            XioGramophoneArtXio.centerXAnchor.constraint(equalTo: XioBackCanvasXio.centerXAnchor),
            XioGramophoneArtXio.widthAnchor.constraint(equalToConstant: 240 * XioRatioWXio),
            XioGramophoneArtXio.heightAnchor.constraint(equalToConstant: 280 * XioRatioHXio),

            XioEmailCaptionXio.topAnchor.constraint(equalTo: XioGramophoneArtXio.bottomAnchor, constant: 30 * XioRatioHXio),
            XioEmailCaptionXio.leadingAnchor.constraint(equalTo: XioBackCanvasXio.leadingAnchor, constant: 30 * XioRatioWXio),

            XioEmailInputXio.topAnchor.constraint(equalTo: XioEmailCaptionXio.bottomAnchor, constant: 10 * XioRatioHXio),
            XioEmailInputXio.leadingAnchor.constraint(equalTo: XioEmailCaptionXio.leadingAnchor),
            XioEmailInputXio.trailingAnchor.constraint(equalTo: XioBackCanvasXio.trailingAnchor, constant: -30 * XioRatioWXio),
            XioEmailInputXio.heightAnchor.constraint(equalToConstant: 55 * XioRatioHXio),

            XioPassCaptionXio.topAnchor.constraint(equalTo: XioEmailInputXio.bottomAnchor, constant: 20 * XioRatioHXio),
            XioPassCaptionXio.leadingAnchor.constraint(equalTo: XioEmailCaptionXio.leadingAnchor),

            XioPassInputXio.topAnchor.constraint(equalTo: XioPassCaptionXio.bottomAnchor, constant: 10 * XioRatioHXio),
            XioPassInputXio.leadingAnchor.constraint(equalTo: XioEmailInputXio.leadingAnchor),
            XioPassInputXio.trailingAnchor.constraint(equalTo: XioEmailInputXio.trailingAnchor),
            XioPassInputXio.heightAnchor.constraint(equalTo: XioEmailInputXio.heightAnchor),

            XioActionTriggerXio.bottomAnchor.constraint(equalTo: XioBackCanvasXio.bottomAnchor, constant: -60 * XioRatioHXio),
            XioActionTriggerXio.leadingAnchor.constraint(equalTo: XioEmailInputXio.leadingAnchor),
            XioActionTriggerXio.trailingAnchor.constraint(equalTo: XioEmailInputXio.trailingAnchor),
            XioActionTriggerXio.heightAnchor.constraint(equalToConstant: 55 * XioRatioHXio)
            
       
        ])
    }

    private func XioSyncStyleNodeXio() {
        XioReturnTriggerXio.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        XioReturnTriggerXio.tintColor = .white
        XioReturnTriggerXio.layer.borderWidth = 1
        XioReturnTriggerXio.layer.borderColor = UIColor.darkGray.cgColor
        
        XioHeaderTitleXio.text = "Log in"
        XioHeaderTitleXio.font = .systemFont(ofSize: 24, weight: .bold)
        XioHeaderTitleXio.textColor = .white
        
        XioGramophoneArtXio.image = UIImage(named: "Xio_Retro_Player_Asset")
        XioGramophoneArtXio.contentMode = .scaleAspectFit
        
        XioEmailCaptionXio.text = "Email"
        XioEmailCaptionXio.font = .systemFont(ofSize: 16, weight: .medium)
        XioEmailCaptionXio.textColor = .white
        
        XioPassCaptionXio.text = "Password"
        XioPassCaptionXio.font = .systemFont(ofSize: 16, weight: .medium)
        XioPassCaptionXio.textColor = .white
        
        let XioInputBGXio = UIColor(white: 0.15, alpha: 1.0)
        [XioEmailInputXio, XioPassInputXio].forEach {
            $0.backgroundColor = XioInputBGXio
            $0.layer.cornerRadius = 8
            $0.textColor = .white
            $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 10))
            $0.leftViewMode = .always
            $0.delegate = self
        }
        
        XioEmailInputXio.attributedPlaceholder = NSAttributedString(string: "Enter your email", attributes: [.foregroundColor: UIColor.gray])
        XioPassInputXio.attributedPlaceholder = NSAttributedString(string: "Enter password", attributes: [.foregroundColor: UIColor.gray])
        XioPassInputXio.isSecureTextEntry = true
        
        XioActionTriggerXio.backgroundColor = UIColor(red: 0.7, green: 0.9, blue: 0.6, alpha: 1.0)
        XioActionTriggerXio.setTitle("Log in", for: .normal)
        XioActionTriggerXio.setTitleColor(.black, for: .normal)
        XioActionTriggerXio.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        XioActionTriggerXio.layer.cornerRadius = 8
    
    }

    private func XioConstructMotionXio() {
        XioReturnTriggerXio.addTarget(self, action: #selector(XioExitFlowXio), for: .touchUpInside)
        XioActionTriggerXio.addTarget(self, action: #selector(XioVerifyIdentityXio), for: .touchUpInside)
        
         
      
    }

    @objc private func XioVerifyIdentityXio() {
        guard let XioMailXio = XioEmailInputXio.text, XioMailXio.contains("@"),
              let XioKeyXio = XioPassInputXio.text, XioKeyXio.count >= 6 else {
            XioFeedbackErrXio()
            return
        }
        
        XioActionTriggerXio.isEnabled = false
        let XioSpinXio = UIActivityIndicatorView(style: .medium)
        XioSpinXio.center = CGPoint(x: XioActionTriggerXio.frame.width/2, y: XioActionTriggerXio.frame.height/2)
        XioActionTriggerXio.addSubview(XioSpinXio)
        XioSpinXio.startAnimating()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            XioSpinXio.stopAnimating()
            XioSpinXio.removeFromSuperview()
            // 满足基本长度即视为成功（模拟创建新账号）
                   
            if  XioGovernanceHubXio.XioPrincipalXio.XioAuthenticateXio(uid: XioMailXio, secret: XioKeyXio){
                
                self.XioTransitionToMainStageXio()
            }
        }
    }
    private func XioTransitionToMainStageXio() {
        guard let XioActiveWinXio = UIApplication.shared.connectedScenes
                .filter({ $0.activationState == .foregroundActive })
                .compactMap({ $0 as? UIWindowScene })
                .first?.windows
                .filter({ $0.isKeyWindow }).first else { return }
            
            // 获取当前的 SceneDelegate 实例并执行切换
            if let XioDelegateXio = XioActiveWinXio.windowScene?.delegate as? SceneDelegate {
                let XIOLobbyVCXIO = XioMainCoordinatorXio()
               
                let XIONavXIO = UINavigationController(rootViewController: XIOLobbyVCXIO)
                XIONavXIO.navigationBar.isHidden = true
                XioDelegateXio.window?.rootViewController = XIONavXIO
            }
       
    }

    private func XioFeedbackErrXio() {
        let XioShakeXio = CABasicAnimation(keyPath: "position")
        XioShakeXio.duration = 0.05
        XioShakeXio.repeatCount = 4
        XioShakeXio.autoreverses = true
        XioShakeXio.fromValue = NSValue(cgPoint: CGPoint(x: XioActionTriggerXio.center.x - 5, y: XioActionTriggerXio.center.y))
        XioShakeXio.toValue = NSValue(cgPoint: CGPoint(x: XioActionTriggerXio.center.x + 5, y: XioActionTriggerXio.center.y))
        XioActionTriggerXio.layer.add(XioShakeXio, forKey: "shake")
    }

  
    @objc private func XioExitFlowXio() {
        dismiss(animated: true)
    }

    @objc private func XioShowLegalXio() {
        if let XioUrlXio = URL(string: "https://xnioa.com/legal") {
            let XioSafariXio = SFSafariViewController(url: XioUrlXio)
            present(XioSafariXio, animated: true)
        }
    }
}
