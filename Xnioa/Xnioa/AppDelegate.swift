//
//  AppDelegate.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/12.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        XioRetroAssetVaultXio.XioSharedVaultXio.XioInstallVaultBridgeXio()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMQlJzr1yuc/s1elz2+Mr6J6EUsmC49tGH4s/oEy+"), sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }


}
