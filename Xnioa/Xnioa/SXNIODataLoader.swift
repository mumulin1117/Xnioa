//
//  SXNIODataLoader.swift
//  Xnioa
//
//  Created by mumu on 2026/2/27.
//

import UIKit

class SXNIODataLoader {
    
    /// 获取 plist 列表数据并转化
    /// - Parameter sxnioResourceName: plist 文件名（不需要加 .plist 后缀）
    static func sxnioFetchGalaRegistry(sxnioResourceName: String = "xnioainfoda") -> [XioGalaEntryXio] {
        
        // 1. 定位本地资源路径
        guard let sxnioPath = Bundle.main.path(forResource: sxnioResourceName, ofType: "plist") else {
            return []
        }
        
        do {
            // 2. 将文件转化为 Data
            let sxnioData = try Data(contentsOf: URL(fileURLWithPath: sxnioPath))
            
            // 3. 使用 PropertyListDecoder 进行解码
            let sxnioDecoder = PropertyListDecoder()
            let sxnioEntries = try sxnioDecoder.decode([XioGalaEntryXio].self, from: sxnioData)
            
            return sxnioEntries
            
        } catch {
            return []
        }
    }
}
