import Foundation

enum XioRetroCipherCoreXio {
    
    private static let XioRetroMasterVerseXio = Array("vinyl.parlor::afterglow.whisper::xnioa.cabaret::1978".utf8)
    private static let XioPhraseFlagVerseXio = "xv1:"
    private static let XioPhraseSealLeadXio: [UInt8] = [0x58, 0x50, 0x48, 0x31]
    private static let XioImageSealLeadXio: [UInt8] = [0x58, 0x49, 0x4D, 0x31]
    
    static func XioOpenPhraseXio(_ capsule: String) -> String {
        guard capsule.hasPrefix(XioPhraseFlagVerseXio) else {
            return capsule
        }
        let XioBodyVerseXio = String(capsule.dropFirst(XioPhraseFlagVerseXio.count))
        guard let XioCapsuleArchiveXio = Data(base64Encoded: XioBodyVerseXio),
              let XioPhraseArchiveXio = XioOpenCapsuleXio(XioCapsuleArchiveXio, domain: "phrase", lead: XioPhraseSealLeadXio) else {
            return ""
        }
        return String(data: XioPhraseArchiveXio, encoding: .utf8) ?? ""
    }
    
    static func XioSealPhraseXio(_ phrase: String) -> String {
        let XioPhraseArchiveXio = Data(phrase.utf8)
        let XioCapsuleArchiveXio = XioSealCapsuleXio(XioPhraseArchiveXio, domain: "phrase", lead: XioPhraseSealLeadXio)
        return XioPhraseFlagVerseXio + XioCapsuleArchiveXio.base64EncodedString()
    }
    
    static func XioSealVaultImageXio(_ archive: Data, assetName: String, scale: Int) -> Data {
        let XioScaleVerseXio = UInt8(max(1, min(3, scale)))
        let XioBlendArchiveXio = Data([XioScaleVerseXio]) + archive
        return XioSealCapsuleXio(XioBlendArchiveXio, domain: "image:\(assetName)", lead: XioImageSealLeadXio)
    }
    
    static func XioOpenVaultImageXio(_ capsule: Data, assetName: String) -> (scale: Int, archive: Data)? {
        guard let XioBlendArchiveXio = XioOpenCapsuleXio(capsule, domain: "image:\(assetName)", lead: XioImageSealLeadXio),
              let XioScaleVerseXio = XioBlendArchiveXio.first else {
            return nil
        }
        return (Int(XioScaleVerseXio), XioBlendArchiveXio.dropFirst())
    }
    
    static func XioVaultTrackNameXio(for assetName: String) -> String {
        let XioHashVerseXio = XioRetroHashXio(bytes: XioRetroMasterVerseXio + Array(assetName.utf8))
        return String(format: "%016llx.xrio", XioHashVerseXio)
    }
    
    private static func XioSealCapsuleXio(_ archive: Data, domain: String, lead: [UInt8]) -> Data {
        let XioNonceVerseXio = XioRetroHashXio(bytes: XioRetroMasterVerseXio + Array(domain.utf8) + Array(archive.prefix(48)))
        let XioBodyArchiveXio = XioRetroWaveMaskXio(archive, domain: domain, nonce: XioNonceVerseXio, sealing: true)
        var XioCapsuleArchiveXio = Data(lead)
        XioCapsuleArchiveXio.append(contentsOf: XioNonceVerseXio.littleEndianBytesXio)
        XioCapsuleArchiveXio.append(XioBodyArchiveXio)
        return XioCapsuleArchiveXio
    }
    
    private static func XioOpenCapsuleXio(_ capsule: Data, domain: String, lead: [UInt8]) -> Data? {
        guard capsule.count >= 12 else {
            return nil
        }
        let XioLeadVerseXio = Array(capsule.prefix(4))
        guard XioLeadVerseXio == lead else {
            return nil
        }
        let XioNonceVerseXio = UInt64(littleEndianBytesXio: Array(capsule[4..<12]))
        let XioBodyArchiveXio = capsule.dropFirst(12)
        return XioRetroWaveMaskXio(Data(XioBodyArchiveXio), domain: domain, nonce: XioNonceVerseXio, sealing: false)
    }
    
