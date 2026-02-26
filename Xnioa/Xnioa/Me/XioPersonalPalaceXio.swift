//
//  XioPersonalPalaceXio.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/24.
//

import UIKit

// MARK: - Core Data Model
struct XioUserProfileXio {
    let XioIdentityNameXio: String
    let XioAvatarKeyXio: String
    let XioWealthCountXio: Int
    let XioFollowerTotalXio: Int
    let XioFollowingTotalXio: Int
}

// MARK: - Profile Controller
class XioPersonalPalaceXio: UIViewController {
    
    private let XioRootScrollXio = UIScrollView()
    private let XioContentRackXio = UIView()
    
    private let XioSettingsTriggerXio = UIButton()
    private let XioDiamondBadgeXio = UIButton()
    private let XioDiamondIconXio = UIImageView()
    private let XioDiamondValueXio = UILabel()
    
    private let XioMasterAvatarXio = UIImageView()
    private let XioMasterNameXio = UILabel()
    
    private let XioSocialStackXio = UIStackView()
    private let XioFollowerBoxXio = UILabel()
    private let XioFollowingBoxXio = UILabel()
    
    private let XioSegmentDockXio = UIView()
    private let XioRoomTabXio = UIButton()
    private let XioVideoTabXio = UIButton()
    private let XioHistoryTabXio = UIButton()
    
    private let XioVoidPlaceholderXio = UIImageView.init(image: UIImage.init(named: "XioVoidPlaceholderXio"))
    
    private let XioWScaleXio = UIScreen.main.bounds.width / 375
    private let XioHScaleXio = UIScreen.main.bounds.height / 812
    
    private var XioCurrentSelectionXio: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        XioInitializeCanvasXio()
        XioForgeArchitectureXio()
        XioRequestProfilePulseXio()
        XioDiamondBadgeXio.addTarget(self, action: #selector(XioDimonedCallXio), for: .touchUpInside)
    }
    
    private func XioInitializeCanvasXio() {
        view.backgroundColor = UIColor(white: 0.05, alpha: 1.0)
        XioRootScrollXio.contentInsetAdjustmentBehavior = .never
    }
    
