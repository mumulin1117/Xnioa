//
//  XioVintageGalaTheaterXio.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/25.
//

import UIKit

struct XioBalladMessageXio {
    let XioOratorNameXio: String
    let XioOratorAvatarXio: String
    let XioLyricContentXio: String
    let XioIsDivineSelfXio: Bool
}

class XioVintageGalaTheaterXio: XioResilienceAnchorXio {

    var paymeIngo:(String,UIImage)?
    var isCreaterr:Bool
    var usier: XioGalaEntryXio?
  
    
    init(iscreate:Bool, usiersd:XioGalaEntryXio?,info:(String,UIImage)?) {
        self.paymeIngo = info
        self.usier = usiersd
        self.isCreaterr = iscreate
        super.init(nibName: nil, bundle: nil)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
    
    
    private let XioAudienceStackXio = UIStackView()
    private let XioStageHeaderXio = UIView()
    private let XioAvatarXio = UIImageView()
    private let XioHandleXio = UILabel()
    private let AcccTopersonCou = UIButton()//personto
    

    private let XioGrandBackdropXio = UIImageView()
    private let XioConfettiLayerXio = UIView()
    
    private let XioExitStageTriggerXio = UIButton()
    private let XioGalaTitleTagXio = UILabel()
    private let XioAudienceOrbitXio = UIStackView()
    private let XioReportAbuseTriggerXio = UIButton()
    
    private let XioHostPodiumXio = UIView()
    private let XioHostAvatarXio = UIImageView()
    private let XioHostNameTagXio = UILabel()
    
    private let XioLyricStreamXio = UITableView()
    private let XioWhisperInputDockXio = UIView()
    private let XioLyricFieldXio = UITextField()
    private let XioTransmitTriggerXio = UIButton()
    
    private var XioChatHistoryXio: [XioBalladMessageXio] = []
    
    private let XioWidthRatioXio = UIScreen.main.bounds.width / 375
    private let XioHeightRatioXio = UIScreen.main.bounds.height / 812

    override func viewDidLoad() {
        super.viewDidLoad()
        XioReportAbuseTriggerXio.addTarget(self, action: #selector(XioReportStageXio), for: .touchUpInside)
        self.XioChatHistoryXio = isCreaterr ? [] :  [
            [
                XioBalladMessageXio(XioOratorNameXio: "Clara", XioOratorAvatarXio: "avarieou7", XioLyricContentXio: "Hello Everyone!", XioIsDivineSelfXio: false),
                XioBalladMessageXio(XioOratorNameXio: "Henry", XioOratorAvatarXio: "avarieou3", XioLyricContentXio: "Hello", XioIsDivineSelfXio: false),
                XioBalladMessageXio(XioOratorNameXio: "Evelyn", XioOratorAvatarXio: "avarieou4", XioLyricContentXio: "This Music Feels Like It Belongs To Another Time.", XioIsDivineSelfXio: false),
                XioBalladMessageXio(XioOratorNameXio: "Arthur", XioOratorAvatarXio: "avarieou2", XioLyricContentXio: "I Can Almost Picture Everyone Dancing In Dim Light.", XioIsDivineSelfXio: false)
            ].randomElement()!
        ]
        XioSetTheStageXio()
        XioForgeArchitectureXio()
        XioIgniteAtmosphereXio()
    }
    
    private func XioSetTheStageXio() {
        view.backgroundColor = .black
        XioGrandBackdropXio.image = isCreaterr ?  (paymeIngo?.1 ): UIImage(named: usier?.XioRoomScene ?? "picjkBg0")
        XioGrandBackdropXio.contentMode = .scaleAspectFill
        
        
        
        XioLyricStreamXio.backgroundColor = .clear
        XioLyricStreamXio.separatorStyle = .none
        XioLyricStreamXio.delegate = self
        XioLyricStreamXio.dataSource = self
        XioLyricStreamXio.register(XioLyricCellXio.self, forCellReuseIdentifier: "XioLyricCellXio")
        XioLyricStreamXio.showsVerticalScrollIndicator = false
    }
    
    private func XioForgeArchitectureXio() {
        [XioGrandBackdropXio, XioConfettiLayerXio, XioStageHeaderXio, XioHostPodiumXio, XioLyricStreamXio, XioWhisperInputDockXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        XioHostPodiumXio.addSubview(XioAvatarXio)
        XioHostPodiumXio.addSubview(XioHandleXio)
        XioHostPodiumXio.addSubview(AcccTopersonCou)
        
        XioAvatarXio.translatesAutoresizingMaskIntoConstraints = false
        XioHandleXio.translatesAutoresizingMaskIntoConstraints = false
        AcccTopersonCou.translatesAutoresizingMaskIntoConstraints = false
        AcccTopersonCou.setImage(UIImage.init(named: "AcccTopersonCou"), for: .normal)
        
        AcccTopersonCou.isHidden = isCreaterr ? true : false
        XioAvatarXio.layer.cornerRadius = 20
        XioAvatarXio.clipsToBounds = true
        XioAvatarXio.backgroundColor = .lightGray
        XioAvatarXio.image = UIImage(named: usier?.XioAvatarXio ?? "")
        
        XioHandleXio.font = .systemFont(ofSize: 15, weight: .semibold)
        XioHandleXio.textColor = .white
        
        XioHostNameTagXio.font = .systemFont(ofSize: 15, weight: .semibold)
        XioHostNameTagXio.textColor = .white
        
        
        XioHandleXio.text = isCreaterr ? "Me" : self.usier?.XioAliasXio ?? ""
        
        XioExitStageTriggerXio.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        XioExitStageTriggerXio.tintColor = .white
        XioExitStageTriggerXio.addTarget(self, action: #selector(XioRetreatFromStageXio), for: .touchUpInside)
        
        XioGalaTitleTagXio.text = "Them:  "  + ((isCreaterr ? paymeIngo?.0 : usier?.XioRoomTItle) ?? "")
        XioGalaTitleTagXio.textColor = .white
        XioGalaTitleTagXio.font = .systemFont(ofSize: 20 * XioWidthRatioXio, weight: .bold)
        
        XioReportAbuseTriggerXio.setImage(UIImage(systemName: "exclamationmark.circle"), for: .normal)
        XioReportAbuseTriggerXio.tintColor = .white
        
        XioHostPodiumXio.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        XioHostPodiumXio.layer.cornerRadius = 20 * XioHeightRatioXio
        
        XioWhisperInputDockXio.backgroundColor = UIColor(white: 0.2, alpha: 0.8)
        XioWhisperInputDockXio.layer.cornerRadius = 20 * XioHeightRatioXio
        
        XioLyricFieldXio.placeholder = "Say something"
        XioLyricFieldXio.textColor = .white
        XioLyricFieldXio.attributedPlaceholder = NSAttributedString(string: "Say something", attributes: [.foregroundColor: UIColor.lightGray])
        
        XioTransmitTriggerXio.setImage(UIImage(named: "Group Plainegreen"), for: .normal)
        XioTransmitTriggerXio.tintColor = .systemGreen
        XioTransmitTriggerXio.addTarget(self, action: #selector(XioBroadcastLyricXio), for: .touchUpInside)
        
        [XioExitStageTriggerXio, XioGalaTitleTagXio,XioAudienceStackXio, XioReportAbuseTriggerXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioStageHeaderXio.addSubview($0)
        }
        
        [XioLyricFieldXio, XioTransmitTriggerXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioWhisperInputDockXio.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            XioGrandBackdropXio.topAnchor.constraint(equalTo: view.topAnchor),
            XioGrandBackdropXio.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            XioGrandBackdropXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioGrandBackdropXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            XioStageHeaderXio.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            XioStageHeaderXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioStageHeaderXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioStageHeaderXio.heightAnchor.constraint(equalToConstant: 60 * XioHeightRatioXio),
            
            
            
            
            XioAvatarXio.leadingAnchor.constraint(equalTo: XioHostPodiumXio.leadingAnchor),
            XioAvatarXio.centerYAnchor.constraint(equalTo: XioHostPodiumXio.centerYAnchor),
            XioAvatarXio.widthAnchor.constraint(equalToConstant: 40),
            XioAvatarXio.heightAnchor.constraint(equalToConstant: 40),
            
            XioHandleXio.leadingAnchor.constraint(equalTo: XioAvatarXio.trailingAnchor,constant: 8),
            XioHandleXio.centerYAnchor.constraint(equalTo: XioHostPodiumXio.centerYAnchor),
            XioHandleXio.widthAnchor.constraint(equalToConstant: 45),
            AcccTopersonCou.widthAnchor.constraint(equalToConstant: 25),
            AcccTopersonCou.heightAnchor.constraint(equalToConstant: 25),
            AcccTopersonCou.centerYAnchor.constraint(equalTo: XioHostPodiumXio.centerYAnchor),
            AcccTopersonCou.trailingAnchor.constraint(equalTo: XioHostPodiumXio.trailingAnchor, constant: 2),
            
            
            XioExitStageTriggerXio.leadingAnchor.constraint(equalTo: XioStageHeaderXio.leadingAnchor, constant: 15 * XioWidthRatioXio),
            XioExitStageTriggerXio.centerYAnchor.constraint(equalTo: XioStageHeaderXio.centerYAnchor),
            
            XioGalaTitleTagXio.leadingAnchor.constraint(equalTo: XioExitStageTriggerXio.trailingAnchor, constant: 12),
            XioGalaTitleTagXio.centerYAnchor.constraint(equalTo: XioStageHeaderXio.centerYAnchor),
            
            
            XioAudienceStackXio.trailingAnchor.constraint(equalTo: XioReportAbuseTriggerXio.leadingAnchor, constant: -10),
            XioAudienceStackXio.centerYAnchor.constraint(equalTo: XioGalaTitleTagXio.centerYAnchor),
            XioAudienceStackXio.heightAnchor.constraint(equalToConstant: 15),
            XioAudienceStackXio.widthAnchor.constraint(equalToConstant: 45),
            
            
            XioReportAbuseTriggerXio.trailingAnchor.constraint(equalTo: XioStageHeaderXio.trailingAnchor, constant: -15 * XioWidthRatioXio),
            XioReportAbuseTriggerXio.centerYAnchor.constraint(equalTo: XioStageHeaderXio.centerYAnchor),
            
            XioHostPodiumXio.topAnchor.constraint(equalTo: XioStageHeaderXio.bottomAnchor, constant: 20 * XioHeightRatioXio),
            XioHostPodiumXio.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * XioWidthRatioXio),
            XioHostPodiumXio.widthAnchor.constraint(equalToConstant: 120 * XioWidthRatioXio),
            XioHostPodiumXio.heightAnchor.constraint(equalToConstant: 40 * XioHeightRatioXio),
            
            XioLyricStreamXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioLyricStreamXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioLyricStreamXio.bottomAnchor.constraint(equalTo: XioWhisperInputDockXio.topAnchor, constant: -10),
            XioLyricStreamXio.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35),
            
            XioWhisperInputDockXio.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            XioWhisperInputDockXio.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * XioWidthRatioXio),
            XioWhisperInputDockXio.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * XioWidthRatioXio),
            XioWhisperInputDockXio.heightAnchor.constraint(equalToConstant: 50 * XioHeightRatioXio),
            
            XioLyricFieldXio.leadingAnchor.constraint(equalTo: XioWhisperInputDockXio.leadingAnchor, constant: 15),
            XioLyricFieldXio.trailingAnchor.constraint(equalTo: XioTransmitTriggerXio.leadingAnchor, constant: -10),
            XioLyricFieldXio.centerYAnchor.constraint(equalTo: XioWhisperInputDockXio.centerYAnchor),
            
            XioTransmitTriggerXio.trailingAnchor.constraint(equalTo: XioWhisperInputDockXio.trailingAnchor, constant: -10),
            XioTransmitTriggerXio.centerYAnchor.constraint(equalTo: XioWhisperInputDockXio.centerYAnchor),
            XioTransmitTriggerXio.widthAnchor.constraint(equalToConstant: 30 * XioWidthRatioXio),
            
          
        ])
        if isCreaterr {
            return
        }
        
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
    
    private func XioIgniteAtmosphereXio() {
        let XioEmitterXio = CAEmitterLayer()
        XioEmitterXio.emitterPosition = CGPoint(x: view.center.x, y: -50)
        XioEmitterXio.emitterShape = .line
        XioEmitterXio.emitterSize = CGSize(width: view.frame.width, height: 1)
        
        let XioFlakeXio = CAEmitterCell()
        XioFlakeXio.birthRate = 2
        XioFlakeXio.lifetime = 10.0
        XioFlakeXio.velocity = 50
        XioFlakeXio.emissionRange = .pi
        XioFlakeXio.contents = UIImage(systemName: "sparkle")?.tinted(with: .systemYellow)?.cgImage
        XioFlakeXio.scale = 0.1
        XioFlakeXio.scaleRange = 0.2
        
        XioEmitterXio.emitterCells = [XioFlakeXio]
        XioConfettiLayerXio.layer.addSublayer(XioEmitterXio)
    }
    
    @objc private func XioBroadcastLyricXio() {
        guard let XioTextXio = XioLyricFieldXio.text, !XioTextXio.isEmpty else {
            
            let sxnioAlert = UIAlertController(title: nil, message: "Please enter your contetnt at first!", preferredStyle: .alert)
            sxnioAlert.addAction(UIAlertAction(title: "OK", style: .default))
            present(sxnioAlert, animated: true)
            return
        }
        
        let XioNewMessageXio = XioBalladMessageXio(XioOratorNameXio: "Me", XioOratorAvatarXio: XioGovernanceHubXio.XioPrincipalXio.XioActiveProfileXio?.XioAvatarXio ?? "", XioLyricContentXio: XioTextXio, XioIsDivineSelfXio: true)
        XioChatHistoryXio.append(XioNewMessageXio)
        
        XioLyricFieldXio.text =  ""
        XioLyricStreamXio.reloadData()
        
        let XioPathXio = IndexPath(row: XioChatHistoryXio.count - 1, section: 0)
        XioLyricStreamXio.scrollToRow(at: XioPathXio, at: .bottom, animated: true)
    }
    
    @objc private func XioRetreatFromStageXio() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    @objc private func XioReportStageXio() {
        navigationController?.pushViewController(XioSafetyAuditPilotXio(), animated: true)
    }
}

extension XioVintageGalaTheaterXio: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return XioChatHistoryXio.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let XioCellXio = tableView.dequeueReusableCell(withIdentifier: "XioLyricCellXio", for: indexPath) as! XioLyricCellXio
        XioCellXio.XioSyncLyricXio(XioChatHistoryXio[indexPath.row])
        return XioCellXio
    }
}

