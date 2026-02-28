//
//  SceneDelegate.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/12.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let XIOSceneContextXIO = (scene as? UIWindowScene) else { return }
        
        let XIOMainWindowXIO = UIWindow(windowScene: XIOSceneContextXIO)
        self.window = XIOMainWindowXIO
        
        if XIOCheckUserAuthStatusXIO() {
            XIOLaunchRetroLobbyXIO(for: XIOMainWindowXIO)
        } else {
            XIOLaunchEntryPortalXIO(for: XIOMainWindowXIO)
        }
        
        XIOMainWindowXIO.makeKeyAndVisible()
    }

   
    private func XIOCheckUserAuthStatusXIO() -> Bool {
       
        return XioGovernanceHubXio.XioPrincipalXio.XioIsAuthorizedXio
    }

    private func XIOLaunchEntryPortalXIO(for XIOWindowXIO: UIWindow) {
       
        let XIOEntryVCXIO = UINavigationController(rootViewController: XIOEntryViewController())
        XIOEntryVCXIO.navigationBar.isHidden = true
        XIOWindowXIO.rootViewController = XIOEntryVCXIO
    }

    private func XIOLaunchRetroLobbyXIO(for XIOWindowXIO: UIWindow) {
   
        let XIOLobbyVCXIO = XioMainCoordinatorXio()
       
        let XIONavXIO = UINavigationController(rootViewController: XIOLobbyVCXIO)
        XIONavXIO.navigationBar.isHidden = true
        XIOWindowXIO.rootViewController = XIONavXIO
        
        UIView.transition(with: XIOWindowXIO, duration: 0.4, options: .transitionCrossDissolve, animations: nil)
    }
}
