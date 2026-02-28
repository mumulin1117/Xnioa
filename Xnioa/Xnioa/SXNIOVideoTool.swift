//
//  SXNIOVideoTool.swift
//  Xnioa
//
//  Created by mumu on 2026/2/28.
//

import AVFoundation
import UIKit

class SXNIOVideoTool {
    
    static var sxnioThumbnailCache = NSCache<NSString, UIImage>()

    static func sxnioFetchThumbnail(from sxnioPath: String, completion: @escaping (UIImage?) -> Void) {
       
        if let sxnioCachedImage = sxnioThumbnailCache.object(forKey: sxnioPath as NSString) {
            completion(sxnioCachedImage)
            return
        }
        
        DispatchQueue.global().async {
            let sxnioURL = URL(fileURLWithPath: sxnioPath)
            let sxnioAsset = AVAsset(url: sxnioURL)
            let sxnioGenerator = AVAssetImageGenerator(asset: sxnioAsset)
            
          
            sxnioGenerator.appliesPreferredTrackTransform = true
          
            let sxnioTime = CMTime(seconds: 1.0, preferredTimescale: 600)
            
            do {
                let sxnioCGImage = try sxnioGenerator.copyCGImage(at: sxnioTime, actualTime: nil)
                let sxnioImage = UIImage(cgImage: sxnioCGImage)
               
                sxnioThumbnailCache.setObject(sxnioImage, forKey: sxnioPath as NSString)
                DispatchQueue.main.async {
                    completion(sxnioImage)
                }
            } catch {
                print("sxnio error: Failed to extract thumbnail - \(error)")
                DispatchQueue.main.async { completion(nil) }
            }
        }
    }
}
