//
//  SXNIODataLoader.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/27.
//

import UIKit

class SXNIODataLoader {

    static func sxnioFetchGalaRegistry(sxnioResourceName: String = "xnioainfoda") -> [XioGalaEntryXio] {
        
      
        guard let sxnioPath = Bundle.main.path(forResource: sxnioResourceName, ofType: "plist") else {
            return []
        }
        
        do {
        
            let sxnioData = try Data(contentsOf: URL(fileURLWithPath: sxnioPath))
            
          
            let sxnioDecoder = PropertyListDecoder()
            let sxnioEntries = try sxnioDecoder.decode([XioGalaEntryXio].self, from: sxnioData)
            
            return sxnioEntries
            
        } catch {
            return []
        }
    }
}
