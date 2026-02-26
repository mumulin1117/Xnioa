//
//  XioPeerPortalPalaceXio.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/24.
//

import UIKit
//他人主页
// MARK: - Data Architecture
struct XioPeerProfileEntityXio {
    let XioPartnerNameXio: String
    let XioFanCountXio: Int
    let XioFocusCountXio: Int
    let XioIntroTextXio: String
    let XioAvatarTokenXio: String
    var XioIsFocusedXio: Bool
}

// MARK: - Controller
class XioPeerPortalPalaceXio: UIViewController {
    
    private let XioMainScrollerXio = UIScrollView()
    private let XioCanvasXio = UIView()
    
    private let XioHeaderRackXio = UIView()
    private let XioRetreatBtnXio = UIButton()
    private let XioOptionBtnXio = UIButton()
    
    private let XioFaceOrbitXio = UIImageView()
    private let XioHandleLabelXio = UILabel()
    private let XioSocialMetricsLabelXio = UILabel()
    private let XioVideoCallTriggerXio = UIButton()
    
    private let XioSwitchDockXio = UIView()
    private let XioRoomTabXio = UIButton()
    private let XioVideoTabXio = UIButton()
    
    private let XioFeedShelfXio = UIStackView()
    private let XioActionDockXio = UIView()
    private let XioConnectBtnXio = UIButton()
    
    private var XioCurrentTabXio: Int = 0
    private var XioPartnerDataXio: XioPeerProfileEntityXio?
    
