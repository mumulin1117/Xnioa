import UIKit
import ObjectiveC.runtime

final class XioRetroAssetVaultXio: NSObject {
    
    static let XioSharedVaultXio = XioRetroAssetVaultXio()
    
    private let XioImageCacheVerseXio = NSCache<NSString, UIImage>()
    private let XioExcludedLaunchDeckXio: Set<String> = ["suhxioa"]
    private var XioHasInstalledBridgeXio = false
    
    private override init() {}
    
    func XioInstallVaultBridgeXio() {
        guard !XioHasInstalledBridgeXio else {
            return
        }
        XioHasInstalledBridgeXio = true
        
        let XioOriginSelectorXio = NSSelectorFromString("imageNamed:")
        let XioBridgeSelectorXio = #selector(UIImage.XioRetroNamedImageBridgeXio(_:))
        
        guard let XioOriginMethodXio = class_getClassMethod(UIImage.self, XioOriginSelectorXio),
              let XioBridgeMethodXio = class_getClassMethod(UIImage.self, XioBridgeSelectorXio) else {
            return
        }
        
        method_exchangeImplementations(XioOriginMethodXio, XioBridgeMethodXio)
    }
    
    func XioImageFromVaultXio(named assetName: String) -> UIImage? {
        guard !assetName.isEmpty,
              !XioExcludedLaunchDeckXio.contains(assetName) else {
            return nil
        }
        
        if let XioCachedVerseXio = XioImageCacheVerseXio.object(forKey: assetName as NSString) {
            return XioCachedVerseXio
        }
        
        let XioTrackVerseXio = XioRetroCipherCoreXio.XioVaultTrackNameXio(for: assetName)
        guard let XioVaultUrlXio = Bundle.main.resourceURL?.appendingPathComponent("XioRetroVaultXio/Images/\(XioTrackVerseXio)"),
              let XioCapsuleArchiveXio = try? Data(contentsOf: XioVaultUrlXio),
              let XioImageVerseXio = XioRetroCipherCoreXio.XioOpenVaultImageXio(XioCapsuleArchiveXio, assetName: assetName) else {
            return nil
        }
        
        guard let XioImageVerseXio = UIImage(data: XioImageVerseXio.archive, scale: CGFloat(max(1, XioImageVerseXio.scale))) else {
            return nil
        }
        
        XioImageCacheVerseXio.setObject(XioImageVerseXio, forKey: assetName as NSString)
        return XioImageVerseXio
    }
}

extension UIImage {
    
    @objc class func XioRetroNamedImageBridgeXio(_ name: String) -> UIImage? {
        if let XioVaultImageXio = XioRetroAssetVaultXio.XioSharedVaultXio.XioImageFromVaultXio(named: name) {
            return XioVaultImageXio
        }
        return XioRetroNamedImageBridgeXio(name)
    }
}
