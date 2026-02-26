//
//  XioMainCoordinatorXio.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/24.
//

import UIKit

class XioMainCoordinatorXio: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        XioSetupNavigationOrbitXio()
        XioSyncAestheticXio()
    }

    private func XioSetupNavigationOrbitXio() {
        let XioHomeXio = XioRetroLobbyXio()
        let XioVisualsXio = XioVideoPalaceXio()
        let XioAlertsXio = XioInboxPalaceXio()
        let XioIdentityXio = XioPersonalPalaceXio()//XioPeerPortalPalaceXio()//
        
        XioHomeXio.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "houseXIO0")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "houseXIO0_SEL")?.withRenderingMode(.alwaysOriginal))
        XioVisualsXio.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "houseXIO1")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "houseXIO1_SEL")?.withRenderingMode(.alwaysOriginal))
        XioAlertsXio.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "houseXIO2")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "houseXIO2_SEL")?.withRenderingMode(.alwaysOriginal))
        XioIdentityXio.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "houseXIO3")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "houseXIO3_SEL")?.withRenderingMode(.alwaysOriginal))
        
        viewControllers = [XioHomeXio, XioVisualsXio, XioAlertsXio, XioIdentityXio]
    }

    private func XioSyncAestheticXio() {
       
                
        let XioVibeAppearanceXio = UITabBarAppearance()
       
        XioVibeAppearanceXio.configureWithOpaqueBackground()
        XioVibeAppearanceXio.backgroundColor = .black
        
        XioVibeAppearanceXio.shadowColor = UIColor(white: 0.2, alpha: 1.0)
        XioVibeAppearanceXio.shadowImage = nil
        
      
        tabBar.standardAppearance = XioVibeAppearanceXio
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = XioVibeAppearanceXio
        }
        
       
        tabBar.tintColor = UIColor(red: 0.7, green: 0.9, blue: 0.6, alpha: 1.0)
        tabBar.unselectedItemTintColor = .gray
        
        tabBar.isTranslucent = false
    }
}