    private func XioForgeArchitectureXio() {
        XioRootScrollXio.translatesAutoresizingMaskIntoConstraints = false
        XioContentRackXio.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(XioRootScrollXio)
        XioRootScrollXio.addSubview(XioContentRackXio)
        XioSettingsTriggerXio.addTarget(self, action: #selector(XioDimonedsiteXio), for: .touchUpInside)
        XioSettingsTriggerXio.setImage(UIImage(systemName: "gearshape"), for: .normal)
        XioSettingsTriggerXio.tintColor = .white
        
        XioDiamondBadgeXio.layer.cornerRadius = 15 * XioHScaleXio
        let XioGradiantXio = CAGradientLayer()
        XioGradiantXio.frame = CGRect(x: 0, y: 0, width: 100 * XioWScaleXio, height: 30 * XioHScaleXio)
        XioGradiantXio.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        XioGradiantXio.startPoint = CGPoint(x: 0, y: 0.5)
        XioGradiantXio.endPoint = CGPoint(x: 1, y: 0.5)
        XioDiamondBadgeXio.layer.insertSublayer(XioGradiantXio, at: 0)
        XioDiamondBadgeXio.clipsToBounds = true
        
        XioDiamondIconXio.image = UIImage(systemName: "suit.diamond.fill")
        XioDiamondIconXio.tintColor = .white
        XioDiamondValueXio.textColor = .white
        XioDiamondValueXio.font = .systemFont(ofSize: 16, weight: .bold)
        
        XioMasterAvatarXio.layer.cornerRadius = 50 * XioWScaleXio
        XioMasterAvatarXio.clipsToBounds = true
        XioMasterAvatarXio.layer.borderWidth = 2
        XioMasterAvatarXio.layer.borderColor = UIColor.darkGray.cgColor
        XioMasterAvatarXio.backgroundColor = .gray
        
        XioMasterNameXio.textColor = .white
        XioMasterNameXio.font = .systemFont(ofSize: 22, weight: .bold)
        XioMasterNameXio.textAlignment = .center
        
        XioSegmentDockXio.layer.cornerRadius = 8
        XioSegmentDockXio.layer.borderWidth = 1
        XioSegmentDockXio.layer.borderColor = UIColor.init(red: 182/255, green: 240/255, blue: 156/255, alpha: 1).cgColor
        
        XioConfigureTabXio(XioRoomTabXio, title: "Room", tag: 0)
        XioConfigureTabXio(XioVideoTabXio, title: "Video", tag: 1)
        XioConfigureTabXio(XioHistoryTabXio, title: "History", tag: 2)
        XioUpdateTabVisualsXio()
        
        XioVoidPlaceholderXio.contentMode = .scaleAspectFit
        XioVoidPlaceholderXio.image = UIImage(named: "XioVoidPlaceholderXio")
        
        [XioSettingsTriggerXio, XioDiamondBadgeXio, XioMasterAvatarXio, XioMasterNameXio, XioSocialStackXio, XioSegmentDockXio, XioVoidPlaceholderXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioContentRackXio.addSubview($0)
        }
        
        XioDiamondBadgeXio.addSubview(XioDiamondIconXio)
        XioDiamondBadgeXio.addSubview(XioDiamondValueXio)
        XioFollowerBoxXio.textColor = .white
        XioFollowerBoxXio.font = UIFont(name: "Inter-Semi Bold", size: 16)
        XioFollowerBoxXio.textAlignment = .center
        XioFollowerBoxXio.text = "0 Followers"
        XioFollowingBoxXio.textColor = .white
        XioFollowingBoxXio.font = UIFont(name: "Inter-Semi Bold", size: 16)
        XioFollowingBoxXio.textAlignment = .center
        XioFollowingBoxXio.text = "0 Following"
        
        
        view.addSubview(XioFollowerBoxXio)
        view.addSubview(XioFollowingBoxXio)
        XioFollowerBoxXio.translatesAutoresizingMaskIntoConstraints = false
        XioFollowingBoxXio.translatesAutoresizingMaskIntoConstraints = false
        XioDiamondIconXio.translatesAutoresizingMaskIntoConstraints = false
        XioDiamondValueXio.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            XioRootScrollXio.topAnchor.constraint(equalTo: view.topAnchor),
            XioRootScrollXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioRootScrollXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioRootScrollXio.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            XioContentRackXio.topAnchor.constraint(equalTo: XioRootScrollXio.topAnchor),
            XioContentRackXio.leadingAnchor.constraint(equalTo: XioRootScrollXio.leadingAnchor),
            XioContentRackXio.trailingAnchor.constraint(equalTo: XioRootScrollXio.trailingAnchor),
            XioContentRackXio.bottomAnchor.constraint(equalTo: XioRootScrollXio.bottomAnchor),
            XioContentRackXio.widthAnchor.constraint(equalTo: XioRootScrollXio.widthAnchor),
            
            XioSettingsTriggerXio.topAnchor.constraint(equalTo: XioContentRackXio.topAnchor, constant: 60 * XioHScaleXio),
            XioSettingsTriggerXio.trailingAnchor.constraint(equalTo: XioContentRackXio.trailingAnchor, constant: -20 * XioWScaleXio),
            XioSettingsTriggerXio.widthAnchor.constraint(equalToConstant: 30 * XioWScaleXio),
            XioSettingsTriggerXio.heightAnchor.constraint(equalToConstant: 30 * XioWScaleXio),
            
            XioDiamondBadgeXio.centerYAnchor.constraint(equalTo: XioSettingsTriggerXio.centerYAnchor),
            XioDiamondBadgeXio.leadingAnchor.constraint(equalTo: XioContentRackXio.leadingAnchor, constant: 20 * XioWScaleXio),
            XioDiamondBadgeXio.widthAnchor.constraint(equalToConstant: 100 * XioWScaleXio),
            XioDiamondBadgeXio.heightAnchor.constraint(equalToConstant: 30 * XioHScaleXio),
            
            XioDiamondIconXio.leadingAnchor.constraint(equalTo: XioDiamondBadgeXio.leadingAnchor, constant: 10),
            XioDiamondIconXio.centerYAnchor.constraint(equalTo: XioDiamondBadgeXio.centerYAnchor),
            XioDiamondValueXio.leadingAnchor.constraint(equalTo: XioDiamondIconXio.trailingAnchor, constant: 5),
            XioDiamondValueXio.centerYAnchor.constraint(equalTo: XioDiamondBadgeXio.centerYAnchor),
            
            XioMasterAvatarXio.topAnchor.constraint(equalTo: XioContentRackXio.topAnchor, constant: 100 * XioHScaleXio),
            XioMasterAvatarXio.centerXAnchor.constraint(equalTo: XioContentRackXio.centerXAnchor),
            XioMasterAvatarXio.widthAnchor.constraint(equalToConstant: 100 * XioWScaleXio),
            XioMasterAvatarXio.heightAnchor.constraint(equalToConstant: 100 * XioWScaleXio),
            
            XioMasterNameXio.topAnchor.constraint(equalTo: XioMasterAvatarXio.bottomAnchor, constant: 15 * XioHScaleXio),
            XioMasterNameXio.centerXAnchor.constraint(equalTo: XioContentRackXio.centerXAnchor),
            
            
            XioFollowerBoxXio.widthAnchor.constraint(equalToConstant: 100),
            XioFollowerBoxXio.heightAnchor.constraint(equalToConstant: 25),
            XioFollowerBoxXio.trailingAnchor.constraint(equalTo: view.centerXAnchor,constant: -10),
            XioFollowerBoxXio.topAnchor.constraint(equalTo: XioMasterNameXio.bottomAnchor, constant: 16),
            
            XioFollowingBoxXio.widthAnchor.constraint(equalToConstant: 100),
            XioFollowingBoxXio.heightAnchor.constraint(equalToConstant: 25),
            XioFollowingBoxXio.leadingAnchor.constraint(equalTo: view.centerXAnchor,constant: 10),
            XioFollowingBoxXio.topAnchor.constraint(equalTo: XioMasterNameXio.bottomAnchor, constant: 16),
            
            XioSegmentDockXio.topAnchor.constraint(equalTo: XioFollowingBoxXio.bottomAnchor, constant: 40 * XioHScaleXio),
            XioSegmentDockXio.leadingAnchor.constraint(equalTo: XioContentRackXio.leadingAnchor, constant: 20 * XioWScaleXio),
            XioSegmentDockXio.trailingAnchor.constraint(equalTo: XioContentRackXio.trailingAnchor, constant: -20 * XioWScaleXio),
            XioSegmentDockXio.heightAnchor.constraint(equalToConstant: 45 * XioHScaleXio),
            
            XioVoidPlaceholderXio.topAnchor.constraint(equalTo: XioSegmentDockXio.bottomAnchor, constant: 50 * XioHScaleXio),
            XioVoidPlaceholderXio.centerXAnchor.constraint(equalTo: XioContentRackXio.centerXAnchor),
            XioVoidPlaceholderXio.widthAnchor.constraint(equalToConstant: 200 * XioWScaleXio),
            XioVoidPlaceholderXio.heightAnchor.constraint(equalToConstant: 200 * XioWScaleXio),
            XioVoidPlaceholderXio.bottomAnchor.constraint(equalTo: XioContentRackXio.bottomAnchor, constant: -50)
        ])
        
