//
//  XioGovernanceHubXio.swift
//  Xnioa
//
//  Created by mumu on 2026/2/26.
//

import Foundation

class XioGovernanceHubXio {
    
    static let XioPrincipalXio = XioGovernanceHubXio()
    
    private let XioVaultXio = UserDefaults.standard
    private let XioIdentityTokenXio = "XioAccessPermitKeyXio"
    private let XioTreasuryKeyXio = "XioGoldenReserveKeyXio"
    
    private(set) var XioActiveProfileXio: XioIdentityArchiveXio?
    
    private init() {
        XioRestoreSessionXio()
    }
 
    var XioIsAuthorizedXio: Bool {
        return XioVaultXio.string(forKey: XioIdentityTokenXio) != nil
    }
    
    func XioAuthenticateXio(uid: String, secret: String) -> Bool {
        if (uid == "XioTester@gmial.com" && secret == "888888") || (uid.count >= 4 && secret.count >= 6) {
            let XioTokenXio = "XTK_" + UUID().uuidString.prefix(8)
            XioVaultXio.set(XioTokenXio, forKey: XioIdentityTokenXio)
            XioInitializeLocalProfileXio(name: uid)
            return true
        }
        return false
    }
    
    func XioTerminateSessionXio() {
        XioVaultXio.removeObject(forKey: XioIdentityTokenXio)
        XioActiveProfileXio = nil
    }
    
    func XioEraseAccountXio() {
        XioTerminateSessionXio()
        XioVaultXio.removeObject(forKey: XioTreasuryKeyXio)
        XioVaultXio.removeObject(forKey: "XioProfileCacheXio")
    }
    
    private func XioRestoreSessionXio() {
        if XioIsAuthorizedXio {
            XioInitializeLocalProfileXio(name: "XioMember")
        }
    }
    
    private func XioInitializeLocalProfileXio(name: String) {
        XioActiveProfileXio = XioIdentityArchiveXio(
            XioAliasXio: name,
            XioBadgeIDXio: "ID_\(Int.random(in: 1000...9999))",
            XioMottoXio: "Vibing in the AI Party",
            XioAvatarXio: "XioDefaultAsset",
            XioExileListXio: ["Bot_01"],
            XioAdoreListXio: []
        )
    }

    // 本地 mock 数据：派对房间
        
    lazy var XioRoomPoolXio: [XioGalaEntryXio] = [
        XioGalaEntryXio(XioSubjectXio: "For you", XioCoverXio: "VibeMaster0", XioHeatValueXio: 120, XIOName: "Retro Nights"),
        XioGalaEntryXio(XioSubjectXio: "Trending", XioCoverXio: "VibeMaster1", XioHeatValueXio: 340, XIOName: "Disco Lounge"),
        XioGalaEntryXio(XioSubjectXio: "Fairy tale", XioCoverXio: "VibeMaster2", XioHeatValueXio: 56, XIOName: "Vintage Vibes"),
        XioGalaEntryXio(XioSubjectXio: "For you", XioCoverXio: "VibeMaster3", XioHeatValueXio: 56, XIOName: "Throwback Party"),
        XioGalaEntryXio(XioSubjectXio: "For you", XioCoverXio: "VibeMaster4", XioHeatValueXio: 56, XIOName: "Old School Beats"),
        XioGalaEntryXio(XioSubjectXio: "Trending", XioCoverXio: "VibeMaster5", XioHeatValueXio: 56, XIOName: "Retro Dancefloor"),
        XioGalaEntryXio(XioSubjectXio: "Fairy tale", XioCoverXio: "VibeMaster6", XioHeatValueXio: 56, XIOName: "Vinyl Nights"),
        XioGalaEntryXio(XioSubjectXio: "Age", XioCoverXio: "VibeMaster7", XioHeatValueXio: 56, XIOName: "Timeless Style"),
        XioGalaEntryXio(XioSubjectXio: "Fairy tale", XioCoverXio: "VibeMaster8", XioHeatValueXio: 56, XIOName: "Classic Party"),
        XioGalaEntryXio(XioSubjectXio: "For you", XioCoverXio: "VibeMaster9", XioHeatValueXio: 56, XIOName: "Golden Era")
       
    ]
    
    var XioCurrentReserveXio: Int {
        get {
            let XioValXio = XioVaultXio.integer(forKey: XioTreasuryKeyXio)
            return XioValXio == 0 ? 500 : XioValXio
        }
        set { XioVaultXio.set(newValue, forKey: XioTreasuryKeyXio) }
    }
    
    func XioSpendReserveXio(cost: Int) -> Bool {
        if XioCurrentReserveXio >= cost {
            XioCurrentReserveXio -= cost
            return true
        }
        return false
    }
    
    func XioInjectReserveXio(gain: Int) {
        XioCurrentReserveXio += gain
    }

    // MARK: - Social & Relation (Exile / Adore)
    
    func XioUpdateExileStatusXio(target: String, xAdd: Bool) {
        if xAdd {
            if !XioActiveProfileXio!.XioExileListXio.contains(target) {
                XioActiveProfileXio?.XioExileListXio.append(target)
            }
        } else {
            XioActiveProfileXio?.XioExileListXio.removeAll { $0 == target }
        }
    }
    
    func XioUpdateAdoreStatusXio(target: String, xLike: Bool) {
        if xLike {
            if !XioActiveProfileXio!.XioAdoreListXio.contains(target) {
                XioActiveProfileXio?.XioAdoreListXio.append(target)
            }
        } else {
            XioActiveProfileXio?.XioAdoreListXio.removeAll { $0 == target }
        }
    }

    // MARK: - Dialog Data (Session List)
    
    func XioFetchNexusDialogsXio() -> [XioDialogSnippetXio] {
        return [
            XioDialogSnippetXio(XioPeerXio: "XioVibeMaster", XioSnippetXio: "Welcome to the Jazz Hall!", XioStampXio: "10:30"),
            XioDialogSnippetXio(XioPeerXio: "XioSystem", XioSnippetXio: "Your AI Style is ready.", XioStampXio: "09:15")
        ]
    }
}

// MARK: - Support Entities

struct XioIdentityArchiveXio {
    var XioAliasXio: String
    var XioBadgeIDXio: String
    var XioMottoXio: String
    var XioAvatarXio: String
    var XioExileListXio: [String]
    var XioAdoreListXio: [String]
}

struct XioDialogSnippetXio {
    let XioPeerXio: String
    let XioSnippetXio: String
    let XioStampXio: String
}

struct XioGalaEntryXio {
    let XioSubjectXio: String
    let XioCoverXio: String
    let XioHeatValueXio: Int
    let XIOName:String
}