class XioLyricCellXio: UITableViewCell {
    private let XioBubbleVesselXio = UIView()
    private let XioAvatarOrbitXio = UIImageView()
    private let XioLyricLabelXio = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        XioConstructCellXio()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func XioConstructCellXio() {
        backgroundColor = .clear
        selectionStyle = .none
        
        XioBubbleVesselXio.backgroundColor = UIColor.white.withAlphaComponent(0.15)
        XioBubbleVesselXio.layer.cornerRadius = 12
        
        XioAvatarOrbitXio.layer.cornerRadius = 15
        XioAvatarOrbitXio.clipsToBounds = true
        XioAvatarOrbitXio.backgroundColor = .gray
        
        XioLyricLabelXio.textColor = .white
        XioLyricLabelXio.numberOfLines = 0
        XioLyricLabelXio.font = .systemFont(ofSize: 14)
        
        [XioBubbleVesselXio, XioAvatarOrbitXio, XioLyricLabelXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
    }
    
    func XioSyncLyricXio(_ XioDataXio: XioBalladMessageXio) {
        let XioAttrTextXio = NSMutableAttributedString(string: "\(XioDataXio.XioOratorNameXio): ", attributes: [.font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor.systemOrange])
        XioAttrTextXio.append(NSAttributedString(string: XioDataXio.XioLyricContentXio))
        XioLyricLabelXio.attributedText = XioAttrTextXio
        XioAvatarOrbitXio.image = UIImage(named: XioDataXio.XioOratorAvatarXio)
        NSLayoutConstraint.deactivate(contentView.constraints)
        
        if XioDataXio.XioIsDivineSelfXio {
            XioBubbleVesselXio.backgroundColor = UIColor.systemPurple.withAlphaComponent(0.3)
            NSLayoutConstraint.activate([
                XioAvatarOrbitXio.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
                XioAvatarOrbitXio.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                XioAvatarOrbitXio.widthAnchor.constraint(equalToConstant: 30),
                XioAvatarOrbitXio.heightAnchor.constraint(equalToConstant: 30),
                
                XioBubbleVesselXio.trailingAnchor.constraint(equalTo: XioAvatarOrbitXio.leadingAnchor, constant: -10),
                XioBubbleVesselXio.topAnchor.constraint(equalTo: XioAvatarOrbitXio.topAnchor),
                XioBubbleVesselXio.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
                XioBubbleVesselXio.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor, multiplier: 0.7),
                
                XioLyricLabelXio.topAnchor.constraint(equalTo: XioBubbleVesselXio.topAnchor, constant: 8),
                XioLyricLabelXio.bottomAnchor.constraint(equalTo: XioBubbleVesselXio.bottomAnchor, constant: -8),
                XioLyricLabelXio.leadingAnchor.constraint(equalTo: XioBubbleVesselXio.leadingAnchor, constant: 12),
                XioLyricLabelXio.trailingAnchor.constraint(equalTo: XioBubbleVesselXio.trailingAnchor, constant: -12)
            ])
        } else {
            XioBubbleVesselXio.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            NSLayoutConstraint.activate([
                XioAvatarOrbitXio.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                XioAvatarOrbitXio.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                XioAvatarOrbitXio.widthAnchor.constraint(equalToConstant: 30),
                XioAvatarOrbitXio.heightAnchor.constraint(equalToConstant: 30),
                
                XioBubbleVesselXio.leadingAnchor.constraint(equalTo: XioAvatarOrbitXio.trailingAnchor, constant: 10),
                XioBubbleVesselXio.topAnchor.constraint(equalTo: XioAvatarOrbitXio.topAnchor),
                XioBubbleVesselXio.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
                XioBubbleVesselXio.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor, multiplier: 0.7),
                
                XioLyricLabelXio.topAnchor.constraint(equalTo: XioBubbleVesselXio.topAnchor, constant: 8),
                XioLyricLabelXio.bottomAnchor.constraint(equalTo: XioBubbleVesselXio.bottomAnchor, constant: -8),
                XioLyricLabelXio.leadingAnchor.constraint(equalTo: XioBubbleVesselXio.leadingAnchor, constant: 12),
                XioLyricLabelXio.trailingAnchor.constraint(equalTo: XioBubbleVesselXio.trailingAnchor, constant: -12)
            ])
        }
    }
}

extension UIImage {
    func tinted(with color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.set()
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(.normal)
        let rect = CGRect(origin: .zero, size: size)
        context?.clip(to: rect, mask: cgImage!)
        context?.fill(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
