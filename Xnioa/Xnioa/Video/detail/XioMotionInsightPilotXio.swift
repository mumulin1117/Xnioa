//
//  XioMotionInsightPilotXio.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/25.
//

import UIKit
import AVFoundation


class XioMotionInsightPilotXio: XioResilienceAnchorXio ,XioCinemaMotionProtocolXio{
    var XioCinemaPlayerXio: AVPlayer?
    private let XioLikeBtnXio = UIButton.init()
   
    var XioCinemaLayerXio: AVPlayerLayer?
    var XioIsCinemaPlayingXio: Bool = false
    
    
    var pagedex:Int
    
    var usier: XioGalaEntryXio
    init(usiersd:XioGalaEntryXio,indexXIO:Int) {
       
        self.usier = usiersd
        self.pagedex = indexXIO
        let item = [
            XioCommentEntityXio(XioUserXio: "Master", XioContentXio: "The lighting in this video is absolutely cinematic! How did you do that?", XioIsOwnerXio: false, XIoimage: "avarieou8"),
            XioCommentEntityXio(XioUserXio: "Dreamer", XioContentXio: "This track is fire! Is it an AI-generated melody or a retro classic?", XioIsOwnerXio: false, XIoimage: "avarieou7"),
            XioCommentEntityXio(XioUserXio: "Mary", XioContentXio: "I'm so glad you guys like the atmosphere of this party! Stay tuned for more.", XioIsOwnerXio: true, XIoimage: "avarieou6"),
            XioCommentEntityXio(XioUserXio: "Knight", XioContentXio: "Just sent you a Greet! Hope we can chat in the next live gala.", XioIsOwnerXio: false, XIoimage: "avarieou5"),
            XioCommentEntityXio(XioUserXio: "XioSystem", XioContentXio: "Your video has reached 1,000 views! Keep up the great work.", XioIsOwnerXio: false, XIoimage: "avarieou4")
        ][indexXIO]
        
        self.XioChatBufferXio = [item]
     
        super.init(nibName: nil, bundle: nil)
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private let AcccTopersonCou = UIButton()//personto
    private let XioApexDeckXio = UIView()
    private let XioRetreatBtnXio = UIButton()
    private let XioHostNameXio = UILabel()
    private let XioMoreActionXio = UIButton()
    
    private let XioTheatreScrollXio = UITableView(frame: .zero, style: .grouped)
    private let XioMediaPlateXio = UIView()
    private let XioVisualCoreXio = UIImageView()
    private let XioPulseBtnXio = UIButton()
    private let XioGreetBadgeXio = UIButton()
    
    private let XioInputQuayXio = UIView()
    private let XioDraftFieldXio = UITextField()
    private let XioDispatchBtnXio = UIButton()
    
    private let XioRatioWXio = UIScreen.main.bounds.width / 375
    private let XioRatioHXio = UIScreen.main.bounds.height / 812
    
    
    private var XioChatBufferXio: [XioCommentEntityXio] = []
    override func viewDidLoad() {
        super.viewDidLoad()
       
        XioPrepareStageXio()
        XioBuildFoundationXio()
        AcccTopersonCou.addTarget(self, action: #selector(safetyFire), for: .touchUpInside)
        AcccTopersonCou.setImage(UIImage.init(named: "AcccTopersonCou"), for: .normal)
        NotificationCenter.default.addObserver(self, selector: #selector(XioDismissSceneXio), name: NSNotification.Name.init("XioUpdateExileStatusXio"), object: nil)
    }
    
    
    @objc func safetyFire()  {
        let activet = XioPeerPortalPalaceXio.init(usiersd: usier)
        self.navigationController?.pushViewController(activet, animated: true)
    }
    private func XioPrepareStageXio() {
        view.backgroundColor = UIColor(white: 0.05, alpha: 1.0)
        XioTheatreScrollXio.backgroundColor = .clear
        XioTheatreScrollXio.separatorStyle = .none
        XioTheatreScrollXio.delegate = self
        XioTheatreScrollXio.dataSource = self
        XioTheatreScrollXio.register(XioChatVocalCellXio.self, forCellReuseIdentifier: "XioChatVocalCellXio")
    }
    
    private func XioBuildFoundationXio() {
        [XioTheatreScrollXio, XioApexDeckXio, XioInputQuayXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        XioRetreatBtnXio.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        XioRetreatBtnXio.tintColor = .white
        XioRetreatBtnXio.addTarget(self, action: #selector(XioDismissSceneXio), for: .touchUpInside)
        
        XioHostNameXio.text =  usier.XioAliasXio
        XioHostNameXio.textColor = .white
        XioHostNameXio.font = .systemFont(ofSize: 18 * XioRatioWXio, weight: .bold)
        
        XioMoreActionXio.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        XioMoreActionXio.tintColor = .white
        XioMoreActionXio.addTarget(self, action: #selector(XioInvokeReportXio), for: .touchUpInside)
        
        [XioRetreatBtnXio, XioHostNameXio, XioMoreActionXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioApexDeckXio.addSubview($0)
        }
        XioApexDeckXio.addSubview(AcccTopersonCou)
        AcccTopersonCou.translatesAutoresizingMaskIntoConstraints = false
        XioInputQuayXio.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        XioDraftFieldXio.backgroundColor = UIColor(white: 0.2, alpha: 1.0)
        XioDraftFieldXio.layer.cornerRadius = 18 * XioRatioHXio
        XioDraftFieldXio.placeholder = "Say something"
        XioDraftFieldXio.textColor = .white
        XioDraftFieldXio.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 1))
        XioDraftFieldXio.leftViewMode = .always
        
        XioDispatchBtnXio.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        XioDispatchBtnXio.tintColor = .systemGreen
        XioDispatchBtnXio.addTarget(self, action: #selector(XioSubmitChatXio), for: .touchUpInside)
        
        [XioDraftFieldXio, XioDispatchBtnXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioInputQuayXio.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            XioApexDeckXio.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            XioApexDeckXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioApexDeckXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioApexDeckXio.heightAnchor.constraint(equalToConstant: 44 * XioRatioHXio),
            
            
            XioRetreatBtnXio.leadingAnchor.constraint(equalTo: XioApexDeckXio.leadingAnchor, constant: 15),
            XioRetreatBtnXio.centerYAnchor.constraint(equalTo: XioApexDeckXio.centerYAnchor),
            XioHostNameXio.leadingAnchor.constraint(equalTo: XioRetreatBtnXio.trailingAnchor, constant: 12),
            XioHostNameXio.centerYAnchor.constraint(equalTo: XioApexDeckXio.centerYAnchor),
            AcccTopersonCou.widthAnchor.constraint(equalToConstant: 25),
            AcccTopersonCou.heightAnchor.constraint(equalToConstant: 25),
            AcccTopersonCou.centerYAnchor.constraint(equalTo: XioHostNameXio.centerYAnchor),
            AcccTopersonCou.leadingAnchor.constraint(equalTo: XioHostNameXio.trailingAnchor, constant: 10),
            
            
            XioMoreActionXio.trailingAnchor.constraint(equalTo: XioApexDeckXio.trailingAnchor, constant: -15),
            XioMoreActionXio.centerYAnchor.constraint(equalTo: XioApexDeckXio.centerYAnchor),
            
            XioTheatreScrollXio.topAnchor.constraint(equalTo: XioApexDeckXio.bottomAnchor),
            XioTheatreScrollXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioTheatreScrollXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioTheatreScrollXio.bottomAnchor.constraint(equalTo: XioInputQuayXio.topAnchor),
            
            XioInputQuayXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioInputQuayXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioInputQuayXio.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            XioInputQuayXio.heightAnchor.constraint(equalToConstant: 80 * XioRatioHXio),
            
            XioDraftFieldXio.leadingAnchor.constraint(equalTo: XioInputQuayXio.leadingAnchor, constant: 20 * XioRatioWXio),
            XioDraftFieldXio.centerYAnchor.constraint(equalTo: XioInputQuayXio.centerYAnchor, constant: -10),
            XioDraftFieldXio.heightAnchor.constraint(equalToConstant: 36 * XioRatioHXio),
            XioDraftFieldXio.trailingAnchor.constraint(equalTo: XioDispatchBtnXio.leadingAnchor, constant: -15),
            
            XioDispatchBtnXio.trailingAnchor.constraint(equalTo: XioInputQuayXio.trailingAnchor, constant: -20),
            XioDispatchBtnXio.centerYAnchor.constraint(equalTo: XioDraftFieldXio.centerYAnchor),
            XioDispatchBtnXio.widthAnchor.constraint(equalToConstant: 36),
            XioDispatchBtnXio.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
    
    @objc private func XioDismissSceneXio() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func XioInvokeReportXio() {
        let XioSheetXio = UIAlertController(title: "Media Options", message: nil, preferredStyle: .actionSheet)
        XioSheetXio.addAction(UIAlertAction(title: "Report Video", style: .destructive, handler: { _ in
            self.navigationController?.pushViewController(XioSafetyAuditPilotXio(), animated: true)
        }))
        XioSheetXio.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(XioSheetXio, animated: true)
    }
    
    @objc private func XioSubmitChatXio() {
        guard let XioTxtXio = XioDraftFieldXio.text, !XioTxtXio.isEmpty else { return }
        let XioNewXio = XioCommentEntityXio(XioUserXio: "Me", XioContentXio: XioTxtXio, XioIsOwnerXio: false, XIoimage: XioGovernanceHubXio.XioPrincipalXio.XioActiveProfileXio?.XioAvatarXio ?? "")
        XioChatBufferXio.append(XioNewXio)
        XioTheatreScrollXio.reloadData()
        XioDraftFieldXio.text = ""
        XioDraftFieldXio.resignFirstResponder()
    }
    
}

extension XioMotionInsightPilotXio: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return XioChatBufferXio.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let XioCellXio = tableView.dequeueReusableCell(withIdentifier: "XioChatVocalCellXio", for: indexPath) as! XioChatVocalCellXio
        XioCellXio.XioRenderEntityXio(XioChatBufferXio[indexPath.row])
        return XioCellXio
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let XioHeadXio = UIView()
        let XioVisualXio = UIImageView(frame: CGRect(x: 15, y: 10, width: 345 * XioRatioWXio, height: 345 * XioRatioWXio))
        XioVisualXio.backgroundColor = .darkGray
        XioVisualXio.layer.cornerRadius = 15
        XioVisualXio.clipsToBounds = true
        XioVisualXio.contentMode = .scaleAspectFill
        XioVisualXio.isUserInteractionEnabled = true
        XioVisualXio.contentMode = .scaleAspectFill
        XioVisualXio.layer.masksToBounds = true
        XioVisualMediaPilotXio.XioExtractFrameXio(from: usier.XioMoivepath) { [weak self] sxnioImg in
            guard let self = self else { return }
           
            if let sxnioFinalImg = sxnioImg {
                
                XioVisualXio.image = sxnioFinalImg
            }
        }
        let XioPlayBtnXio = UIButton(frame: CGRect(x: 345*XioRatioWXio - 50, y: 345*XioRatioWXio - 50, width: 40, height: 40))
        XioPlayBtnXio.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        XioPlayBtnXio.tintColor = .white
       
        XioInitalizeCinemaXio(in: XioVisualXio, resource: usier.XioMoivepath)
                
                
        XioPlayBtnXio.addTarget(self, action: #selector(XioToggleVisualXio(_:)), for: .touchUpInside)
        let XioGreetXio = UIButton(frame: CGRect(x: 10, y: 345*XioRatioWXio - 50, width: 80, height: 36))
        XioGreetXio.setBackgroundImage(UIImage(named: "nevertGrest"), for: .normal)
        XioGreetXio.addTarget(self, action: #selector(XioEnterChatPortalXio), for: .touchUpInside)
        XioVisualXio.addSubview(XioPlayBtnXio)
        XioVisualXio.addSubview(XioGreetXio)
        XioHeadXio.addSubview(XioVisualXio)
        
        let XioDescXio = UILabel(frame: CGRect(x: 15, y: 345*XioRatioWXio + 20, width: 345 * XioRatioWXio, height: 60))
        XioDescXio.text = "Tonight, I dived into a retrowonderland. The old tunes playing, I'm lost in pure bliss."
        XioDescXio.textColor = .lightGray
        XioDescXio.numberOfLines = 0
        XioDescXio.font = .systemFont(ofSize: 15)
        XioHeadXio.addSubview(XioDescXio)
        
        return XioHeadXio
    }
    @objc private func XioEnterChatPortalXio() {
        if let useDiolog = XioInboxPalaceXio.XioChatBufferXio.first(where: { Diolodlisr in
            Diolodlisr.Xiouser.XioBadgeIDXio == self.usier.XioBadgeIDXio
        }){
            let XioChatXio = XioWhisperPortalXio(usiersd: useDiolog)
            XioChatXio.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(XioChatXio, animated: true)
        }else{
            
            let XioChatXio = XioWhisperPortalXio(usiersd: Diolodlisr.init(Xiouser: self.usier, dilog: []))
            XioChatXio.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(XioChatXio, animated: true)
        }
        
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 450 * XioRatioHXio
    }
    
    @objc private func XioToggleVisualXio(_ sender: UIButton) {
            XioToggleMotionStateXio(sender: sender)
        }

        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        XioTerminateCinemaXio() // 统一销毁
        
    }
}

class XioChatVocalCellXio: UITableViewCell {
    private let XioAvatarXio = UIImageView()
    private let XioNameXio = UILabel()
    private let XioBadgeXio = UILabel()
    private let XioMsgXio = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        XioSetupCellXio()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func XioSetupCellXio() {
        [XioAvatarXio, XioNameXio, XioBadgeXio, XioMsgXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        XioAvatarXio.backgroundColor = .gray
        XioAvatarXio.layer.cornerRadius = 20
        XioAvatarXio.clipsToBounds = true
        
        XioNameXio.textColor = .white
        XioNameXio.font = .systemFont(ofSize: 14, weight: .bold)
        
        XioBadgeXio.text = "Author"
        XioBadgeXio.backgroundColor = .systemGreen
        XioBadgeXio.textColor = .black
        XioBadgeXio.font = .systemFont(ofSize: 10, weight: .bold)
        XioBadgeXio.textAlignment = .center
        XioBadgeXio.layer.cornerRadius = 4
        XioBadgeXio.clipsToBounds = true
        XioBadgeXio.numberOfLines = 0
        XioMsgXio.textColor = .darkGray
        XioMsgXio.font = .systemFont(ofSize: 14)
        XioMsgXio.numberOfLines = 0
        NSLayoutConstraint.activate([
            XioAvatarXio.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            XioAvatarXio.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            XioAvatarXio.widthAnchor.constraint(equalToConstant: 40),
            XioAvatarXio.heightAnchor.constraint(equalToConstant: 40),
            
            XioNameXio.leadingAnchor.constraint(equalTo: XioAvatarXio.trailingAnchor, constant: 10),
            XioNameXio.topAnchor.constraint(equalTo: XioAvatarXio.topAnchor),
            
            XioBadgeXio.leadingAnchor.constraint(equalTo: XioNameXio.trailingAnchor, constant: 5),
            XioBadgeXio.centerYAnchor.constraint(equalTo: XioNameXio.centerYAnchor),
            XioBadgeXio.widthAnchor.constraint(equalToConstant: 45),
            XioBadgeXio.heightAnchor.constraint(equalToConstant: 33),
            
            XioMsgXio.leadingAnchor.constraint(equalTo: XioNameXio.leadingAnchor),
            XioMsgXio.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            XioMsgXio.topAnchor.constraint(equalTo: XioNameXio.bottomAnchor, constant: 4),
            XioMsgXio.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func XioRenderEntityXio(_ data: XioCommentEntityXio) {
        XioNameXio.text = data.XioUserXio
        XioMsgXio.text = data.XioContentXio
        XioBadgeXio.isHidden = !data.XioIsOwnerXio
        XioAvatarXio.image = UIImage(named: data.XIoimage) 
    }
}

struct XioCommentEntityXio {
    let XioUserXio: String
    let XioContentXio: String
    let XioIsOwnerXio: Bool
    let XIoimage:String
}

