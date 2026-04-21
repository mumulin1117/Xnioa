//
//  SXNIOVideoTool.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/28.
//

import AVFoundation
import UIKit

import UIKit
import AVFoundation

class XioVisualMediaPilotXio {
    
    static let XioPixelCacheXio = NSCache<NSString, UIImage>()

    static func XioExtractFrameXio(from XioResourceNameXio: String, XioResultXio: @escaping (UIImage?) -> Void) {
        
        if let XioCachedImageXio = XioPixelCacheXio.object(forKey: XioResourceNameXio as NSString) {
            XioResultXio(XioCachedImageXio)
            return
        }
        
        guard let XioBundlePathXio = Bundle.main.path(forResource: XioResourceNameXio, ofType: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMdqSn1JSHbnCwOce")) else {
            print(XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMUu3jntouRPz3m0fVr5rD5v1X812aygrp567R5vCpewD++DAnO1BrI1xRgdzqxLYn1vD") + XioResourceNameXio)
            XioResultXio(nil)
            return
        }
        
        let XioAssetURLXio = URL(fileURLWithPath: XioBundlePathXio)
        
        DispatchQueue.global(qos: .userInteractive).async {
            let XioMediaAssetXio = AVAsset(url: XioAssetURLXio)
            let XioFrameGeneratorXio = AVAssetImageGenerator(asset: XioMediaAssetXio)
            
      
            XioFrameGeneratorXio.appliesPreferredTrackTransform = true
           
            XioFrameGeneratorXio.requestedTimeToleranceBefore = .zero
            XioFrameGeneratorXio.requestedTimeToleranceAfter = .zero
            
            let XioCaptureTimeXio = CMTime(seconds: 1.0, preferredTimescale: 600)
            
            do {
                let XioCGRenderXio = try XioFrameGeneratorXio.copyCGImage(at: XioCaptureTimeXio, actualTime: nil)
                let XioFinalImageXio = UIImage(cgImage: XioCGRenderXio)
                
              
                XioPixelCacheXio.setObject(XioFinalImageXio, forKey: XioResourceNameXio as NSString)
                
                DispatchQueue.main.async {
                    XioResultXio(XioFinalImageXio)
                }
            } catch {
                print(XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMfiNZdzULfGI0eSiflELn1hYRp4Z04t+ix6G6MPxxn4RXUtAjw==") + error.localizedDescription)
                DispatchQueue.main.async { XioResultXio(nil) }
            }
        }
    }
}
