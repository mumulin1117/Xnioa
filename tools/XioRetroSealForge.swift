import Foundation

struct XioRetroSealForgeXio {
    
    let XioAssetCatalogUrlXio: URL
    let XioVaultRootUrlXio: URL
    let XioExcludedDeckXio: Set<String> = ["suhxioa"]
    
    func XioRunForgeXio() throws {
        let XioImageVaultUrlXio = XioVaultRootUrlXio.appendingPathComponent("Images", isDirectory: true)
        try XioPrepareVaultLaneXio(XioImageVaultUrlXio)
        
        let XioImagesetUrlsXio = try FileManager.default.contentsOfDirectory(at: XioAssetCatalogUrlXio, includingPropertiesForKeys: nil)
            .filter { $0.pathExtension == "imageset" }
            .sorted { $0.lastPathComponent < $1.lastPathComponent }
        
        var XioSealedCountXio = 0
        for XioImagesetUrlXio in XioImagesetUrlsXio {
            let XioAssetNameXio = XioImagesetUrlXio.deletingPathExtension().lastPathComponent
            guard !XioExcludedDeckXio.contains(XioAssetNameXio) else {
                continue
            }
            guard let XioPickVerseXio = try XioBestImagePickXio(in: XioImagesetUrlXio) else {
                continue
            }
            let XioImageArchiveXio = try Data(contentsOf: XioPickVerseXio.url)
            let XioCapsuleArchiveXio = XioRetroCipherCoreXio.XioSealVaultImageXio(XioImageArchiveXio, assetName: XioAssetNameXio, scale: XioPickVerseXio.scale)
            let XioTrackUrlXio = XioImageVaultUrlXio.appendingPathComponent(XioRetroCipherCoreXio.XioVaultTrackNameXio(for: XioAssetNameXio))
            try XioCapsuleArchiveXio.write(to: XioTrackUrlXio, options: .atomic)
            XioSealedCountXio += 1
        }
        
        print("XioRetroSealForgeXio sealed \(XioSealedCountXio) images into \(XioVaultRootUrlXio.path)")
    }
    
    private func XioPrepareVaultLaneXio(_ imageVaultUrl: URL) throws {
        if FileManager.default.fileExists(atPath: imageVaultUrl.path) {
            try FileManager.default.removeItem(at: imageVaultUrl)
        }
        try FileManager.default.createDirectory(at: imageVaultUrl, withIntermediateDirectories: true)
    }
    
    private func XioBestImagePickXio(in imagesetUrl: URL) throws -> (url: URL, scale: Int)? {
        let XioContentsUrlXio = imagesetUrl.appendingPathComponent("Contents.json")
        guard let XioContentsArchiveXio = try? Data(contentsOf: XioContentsUrlXio),
              let XioContentsVerseXio = try JSONSerialization.jsonObject(with: XioContentsArchiveXio) as? [String: Any],
              let XioImageDeckXio = XioContentsVerseXio["images"] as? [[String: Any]] else {
            return nil
        }
        
        let XioPicksVerseXio = XioImageDeckXio.compactMap { XioEntryVerseXio -> (url: URL, scale: Int)? in
            guard let XioFileVerseXio = XioEntryVerseXio["filename"] as? String else {
                return nil
            }
            let XioScaleMarkXio = (XioEntryVerseXio["scale"] as? String) ?? "1x"
            let XioScaleVerseXio = Int(XioScaleMarkXio.replacingOccurrences(of: "x", with: "")) ?? 1
            return (imagesetUrl.appendingPathComponent(XioFileVerseXio), XioScaleVerseXio)
        }
        
        return XioPicksVerseXio.max(by: { $0.scale < $1.scale })
    }
}

@main
struct XioRetroSealLaunchXio {
    
    static func main() {
        let XioArgumentDeckXio = CommandLine.arguments
        let XioAssetCatalogPathXio = XioArgumentDeckXio.dropFirst().first ?? "/Users/mac/Documents/Xnioa/Xnioa/Xnioa/Assets.xcassets"
        let XioVaultRootPathXio = XioArgumentDeckXio.dropFirst(2).first ?? "/Users/mac/Documents/Xnioa/Xnioa/Xnioa/XioRetroVaultXio"
        
        do {
            try XioRetroSealForgeXio(
                XioAssetCatalogUrlXio: URL(fileURLWithPath: XioAssetCatalogPathXio),
                XioVaultRootUrlXio: URL(fileURLWithPath: XioVaultRootPathXio)
            ).XioRunForgeXio()
        } catch {
            fputs("XioRetroSealForgeXio failed: \(error)\n", stderr)
            exit(1)
        }
    }
}
