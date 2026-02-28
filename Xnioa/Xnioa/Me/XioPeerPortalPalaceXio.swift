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
    var usier: XioGalaEntryXio
    init(usiersd:XioGalaEntryXio) {
       
        self.usier = usiersd
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
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
        XioFaceOrbitXio.image = UIImage(named: self.usier.XioAvatarXio)
        
        
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
        XioPartnerDataXio = XioPeerProfileEntityXio(XioPartnerNameXio: usier.XioAliasXio, XioFanCountXio: Int.random(in: 0...3), XioFocusCountXio: Int.random(in: 1...3), XioIntroTextXio: usier.XioMottoXio, XioAvatarTokenXio: "", XioIsFocusedXio: false)
        
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
        
        
        XioHandleLabelXio.text = XioPartnerDataXio?.XioPartnerNameXio
        XioSocialMetricsLabelXio.text = "\(XioPartnerDataXio?.XioFanCountXio ?? 0) Followers   \(XioPartnerDataXio?.XioFocusCountXio ?? 0) Following"
        
        if XioCurrentTabXio == 0 {
            
            let XioFakePostXio = XioPartyViewXio()
        let roromda = usier
        XioFakePostXio.XioConfigureWithDataXio(jai: roromda)
        XioFakePostXio.XioMainVisualXio.image = UIImage.init(named: roromda.XioRoomCover)
            
        XioFeedShelfXio.addArrangedSubview(XioFakePostXio)
        }else{
            let XioFakePostXio = XioVisualPostCellXio()
            XioFakePostXio.XioSyncEntityXio(usier)
        XioFeedShelfXio.addArrangedSubview(XioFakePostXio)
        }
            
        
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

class XioPartyViewXio: UIView {
    
    private let XioCardBaseXio = UIImageView(image: UIImage(named: "XioCardBaseXio"))
     let XioMainVisualXio = UIImageView()
    
    private let XioStatusBadgeXio = UIView()
    private let XioGreenDotXio = UIView()
    private let XioOnlineLabelXio = UILabel()
    
    private let XioInfoBarXio = UIView()
    private let XioUserThumbXio = UIImageView()
    private let XioUserNameXio = UILabel()
    private let XioSparkleIconXio = UIImageView(image: UIImage(systemName: "sparkles"))
    private let XioThemeTitleXio = UILabel()
    
    private let XioHotPanelXio = UIView()
    private let XioFireIconXio = UIImageView(image: UIImage(systemName: "flame.fill"))
    private let XioHotCountXio = UILabel()
    private let XioAudienceStackXio = UIStackView()
    
    private let XioWScaleXio = UIScreen.main.bounds.width / 375
    private let XioHScaleXio = UIScreen.main.bounds.height / 812

    override init(frame: CGRect) {
        super.init(frame: frame)
        XioBuildCellStructureXio()
        XioApplyThemeStyleXio()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func XioBuildCellStructureXio() {
        [XioCardBaseXio, XioMainVisualXio, XioStatusBadgeXio, XioInfoBarXio, XioHotPanelXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
        
        XioStatusBadgeXio.addSubview(XioGreenDotXio)
        XioStatusBadgeXio.addSubview(XioOnlineLabelXio)
        XioGreenDotXio.translatesAutoresizingMaskIntoConstraints = false
        XioOnlineLabelXio.translatesAutoresizingMaskIntoConstraints = false
        
        [XioUserThumbXio, XioUserNameXio, XioSparkleIconXio, XioThemeTitleXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioInfoBarXio.addSubview($0)
        }
        
        [XioFireIconXio, XioHotCountXio, XioAudienceStackXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioHotPanelXio.addSubview($0)
        }
        XioMainVisualXio.contentMode = .scaleAspectFill
        NSLayoutConstraint.activate([
            XioCardBaseXio.topAnchor.constraint(equalTo: self.topAnchor),
            XioCardBaseXio.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            XioCardBaseXio.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            XioCardBaseXio.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            XioMainVisualXio.topAnchor.constraint(equalTo: self.topAnchor, constant: 10 * XioHScaleXio),
            XioMainVisualXio.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10 * XioWScaleXio),
            XioMainVisualXio.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10 * XioHScaleXio),
            XioMainVisualXio.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80 * XioWScaleXio),
            
             
            
            XioGreenDotXio.leadingAnchor.constraint(equalTo: XioStatusBadgeXio.leadingAnchor, constant: 8),
            XioGreenDotXio.centerYAnchor.constraint(equalTo: XioStatusBadgeXio.centerYAnchor),
            XioGreenDotXio.widthAnchor.constraint(equalToConstant: 6),
            XioGreenDotXio.heightAnchor.constraint(equalToConstant: 6),
            
            XioOnlineLabelXio.leadingAnchor.constraint(equalTo: XioGreenDotXio.trailingAnchor, constant: 4),
            XioOnlineLabelXio.trailingAnchor.constraint(equalTo: XioStatusBadgeXio.trailingAnchor, constant: -8),
            XioOnlineLabelXio.centerYAnchor.constraint(equalTo: XioStatusBadgeXio.centerYAnchor),
            
            XioInfoBarXio.leadingAnchor.constraint(equalTo: XioMainVisualXio.leadingAnchor, constant: 8),
            XioInfoBarXio.bottomAnchor.constraint(equalTo: XioMainVisualXio.bottomAnchor, constant: -8),
            XioInfoBarXio.trailingAnchor.constraint(equalTo: XioMainVisualXio.trailingAnchor, constant: -8),
            XioInfoBarXio.heightAnchor.constraint(equalToConstant: 30),
            
            XioStatusBadgeXio.bottomAnchor.constraint(equalTo: XioInfoBarXio.topAnchor, constant: -10),
            XioStatusBadgeXio.leadingAnchor.constraint(equalTo: XioMainVisualXio.leadingAnchor, constant: 10),
            XioStatusBadgeXio.heightAnchor.constraint(equalToConstant: 22),
          
            
            XioUserThumbXio.leadingAnchor.constraint(equalTo: XioInfoBarXio.leadingAnchor,constant: 15),
            XioUserThumbXio.centerYAnchor.constraint(equalTo: XioInfoBarXio.centerYAnchor),
            XioUserThumbXio.widthAnchor.constraint(equalToConstant: 30),
            XioUserThumbXio.heightAnchor.constraint(equalToConstant: 30),
            
            XioUserNameXio.leadingAnchor.constraint(equalTo: XioUserThumbXio.trailingAnchor, constant: 5),
            XioUserNameXio.centerYAnchor.constraint(equalTo: XioInfoBarXio.centerYAnchor),
            
            XioSparkleIconXio.leadingAnchor.constraint(equalTo: XioUserNameXio.trailingAnchor, constant: 4),
            XioSparkleIconXio.centerYAnchor.constraint(equalTo: XioInfoBarXio.centerYAnchor),
            XioSparkleIconXio.widthAnchor.constraint(equalToConstant: 12),
            XioSparkleIconXio.heightAnchor.constraint(equalToConstant: 12),
            
            XioThemeTitleXio.leadingAnchor.constraint(equalTo: XioSparkleIconXio.trailingAnchor, constant: 4),
            XioThemeTitleXio.centerYAnchor.constraint(equalTo: XioInfoBarXio.centerYAnchor),
            XioThemeTitleXio.trailingAnchor.constraint(lessThanOrEqualTo: XioInfoBarXio.trailingAnchor),
            
            XioHotPanelXio.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            XioHotPanelXio.bottomAnchor.constraint(equalTo: XioMainVisualXio.bottomAnchor),
            XioHotPanelXio.widthAnchor.constraint(equalToConstant: 60),
            XioHotPanelXio.heightAnchor.constraint(equalToConstant: 70),
            
            XioFireIconXio.topAnchor.constraint(equalTo: XioHotPanelXio.topAnchor, constant: 5),
            XioFireIconXio.centerXAnchor.constraint(equalTo: XioHotPanelXio.centerXAnchor),
            XioFireIconXio.widthAnchor.constraint(equalToConstant: 16),
            XioFireIconXio.heightAnchor.constraint(equalToConstant: 16),
            
            XioHotCountXio.topAnchor.constraint(equalTo: XioFireIconXio.bottomAnchor, constant: 4),
            XioHotCountXio.centerXAnchor.constraint(equalTo: XioHotPanelXio.centerXAnchor),
            
            XioAudienceStackXio.bottomAnchor.constraint(equalTo: XioHotPanelXio.bottomAnchor, constant: -5),
            XioAudienceStackXio.centerXAnchor.constraint(equalTo: XioHotPanelXio.centerXAnchor),
            XioAudienceStackXio.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
    
    private func XioApplyThemeStyleXio() {
        XioMainVisualXio.layer.cornerRadius = 10
        XioMainVisualXio.clipsToBounds = true
        XioMainVisualXio.backgroundColor = .darkGray
        
        XioStatusBadgeXio.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        XioStatusBadgeXio.layer.cornerRadius = 11
        
        XioGreenDotXio.backgroundColor = .green
        XioGreenDotXio.layer.cornerRadius = 3
        
        XioOnlineLabelXio.font = .systemFont(ofSize: 11, weight: .medium)
        XioOnlineLabelXio.textColor = .white
        
        XioInfoBarXio.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        XioInfoBarXio.layer.cornerRadius = 15
        
        XioUserThumbXio.layer.cornerRadius = 15
        XioUserThumbXio.clipsToBounds = true
        XioUserThumbXio.backgroundColor = .lightGray
        
        XioUserNameXio.font = .systemFont(ofSize: 12, weight: .bold)
        XioUserNameXio.textColor = .white
        
        XioThemeTitleXio.font = .systemFont(ofSize: 12)
        XioThemeTitleXio.textColor = .white
        
        XioHotPanelXio.backgroundColor = UIColor(red: 0.9, green: 0.8, blue: 0.7, alpha: 1.0)
        XioHotPanelXio.layer.cornerRadius = 5
        
        XioFireIconXio.tintColor = .orange
        XioHotCountXio.font = .boldSystemFont(ofSize: 12)
        XioHotCountXio.textColor = .brown
        
        XioAudienceStackXio.axis = .horizontal
        XioAudienceStackXio.spacing = -5
    }

    func XioConfigureWithDataXio(jai:XioGalaEntryXio) {
        XioUserNameXio.text = jai.XioAliasXio
        XioThemeTitleXio.text = jai.XioRoomTItle
        XioOnlineLabelXio.text = "\(3) Online"
        XioHotCountXio.text = jai.XioHeatValueXio
        XioUserThumbXio.image = UIImage(named: jai.XioAvatarXio)
        XioAudienceStackXio.arrangedSubviews.forEach { $0.removeFromSuperview() }
        for _ in 0..<3 {
            let XioMiniAvatarXio = UIImageView()
            XioMiniAvatarXio.contentMode = .scaleAspectFill
            XioMiniAvatarXio.layer.masksToBounds = true
            XioMiniAvatarXio.layer.cornerRadius = 7.5
            XioMiniAvatarXio.layer.borderWidth = 1
            XioMiniAvatarXio.layer.borderColor = UIColor.white.cgColor
            XioMiniAvatarXio.translatesAutoresizingMaskIntoConstraints = false
            XioMiniAvatarXio.widthAnchor.constraint(equalToConstant: 15).isActive = true
            XioMiniAvatarXio.image = UIImage.init(named: "avarieou\(Int.random(in: 0...8))")
            XioAudienceStackXio.addArrangedSubview(XioMiniAvatarXio)
        }
    }
}









class XioVisualPostCellXio: UIView {
    private let XioMainFrameXio = UIView()
    private let XioAvatarXio = UIImageView()
    private let XioHandleXio = UILabel()
    
    
   
    
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
        
        [XioMainFrameXio, XioAvatarXio, XioHandleXio, XioHeroImageXio, XioCaptionXio, XioLikeBtnXio, XioChatBtnXio, XioGreetBtnXio].forEach {
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
    
    func XioSyncEntityXio(_ data: XioGalaEntryXio) {
        XioHandleXio.text = data.XioAliasXio
        XioCaptionXio.text = data.XioMoiveTitle
        
        XioAvatarXio.image = UIImage(named: data.XioAvatarXio)
    }
}