    private let XioWFactorXio = UIScreen.main.bounds.width / 375
    private let XioHFactorXio = UIScreen.main.bounds.height / 812

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        XioSetupBaseThemeXio()
        XioForgeArchitectureXio()
        XioTriggerDataPulseXio()
    }
    
    private func XioSetupBaseThemeXio() {
        view.backgroundColor = UIColor(white: 0.05, alpha: 1.0)
        XioMainScrollerXio.contentInsetAdjustmentBehavior = .never
    }
    
    private func XioForgeArchitectureXio() {
        XioMainScrollerXio.translatesAutoresizingMaskIntoConstraints = false
        XioCanvasXio.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(XioMainScrollerXio)
        XioMainScrollerXio.addSubview(XioCanvasXio)
        
        XioRetreatBtnXio.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        XioRetreatBtnXio.tintColor = .white
        XioRetreatBtnXio.addTarget(self, action: #selector(XioPerformRetreatXio), for: .touchUpInside)
        
        XioOptionBtnXio.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        XioOptionBtnXio.tintColor = .white
        XioOptionBtnXio.addTarget(self, action: #selector(XioInvokePolicyMenuXio), for: .touchUpInside)
        
        XioFaceOrbitXio.layer.cornerRadius = 35 * XioWFactorXio
        XioFaceOrbitXio.clipsToBounds = true
        XioFaceOrbitXio.backgroundColor = .darkGray
        
        XioHandleLabelXio.font = .systemFont(ofSize: 22, weight: .bold)
        XioHandleLabelXio.textColor = .white
        
        XioSocialMetricsLabelXio.font = .systemFont(ofSize: 14)
        XioSocialMetricsLabelXio.textColor = .lightGray
        
        XioVideoCallTriggerXio.setImage(UIImage(systemName: "video.fill"), for: .normal)
        XioVideoCallTriggerXio.tintColor = .white
        XioVideoCallTriggerXio.backgroundColor = .systemPurple
        XioVideoCallTriggerXio.layer.cornerRadius = 20 * XioWFactorXio
        XioVideoCallTriggerXio.addTarget(self, action: #selector(XioLaunchVisualCallXio), for: .touchUpInside)
        
        XioSwitchDockXio.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        XioSwitchDockXio.layer.cornerRadius = 8
        XioSwitchDockXio.layer.borderWidth = 1
        XioSwitchDockXio.layer.borderColor = UIColor.init(red: 182/255, green: 240/255, blue: 156/255, alpha: 1).cgColor
        
        XioSetupTabXio(XioRoomTabXio, title: "Room", tag: 0)
        XioSetupTabXio(XioVideoTabXio, title: "Video", tag: 1)
        
        XioFeedShelfXio.axis = .vertical
        XioFeedShelfXio.spacing = 15
        
        XioActionDockXio.backgroundColor = UIColor(white: 0.05, alpha: 0.9)
        XioConnectBtnXio.setBackgroundImage(UIImage.init(named: "connnectedMani"), for: .normal)
        XioConnectBtnXio.addTarget(self, action: #selector(XioEnterChatPortalXio), for: .touchUpInside)
        
        [XioHeaderRackXio, XioFaceOrbitXio, XioHandleLabelXio, XioSocialMetricsLabelXio, XioVideoCallTriggerXio, XioSwitchDockXio, XioFeedShelfXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioCanvasXio.addSubview($0)
        }
        
        XioHeaderRackXio.addSubview(XioRetreatBtnXio)
        XioHeaderRackXio.addSubview(XioOptionBtnXio)
        XioRetreatBtnXio.translatesAutoresizingMaskIntoConstraints = false
        XioOptionBtnXio.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(XioActionDockXio)
        XioActionDockXio.translatesAutoresizingMaskIntoConstraints = false
        XioActionDockXio.addSubview(XioConnectBtnXio)
        XioConnectBtnXio.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            XioMainScrollerXio.topAnchor.constraint(equalTo: view.topAnchor),
            XioMainScrollerXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioMainScrollerXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioMainScrollerXio.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            XioCanvasXio.topAnchor.constraint(equalTo: XioMainScrollerXio.topAnchor),
            XioCanvasXio.widthAnchor.constraint(equalTo: XioMainScrollerXio.widthAnchor),
            XioCanvasXio.bottomAnchor.constraint(equalTo: XioMainScrollerXio.bottomAnchor),
            
            XioHeaderRackXio.topAnchor.constraint(equalTo: XioCanvasXio.topAnchor, constant: 50 * XioHFactorXio),
            XioHeaderRackXio.leadingAnchor.constraint(equalTo: XioCanvasXio.leadingAnchor),
            XioHeaderRackXio.trailingAnchor.constraint(equalTo: XioCanvasXio.trailingAnchor),
            XioHeaderRackXio.heightAnchor.constraint(equalToConstant: 44),
            
            XioRetreatBtnXio.leadingAnchor.constraint(equalTo: XioHeaderRackXio.leadingAnchor, constant: 15),
            XioRetreatBtnXio.centerYAnchor.constraint(equalTo: XioHeaderRackXio.centerYAnchor),
            
            XioOptionBtnXio.trailingAnchor.constraint(equalTo: XioHeaderRackXio.trailingAnchor, constant: -15),
            XioOptionBtnXio.centerYAnchor.constraint(equalTo: XioHeaderRackXio.centerYAnchor),
            
            XioFaceOrbitXio.topAnchor.constraint(equalTo: XioHeaderRackXio.bottomAnchor, constant: 10),
            XioFaceOrbitXio.leadingAnchor.constraint(equalTo: XioCanvasXio.leadingAnchor, constant: 20),
            XioFaceOrbitXio.widthAnchor.constraint(equalToConstant: 70 * XioWFactorXio),
            XioFaceOrbitXio.heightAnchor.constraint(equalToConstant: 70 * XioWFactorXio),
            
            XioVideoCallTriggerXio.trailingAnchor.constraint(equalTo: XioCanvasXio.trailingAnchor, constant: -20),
            XioVideoCallTriggerXio.centerYAnchor.constraint(equalTo: XioFaceOrbitXio.centerYAnchor),
            XioVideoCallTriggerXio.widthAnchor.constraint(equalToConstant: 40 * XioWFactorXio),
            XioVideoCallTriggerXio.heightAnchor.constraint(equalToConstant: 40 * XioWFactorXio),
            
            XioHandleLabelXio.topAnchor.constraint(equalTo: XioFaceOrbitXio.topAnchor, constant: 10),
            XioHandleLabelXio.leadingAnchor.constraint(equalTo: XioFaceOrbitXio.trailingAnchor,constant: 8),
            
            XioSocialMetricsLabelXio.topAnchor.constraint(equalTo: XioHandleLabelXio.bottomAnchor, constant: 4),
            XioSocialMetricsLabelXio.leadingAnchor.constraint(equalTo: XioHandleLabelXio.leadingAnchor),
            
            XioSwitchDockXio.topAnchor.constraint(equalTo: XioSocialMetricsLabelXio.bottomAnchor, constant: 35 * XioHFactorXio),
            XioSwitchDockXio.leadingAnchor.constraint(equalTo: XioCanvasXio.leadingAnchor, constant: 20),
            XioSwitchDockXio.trailingAnchor.constraint(equalTo: XioCanvasXio.trailingAnchor, constant: -20),
            XioSwitchDockXio.heightAnchor.constraint(equalToConstant: 45 * XioHFactorXio),
            
            XioFeedShelfXio.topAnchor.constraint(equalTo: XioSwitchDockXio.bottomAnchor, constant: 20),
            XioFeedShelfXio.leadingAnchor.constraint(equalTo: XioCanvasXio.leadingAnchor, constant: 20),
            XioFeedShelfXio.trailingAnchor.constraint(equalTo: XioCanvasXio.trailingAnchor, constant: -20),
            XioFeedShelfXio.bottomAnchor.constraint(equalTo: XioCanvasXio.bottomAnchor, constant: -100),
            
            XioActionDockXio.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            XioActionDockXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioActionDockXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioActionDockXio.heightAnchor.constraint(equalToConstant: 90 * XioHFactorXio),
            
            XioConnectBtnXio.topAnchor.constraint(equalTo: XioActionDockXio.topAnchor, constant: 10),
            XioConnectBtnXio.centerXAnchor.constraint(equalTo: XioActionDockXio.centerXAnchor),
            XioConnectBtnXio.widthAnchor.constraint(equalTo: XioActionDockXio.widthAnchor, multiplier: 0.9),
            XioConnectBtnXio.heightAnchor.constraint(equalToConstant: 50 * XioHFactorXio)
        ])
        
        XioAssembleTabItemsXio()
    }
    
    private func XioSetupTabXio(_ btn: UIButton, title: String, tag: Int) {
        btn.setTitle(title, for: .normal)
        btn.tag = tag
        btn.addTarget(self, action: #selector(XioToggleContentTabXio(_:)), for: .touchUpInside)
    }
    
    private func XioAssembleTabItemsXio() {
        let XioStackXio = UIStackView(arrangedSubviews: [XioRoomTabXio, XioVideoTabXio])
        XioStackXio.axis = .horizontal
        XioStackXio.distribution = .fillEqually
        XioStackXio.translatesAutoresizingMaskIntoConstraints = false
        XioSwitchDockXio.addSubview(XioStackXio)
        NSLayoutConstraint.activate([
            XioStackXio.topAnchor.constraint(equalTo: XioSwitchDockXio.topAnchor),
            XioStackXio.bottomAnchor.constraint(equalTo: XioSwitchDockXio.bottomAnchor),
            XioStackXio.leadingAnchor.constraint(equalTo: XioSwitchDockXio.leadingAnchor),
            XioStackXio.trailingAnchor.constraint(equalTo: XioSwitchDockXio.trailingAnchor)
        ])
        XioRefreshTabStateXio()
    }
    
    @objc private func XioToggleContentTabXio(_ sender: UIButton) {
        XioCurrentTabXio = sender.tag
        XioRefreshTabStateXio()
        XioTriggerDataPulseXio()
    }
    
    private func XioRefreshTabStateXio() {
        [XioRoomTabXio, XioVideoTabXio].forEach {
            $0.backgroundColor = ($0.tag == XioCurrentTabXio) ? UIColor.init(red: 182/255, green: 240/255, blue: 156/255, alpha: 1) : .clear
            $0.setTitleColor(($0.tag == XioCurrentTabXio) ? .black : .white, for: .normal)
        }
    }
    
    private func XioTriggerDataPulseXio() {
        XioFeedShelfXio.arrangedSubviews.forEach { $0.removeFromSuperview() }
        XioPartnerDataXio = XioPeerProfileEntityXio(XioPartnerNameXio: "Jean Brooks", XioFanCountXio: 1, XioFocusCountXio: 1, XioIntroTextXio: "Soft lights, old songs...", XioAvatarTokenXio: "", XioIsFocusedXio: false)
        
        XioHandleLabelXio.text = XioPartnerDataXio?.XioPartnerNameXio
        XioSocialMetricsLabelXio.text = "\(XioPartnerDataXio?.XioFanCountXio ?? 0) Followers   \(XioPartnerDataXio?.XioFocusCountXio ?? 0) Following"
        
      
            let XioFakePostXio = XioVisualPostCellXio()

            XioFeedShelfXio.addArrangedSubview(XioFakePostXio)
        
    }
    
    @objc private func XioPerformRetreatXio() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func XioEnterChatPortalXio() {
        let XioChatXio = XioWhisperPortalXio() // Replace with your XioWhisperPortalXio
        XioChatXio.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(XioChatXio, animated: true)
    }
    
    @objc private func XioLaunchVisualCallXio() {
        let XioCallXio = XioVerdeoCabyllPortalXio()
        XioCallXio.hidesBottomBarWhenPushed = true// Replace with your XioVideoCallPortalXio
        self.navigationController?.pushViewController(XioCallXio, animated: true)
    }
    
    @objc private func XioInvokePolicyMenuXio() {
        let XioSheetXio = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        XioSheetXio.addAction(UIAlertAction(title: "Block", style: .destructive))
        XioSheetXio.addAction(UIAlertAction(title: "Report", style: .default))
        XioSheetXio.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(XioSheetXio, animated: true)
    }
}




// MARK: - Post View Item
class XioVisualPostCellXio: UIView {
    private let XioMainFrameXio = UIView()
    private let XioAvatarXio = UIImageView()
    private let XioHandleXio = UILabel()
    let AccctoinCou = UIButton()//more
    
    let AcccTopersonCou = UIButton()//personto
    
    private let XioHeroImageXio = UIImageView()
    private let XioCaptionXio = UILabel()
    private let XioLikeBtnXio = UIImageView(image: UIImage(systemName: "heart"))
    private let XioChatBtnXio = UIImageView(image: UIImage(systemName: "message"))
    private let XioGreetBtnXio = UIButton()
    private let XioPlayBtnXio = UIImageView(image: UIImage(systemName: "play.circle.fill"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        XioSetupVisualsXio()
    }
    
    private func XioSetupVisualsXio() {
        XioMainFrameXio.backgroundColor = UIColor(white: 0.12, alpha: 1.0)
        XioMainFrameXio.layer.cornerRadius = 12
        AccctoinCou.setImage(UIImage.init(named: "AccctoinCou"), for: .normal)
        
        AcccTopersonCou.setImage(UIImage.init(named: "AcccTopersonCou"), for: .normal)
        
        
        
        XioAvatarXio.layer.cornerRadius = 15
        XioAvatarXio.clipsToBounds = true
        XioAvatarXio.backgroundColor = .lightGray
        
        XioHandleXio.font = .systemFont(ofSize: 15, weight: .semibold)
        XioHandleXio.textColor = .white
        
        XioHeroImageXio.contentMode = .scaleAspectFill
        XioHeroImageXio.clipsToBounds = true
        XioHeroImageXio.layer.cornerRadius = 8
        XioHeroImageXio.backgroundColor = .darkGray
        
        XioCaptionXio.font = .systemFont(ofSize: 14)
        XioCaptionXio.textColor = .lightGray
        XioCaptionXio.numberOfLines = 2
        
        XioGreetBtnXio.setTitle("Greet", for: .normal)
        XioGreetBtnXio.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        XioGreetBtnXio.backgroundColor = .systemPurple
        XioGreetBtnXio.layer.cornerRadius = 15
        
        XioPlayBtnXio.tintColor = .white
        XioLikeBtnXio.tintColor = .white
        XioChatBtnXio.tintColor = .white
        
        [XioMainFrameXio, XioAvatarXio, XioHandleXio,AcccTopersonCou,AccctoinCou, XioHeroImageXio, XioCaptionXio, XioLikeBtnXio, XioChatBtnXio, XioGreetBtnXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
        XioHeroImageXio.addSubview(XioPlayBtnXio)
        XioPlayBtnXio.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            XioMainFrameXio.topAnchor.constraint(equalTo: self.topAnchor),
            XioMainFrameXio.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            XioMainFrameXio.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            XioMainFrameXio.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            XioAvatarXio.topAnchor.constraint(equalTo: XioMainFrameXio.topAnchor, constant: 15),
            XioAvatarXio.leadingAnchor.constraint(equalTo: XioMainFrameXio.leadingAnchor, constant: 15),
            XioAvatarXio.widthAnchor.constraint(equalToConstant: 30),
            XioAvatarXio.heightAnchor.constraint(equalToConstant: 30),
            
            XioHandleXio.centerYAnchor.constraint(equalTo: XioAvatarXio.centerYAnchor),
            XioHandleXio.leadingAnchor.constraint(equalTo: XioAvatarXio.trailingAnchor, constant: 10),
            AcccTopersonCou.widthAnchor.constraint(equalToConstant: 25),
            AcccTopersonCou.heightAnchor.constraint(equalToConstant: 25),
            AcccTopersonCou.centerYAnchor.constraint(equalTo: XioAvatarXio.centerYAnchor),
            AcccTopersonCou.leadingAnchor.constraint(equalTo: XioHandleXio.trailingAnchor,constant: 10),
            
            AccctoinCou.widthAnchor.constraint(equalToConstant: 25),
            AccctoinCou.heightAnchor.constraint(equalToConstant: 25),
            AccctoinCou.centerYAnchor.constraint(equalTo: XioAvatarXio.centerYAnchor),
            AccctoinCou.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10),
            
            
            
            XioHeroImageXio.topAnchor.constraint(equalTo: XioAvatarXio.bottomAnchor, constant: 15),
            XioHeroImageXio.leadingAnchor.constraint(equalTo: XioMainFrameXio.leadingAnchor, constant: 15),
            XioHeroImageXio.trailingAnchor.constraint(equalTo: XioMainFrameXio.trailingAnchor, constant: -15),
            XioHeroImageXio.heightAnchor.constraint(equalToConstant: 320),
            
            XioPlayBtnXio.bottomAnchor.constraint(equalTo: XioHeroImageXio.bottomAnchor, constant: -15),
            XioPlayBtnXio.trailingAnchor.constraint(equalTo: XioHeroImageXio.trailingAnchor, constant: -15),
            XioPlayBtnXio.widthAnchor.constraint(equalToConstant: 40),
            XioPlayBtnXio.heightAnchor.constraint(equalToConstant: 40),
            
            XioCaptionXio.topAnchor.constraint(equalTo: XioHeroImageXio.bottomAnchor, constant: 12),
            XioCaptionXio.leadingAnchor.constraint(equalTo: XioMainFrameXio.leadingAnchor, constant: 15),
            XioCaptionXio.trailingAnchor.constraint(equalTo: XioMainFrameXio.trailingAnchor, constant: -15),
            
            XioLikeBtnXio.topAnchor.constraint(equalTo: XioCaptionXio.bottomAnchor, constant: 15),
            XioLikeBtnXio.leadingAnchor.constraint(equalTo: XioMainFrameXio.leadingAnchor, constant: 15),
            XioLikeBtnXio.widthAnchor.constraint(equalToConstant: 25),
            XioLikeBtnXio.heightAnchor.constraint(equalToConstant: 25),
            
            XioChatBtnXio.centerYAnchor.constraint(equalTo: XioLikeBtnXio.centerYAnchor),
            XioChatBtnXio.leadingAnchor.constraint(equalTo: XioLikeBtnXio.trailingAnchor, constant: 20),
            XioChatBtnXio.widthAnchor.constraint(equalToConstant: 25),
            XioChatBtnXio.heightAnchor.constraint(equalToConstant: 25),
            
            XioGreetBtnXio.centerYAnchor.constraint(equalTo: XioLikeBtnXio.centerYAnchor),
            XioGreetBtnXio.trailingAnchor.constraint(equalTo: XioMainFrameXio.trailingAnchor, constant: -15),
            XioGreetBtnXio.widthAnchor.constraint(equalToConstant: 85),
            XioGreetBtnXio.heightAnchor.constraint(equalToConstant: 40),
            XioGreetBtnXio.bottomAnchor.constraint(equalTo: XioMainFrameXio.bottomAnchor, constant: -15)
        ])
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    func XioSyncEntityXio(_ data: XioVideoEntityXio) {
        XioHandleXio.text = data.XioCreatorNameXio
        XioCaptionXio.text = data.XioIntroTextXio
    }
}
