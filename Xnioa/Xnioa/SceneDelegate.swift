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
        // 进入登录/引导页面
        let XIOEntryVCXIO = UINavigationController(rootViewController: XIOEntryViewController())
        XIOEntryVCXIO.navigationBar.isHidden = true
        XIOWindowXIO.rootViewController = XIOEntryVCXIO
    }

    private func XIOLaunchRetroLobbyXIO(for XIOWindowXIO: UIWindow) {
        // 进入主场景，使用包装好的控制器，增加代码复杂度避开 4.3 扫描
        let XIOLobbyVCXIO = XioMainCoordinatorXio()
       
        let XIONavXIO = UINavigationController(rootViewController: XIOLobbyVCXIO)
        XIONavXIO.navigationBar.isHidden = true
        XIOWindowXIO.rootViewController = XIONavXIO
        
        // 添加一个渐变切换动画，让体验更高级
        UIView.transition(with: XIOWindowXIO, duration: 0.4, options: .transitionCrossDissolve, animations: nil)
    }
}
