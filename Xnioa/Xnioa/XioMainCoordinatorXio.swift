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
        
        XioHomeXio.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMWITVQjSBJNb+PrTuzxn10G6"))?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMWCHFBABHnLK6/Co8BBBXA8K4FEZDg=="))?.withRenderingMode(.alwaysOriginal))
        XioVisualsXio.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMQLpVAjSZJNb06+7zXRx55ZL"))?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMe7zhWNO7ucqgyN7izuxB4GRuMlz+w=="))?.withRenderingMode(.alwaysOriginal))
        XioAlertsXio.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMSKMVQjSxIxbqAlTxaE79HGq"))?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMZYXiZFpsCYxqHujSx9B90tC0XkaGQ=="))?.withRenderingMode(.alwaysOriginal))
        XioIdentityXio.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMcJaVQjSJJNbC6JPOOABtybC"))?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMcb0vqHr7o3w8d8LQDGOWJNOsdlBaA=="))?.withRenderingMode(.alwaysOriginal))
        
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
        
        tabBar.isTranslucent = true
    }
    

}
