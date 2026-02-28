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
    
     var XioActiveProfileXio: XioGalaEntryXio?
    
    private init() {
        
        XioRoomPoolXio =  sxnioLoadRegistryFromLocal()
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
        XioActiveProfileXio = XioGalaEntryXio.init(XioAliasXio: name,
                                                   XioBadgeIDXio: "\(Int.random(in: 238294...8274747))",
                                                   XioAvatarXio: "meHEiaudo",
                                                   XioMottoXio: "Nothing...",
                                                   XioMoiveTitle: "",
                                                   XioMoivepath: "",
                                                   XioSubjectXio: "",
                                                   XioRoomCover: "", XioRoomScene: "",
                                                   XioHeatValueXio: "",
                                                   XioRoomTItle: "")
//        XioGalaEntryXio.init(XioAliasXio: name,
//                                                   XioBadgeIDXio: "3456789",
//                                                   XioAvatarXio: "meHEiaudo",
//                                                   XioMottoXio: "Oka,show",
//                                                   XioMoiveTitle: "",
//                                                   XioMoivepath: "",
//                                                   XioSubjectXio: "",
//                                                   XioRoomCover: "",
//                                                   XioHeatValueXio: "",
//                                                   XioRoomTItle: "")
    }

    // 本地 mock 数据：派对房间
        
    lazy var XioRoomPoolXio: [XioGalaEntryXio] = []
    
    func sxnioLoadRegistryFromLocal() -> [XioGalaEntryXio] {
        // 假设你的文件名为 DataList.plist
        guard let sxnioUrl = Bundle.main.url(forResource: "xnioainfoda", withExtension: "plist"),
              let sxnioRawData = try? Data(contentsOf: sxnioUrl) else {
            return []
        }
        
        do {
          
            let sxnioResult = try PropertyListDecoder().decode([XioGalaEntryXio].self, from: sxnioRawData)
            return sxnioResult
        } catch {
            print("sxnio error: \(error)")
            return []
        }
    }
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
    var XioExileListXio: [String] = Array<String>()
    
    
    func XioUpdateExileStatusXio(target: String, xAdd: Bool) {
        if xAdd {
            if !XioExileListXio.contains(target) {
                XioExileListXio.append(target)
            }
        } else {
           XioExileListXio.removeAll { $0 == target }
        }
    }
    
    
    var XioAdoreListXio: [String] = Array<String>()
    func XioUpdateAdoreStatusXio(target: String, xLike: Bool) {
        if xLike {
            if !XioAdoreListXio.contains(target) {
                XioAdoreListXio.append(target)
            }
        } else {
            XioAdoreListXio.removeAll { $0 == target }
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


struct XioDialogSnippetXio {
    let XioPeerXio: String
    let XioSnippetXio: String
    let XioStampXio: String
}

struct XioGalaEntryXio : Codable{
    let XioAliasXio:String//名字
    let XioBadgeIDXio:String//ID
    let XioAvatarXio:String//头像
    let XioMottoXio:String//signiture
    
    let XioMoiveTitle:String//
    let XioMoivepath:String//
    
    let XioSubjectXio: String//主题
    let XioRoomCover: String//封面
    let XioRoomScene:String// = <#value#>
    
    let XioHeatValueXio: String//热度
    let XioRoomTItle:String//名字
    
    
}
