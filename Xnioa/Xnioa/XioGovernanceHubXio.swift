//
//  XioGovernanceHubXio.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/26.
//

import Foundation
import UIKit

class XioGovernanceHubXio {
    
    static let XioPrincipalXio = XioGovernanceHubXio()
    
    private let XioVaultXio = UserDefaults.standard
    private let XioIdentityTokenXio = "XioAccessPermitKeyXio"
    private let XioTreasuryKeyXio = "XioGoldenReserveKeyXio"
    
     var XioActiveProfileXio: XioGalaEntryXio?
    var XioAUsedCachePhotoio: UIImage?
    private init() {
        
        XioRoomPoolXio =  sxnioLoadRegistryFromLocal()
        XioRestoreSessionXio()
        if XioVaultXio.object(forKey: XioIdentityTokenXio) as? String  == "32112345677"{
            XioInboxPalaceXio.XioChatBufferXio = [
                Diolodlisr.init(Xiouser: XioRoomPoolXio[0], dilog: [XioChatEntityXio.init(XioSnippetTextXio: "like your post: New year...", XioTimestampXio: "12.50", whosayIsMe: false)]),
                
                Diolodlisr.init(Xiouser: XioRoomPoolXio[2], dilog: [XioChatEntityXio.init(XioSnippetTextXio: "Hello...", XioTimestampXio: "15.50", whosayIsMe: true)])
                
            ]
        }
    }
 
    var XioIsAuthorizedXio: Bool {
        return XioVaultXio.string(forKey: XioIdentityTokenXio) != nil
    }
    
    func XioAuthenticateXio(uid: String, secret: String) -> Bool {
        if (uid == "tester@gmial.com" && secret == "888888") || (uid.count >= 4 && secret.count >= 6) {
            
            if uid == "tester@gmial.com" {
                XioVaultXio.set("32112345677", forKey: XioIdentityTokenXio)
            }else{
                let XioTokenXio = "XTK_" + UUID().uuidString.prefix(8)
                XioVaultXio.set(XioTokenXio, forKey: XioIdentityTokenXio)
            }
            
            XioInitializeLocalProfileXio(name: uid)
            return true
        }
       
        return false
    }
    
    func XioTerminateSessionXio() {
        XioVaultXio.removeObject(forKey: XioIdentityTokenXio)
        XioActiveProfileXio = nil
        XioVaultXio.removeObject(forKey: XioTreasuryKeyXio)
        XioInboxPalaceXio.XioChatBufferXio.removeAll()
        XioAUsedCachePhotoio = nil
        XioRoomPoolXio.removeAll()
        XioVideoLikeListXio.removeAll()
        XioExileListXio.removeAll()
        XioAdoreListXio.removeAll()
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
        
        if name == "tester@gmial.com" {
            XioInboxPalaceXio.XioChatBufferXio = [
                Diolodlisr.init(Xiouser: XioRoomPoolXio[0], dilog: [XioChatEntityXio.init(XioSnippetTextXio: "like your post: New year...", XioTimestampXio: "12.50", whosayIsMe: false)]),
                
                Diolodlisr.init(Xiouser: XioRoomPoolXio[2], dilog: [XioChatEntityXio.init(XioSnippetTextXio: "Hello...", XioTimestampXio: "15.50", whosayIsMe: true)])
                
            ]
        }
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
            return XioValXio
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

    // MARK: - 精准 ID 匹配逻辑
    var XioVideoLikeListXio: [XioGalaEntryXio] = []
    var XioExileListXio: [XioGalaEntryXio] = []
    var XioAdoreListXio: [XioGalaEntryXio] = []

    
    func XioUpdateExileStatusXio(target: XioGalaEntryXio, xAdd: Bool) {
        if xAdd {
          
            if !XioExileListXio.contains(where: { $0.XioBadgeIDXio == target.XioBadgeIDXio }) {
                XioExileListXio.append(target)
                
               
                XioUpdateAdoreStatusXio(target: target, xLike: false)
                XioRoomPoolXio.removeAll{ $0.XioBadgeIDXio == target.XioBadgeIDXio }
                XioInboxPalaceXio.XioChatBufferXio.removeAll{ $0.Xiouser.XioBadgeIDXio == target.XioBadgeIDXio }
                NotificationCenter.default.post(name: NSNotification.Name.init("XioUpdateExileStatusXio"), object: nil)
            }
        } else {
            
            XioExileListXio.removeAll { $0.XioBadgeIDXio == target.XioBadgeIDXio }
        }
       
    }
    
    func XioUpdateVideoLikeStatusXio(target: XioGalaEntryXio, xLike: Bool) {
        if xLike {
           
            if XioVideoLikeListXio.contains(where: { $0.XioBadgeIDXio == target.XioBadgeIDXio }) { return }
            
            if !XioVideoLikeListXio.contains(where: { $0.XioBadgeIDXio == target.XioBadgeIDXio }) {
                XioVideoLikeListXio.append(target)
            }
        } else {
            
            XioVideoLikeListXio.removeAll { $0.XioBadgeIDXio == target.XioBadgeIDXio }
        }
       
    }
    
//添加关注
    func XioUpdateAdoreStatusXio(target: XioGalaEntryXio, xLike: Bool) {
        if xLike {
            // 如果此 ID 在黑名单中，禁止添加喜欢
            if XioExileListXio.contains(where: { $0.XioBadgeIDXio == target.XioBadgeIDXio }) { return }
            
            if !XioAdoreListXio.contains(where: { $0.XioBadgeIDXio == target.XioBadgeIDXio }) {
                XioAdoreListXio.append(target)
            }
        } else {
            // 根据 ID 移除
            XioAdoreListXio.removeAll { $0.XioBadgeIDXio == target.XioBadgeIDXio }
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
    var XioAliasXio:String//名字
    let XioBadgeIDXio:String//ID
    let XioAvatarXio:String//头像
    let XioMottoXio:String//signiture
    
    let XioMoiveTitle:String//
    let XioMoivepath:String//
    
    let XioSubjectXio: String//主题
    let XioRoomCover: String//封面
    let XioRoomScene:String//
    
    let XioHeatValueXio: String//热度
    let XioRoomTItle:String//名字
    
    
}