        XioBuildTabStackXio()
    }
    
    private func XioConfigureTabXio(_ button: UIButton, title: String, tag: Int) {
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.tag = tag
        button.addTarget(self, action: #selector(XioTabSwitchActionXio(_:)), for: .touchUpInside)
    }
    
    private func XioBuildTabStackXio() {
        let XioStackXio = UIStackView(arrangedSubviews: [XioRoomTabXio, XioVideoTabXio, XioHistoryTabXio])
        XioStackXio.axis = .horizontal
        XioStackXio.distribution = .fillEqually
        XioStackXio.translatesAutoresizingMaskIntoConstraints = false
        XioSegmentDockXio.addSubview(XioStackXio)
        
        NSLayoutConstraint.activate([
            XioStackXio.topAnchor.constraint(equalTo: XioSegmentDockXio.topAnchor),
            XioStackXio.leadingAnchor.constraint(equalTo: XioSegmentDockXio.leadingAnchor),
            XioStackXio.trailingAnchor.constraint(equalTo: XioSegmentDockXio.trailingAnchor),
            XioStackXio.bottomAnchor.constraint(equalTo: XioSegmentDockXio.bottomAnchor)
        ])
    }
    
    @objc private func XioTabSwitchActionXio(_ sender: UIButton) {
        XioCurrentSelectionXio = sender.tag
        XioUpdateTabVisualsXio()
    }
    
    private func XioUpdateTabVisualsXio() {
        let XioTabsXio = [XioRoomTabXio, XioVideoTabXio, XioHistoryTabXio]
        for (index, button) in XioTabsXio.enumerated() {
            if index == XioCurrentSelectionXio {
                button.backgroundColor = UIColor.init(red: 182/255, green: 240/255, blue: 156/255, alpha: 1)
                button.setTitleColor(.black, for: .normal)
            } else {
                button.backgroundColor = .clear
                button.setTitleColor(UIColor.init(red: 182/255, green: 240/255, blue: 156/255, alpha: 1), for: .normal)
            }
        }
    }
    
    private func XioRequestProfilePulseXio() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let XioFakeDataXio = XioUserProfileXio(
                XioIdentityNameXio: "Jean Brooks",
                XioAvatarKeyXio: "",
                XioWealthCountXio: 400,
                XioFollowerTotalXio: 1,
                XioFollowingTotalXio: 1
            )
            self.XioMasterNameXio.text = XioFakeDataXio.XioIdentityNameXio
            self.XioDiamondValueXio.text = "\(XioFakeDataXio.XioWealthCountXio)"
        }
    }
    
    @objc private func XioDimonedCallXio() {
        let XioCallXio = XioTreasureVaultXio()
        XioCallXio.hidesBottomBarWhenPushed = true// Replace with your XioVideoCallPortalXio
        self.navigationController?.pushViewController(XioCallXio, animated: true)
    }
    
    @objc private func XioDimonedsiteXio() {
        let XioCallXio = XioSystemTerminalXio()
        XioCallXio.hidesBottomBarWhenPushed = true// Replace with your XioVideoCallPortalXio
        self.navigationController?.pushViewController(XioCallXio, animated: true)
    }
}
