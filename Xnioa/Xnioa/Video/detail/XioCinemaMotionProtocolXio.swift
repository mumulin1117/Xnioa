//
//  XioCinemaMotionProtocolXio.swift
//  Xnioa
//
//  Created by Xnioa on 2026/3/4.
//

import UIKit
import AVFoundation

protocol XioCinemaMotionProtocolXio: AnyObject {
    var XioCinemaPlayerXio: AVPlayer? { get set }
    var XioCinemaLayerXio: AVPlayerLayer? { get set }
    var XioIsCinemaPlayingXio: Bool { get set }
    
    func XioInitalizeCinemaXio(in container: UIView, resource: String)
    func XioToggleMotionStateXio(sender: UIButton)
    func XioTerminateCinemaXio()
}

// 核心逻辑抽离：协议扩展
extension XioCinemaMotionProtocolXio where Self: UIViewController {
    
    func XioInitalizeCinemaXio(in container: UIView, resource: String) {
        guard let XioPathXio = Bundle.main.path(forResource: resource, ofType: "mp4") else { return }
        let XioURLXio = URL(fileURLWithPath: XioPathXio)
        let XioItemXio = AVPlayerItem(url: XioURLXio)
        let XioPlayerXio = AVPlayer(playerItem: XioItemXio)
        let XioLayerXio = AVPlayerLayer(player: XioPlayerXio)
        
        XioLayerXio.frame = container.bounds
        XioLayerXio.videoGravity = .resizeAspectFill
        XioLayerXio.isHidden = true
        container.layer.insertSublayer(XioLayerXio, at: 0)
        
        self.XioCinemaPlayerXio = XioPlayerXio
        self.XioCinemaLayerXio = XioLayerXio
        
        // 循环播放
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: XioItemXio, queue: .main) { _ in
            XioPlayerXio.seek(to: .zero)
            XioPlayerXio.play()
        }
    }
    
    func XioToggleMotionStateXio(sender: UIButton) {
        guard let XioPlayerXio = XioCinemaPlayerXio, let XioLayerXio = XioCinemaLayerXio else { return }
        
        XioIsCinemaPlayingXio.toggle()
        
        if XioIsCinemaPlayingXio {
            XioLayerXio.isHidden = false
            XioPlayerXio.play()
            sender.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        } else {
            XioPlayerXio.pause()
            sender.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        }
    }
    
    func XioTerminateCinemaXio() {
        XioCinemaPlayerXio?.pause()
        XioCinemaPlayerXio = nil
        XioCinemaLayerXio?.removeFromSuperlayer()
        NotificationCenter.default.removeObserver(self)
    }
}