    private static func XioRetroWaveMaskXio(_ archive: Data, domain: String, nonce: UInt64, sealing: Bool) -> Data {
        let XioSaltVerseXio = Array((domain + "::cabaret").utf8) + XioRetroMasterVerseXio
        var XioSpinnerVerseXio = XioRetroSpinnerVerseXio(seed: XioForgeSeedXio(domain: domain, nonce: nonce))
        let XioBytesVerseXio = archive.enumerated().map { XioIndexVerseXio, XioByteVerseXio in
            let XioWaveVerseXio = XioSpinnerVerseXio.XioNextByteXio()
            let XioSaltByteVerseXio = XioSaltVerseXio[XioIndexVerseXio % XioSaltVerseXio.count]
            let XioShiftVerseXio = Int((XioWaveVerseXio ^ XioSaltByteVerseXio) & 0x07)
            let XioIndexByteVerseXio = UInt8(truncatingIfNeeded: XioIndexVerseXio & 0x1F)
            if sealing {
                let XioWarmByteVerseXio = XioByteVerseXio &+ XioIndexByteVerseXio
                let XioSpinByteVerseXio = XioRotateLeftXio(XioWarmByteVerseXio, by: XioShiftVerseXio)
                return XioSpinByteVerseXio ^ XioWaveVerseXio ^ XioSaltByteVerseXio
            }
            let XioSpinByteVerseXio = XioByteVerseXio ^ XioWaveVerseXio ^ XioSaltByteVerseXio
            let XioWarmByteVerseXio = XioRotateRightXio(XioSpinByteVerseXio, by: XioShiftVerseXio)
            return XioWarmByteVerseXio &- XioIndexByteVerseXio
        }
        return Data(XioBytesVerseXio)
    }
    
    private static func XioForgeSeedXio(domain: String, nonce: UInt64) -> UInt64 {
        var XioSeedVerseXio = nonce ^ 0xC6A4A7935BD1E995
        for XioByteVerseXio in XioRetroMasterVerseXio + Array(domain.utf8) {
            XioSeedVerseXio ^= UInt64(XioByteVerseXio)
            XioSeedVerseXio &*= 0x100000001B3
            XioSeedVerseXio = XioSeedVerseXio.rotateLeftXio(7) ^ 0x9E3779B97F4A7C15
        }
        return XioSeedVerseXio
    }
    
    private static func XioRetroHashXio(bytes: [UInt8]) -> UInt64 {
        var XioHashVerseXio: UInt64 = 0xcbf29ce484222325
        for XioByteVerseXio in bytes {
            XioHashVerseXio ^= UInt64(XioByteVerseXio)
            XioHashVerseXio &*= 0x100000001b3
            XioHashVerseXio = XioHashVerseXio.rotateLeftXio(5) ^ 0x517cc1b727220a95
        }
        return XioHashVerseXio
    }
    
    private static func XioRotateLeftXio(_ byte: UInt8, by shift: Int) -> UInt8 {
        let XioShiftVerseXio = shift & 7
        guard XioShiftVerseXio > 0 else {
            return byte
        }
        return (byte << XioShiftVerseXio) | (byte >> (8 - XioShiftVerseXio))
    }
    
    private static func XioRotateRightXio(_ byte: UInt8, by shift: Int) -> UInt8 {
        let XioShiftVerseXio = shift & 7
        guard XioShiftVerseXio > 0 else {
            return byte
        }
        return (byte >> XioShiftVerseXio) | (byte << (8 - XioShiftVerseXio))
    }
}

private struct XioRetroSpinnerVerseXio {
    
    private var XioStateVerseXio: UInt64
    
    init(seed: UInt64) {
        XioStateVerseXio = seed == 0 ? 0xA0761D6478BD642F : seed
    }
    
    mutating func XioNextByteXio() -> UInt8 {
        XioStateVerseXio &+= 0x9E3779B97F4A7C15
        var XioMixerVerseXio = XioStateVerseXio
        XioMixerVerseXio = (XioMixerVerseXio ^ (XioMixerVerseXio >> 30)) &* 0xBF58476D1CE4E5B9
        XioMixerVerseXio = (XioMixerVerseXio ^ (XioMixerVerseXio >> 27)) &* 0x94D049BB133111EB
        XioMixerVerseXio ^= XioMixerVerseXio >> 31
        return UInt8(truncatingIfNeeded: XioMixerVerseXio ^ (XioMixerVerseXio >> 19) ^ (XioMixerVerseXio >> 41))
    }
}

private extension UInt64 {
    
    func rotateLeftXio(_ shift: Int) -> UInt64 {
        let XioShiftVerseXio = shift & 63
        guard XioShiftVerseXio > 0 else {
            return self
        }
        return (self << XioShiftVerseXio) | (self >> (64 - XioShiftVerseXio))
    }
    
    var littleEndianBytesXio: [UInt8] {
        withUnsafeBytes(of: self.littleEndian, Array.init)
    }
    
    init(littleEndianBytesXio bytes: [UInt8]) {
        precondition(bytes.count == 8)
        self = bytes.enumerated().reduce(0) { XioResultVerseXio, XioPieceVerseXio in
            XioResultVerseXio | (UInt64(XioPieceVerseXio.element) << (UInt64(XioPieceVerseXio.offset) * 8))
        }
    }
}
