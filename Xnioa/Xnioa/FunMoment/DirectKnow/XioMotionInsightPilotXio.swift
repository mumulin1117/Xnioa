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
            XioCommentEntityXio(XioUserXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMTwvWxEUVa+StTU1N/C0"), XioContentXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMdEIgc7uCrR1ydOXruP2FRIZ5ss4UnOxd3yQsGeKFKhwBzjib466517H4tKjgOwGuOCtq8hwggg9M/vXpqaEmhvYFJMLevC8oOgRvkNoP6hj"), XioIsOwnerXio: false, XIoimage: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMTF6F+KdkHUBQUcW88hFfanW")),
            XioCommentEntityXio(XioUserXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMcXpenHB+VJo71Y/Mvurcw=="), XioContentXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMTgCZU3DAA4sa9hAU0YAutDYvYWjj2ZAGAQrHzv5510YcOuo1HlpHJRHMPPYoEMy4yCBH/iAYVIwynBIIi0PeKrs9lRH6qTXKpayf8g="), XioIsOwnerXio: false, XIoimage: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMZGtF+KdsHUBGTtuFbHq5dBv")),
            XioCommentEntityXio(XioUserXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMfz3n23XkpdxZWozow=="), XioContentXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMfsX/gz1EJ5gABj35hfbYlDLcAAW/9uP4MtHYwfjpGieoy+4fV6tb54PqANj5eWCalhKtzK1R/Me6twrnGfkg/cKIUiAJ1/zVTCbibFj69K7S/vHkg=="), XioIsOwnerXio: true, XIoimage: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMfHXF+KdUHUB4I9GoxWjM6Jv")),
            XioCommentEntityXio(XioUserXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMcz/VZHVYBC64QBcXARg"), XioContentXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMVdLTu3oZuqqPEMrFLbrsEVpKnY9TvpfdXF8dEhEc8vZ/xwv6o/nNQzIAHqoSr5NBpPohS87fVIY2+pnqwWaASlDeI+9cFk="), XioIsOwnerXio: false, XIoimage: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMVEZFOKdcHUBWKvj85BgO5nm")),
            XioCommentEntityXio(XioUserXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMV1u1HgQ293ernBj2xX7Shhw"), XioContentXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMTZE1rknYQolUEHLUDorkE+fSzqj5UdqdF+lm8OjayoUuWRxLCq0fOXDuLP+dFgyx4r5wnx4xUeozy4nOCCTlRcanEw="), XioIsOwnerXio: false, XIoimage: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMbFAFOKdEHUB0ifvd1oKjcRx"))
        ][indexXIO]
        
        self.XioChatBufferXio = [item]
     
        super.init(nibName: nil, bundle: nil)
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError(XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMe5fdxbqHBVvx/qiA3qwo0+F80GKWt0gRuIrT9fzqFBBrP/+qIVj/Gz5uLVIMg=="))
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
        AcccTopersonCou.setImage(UIImage.init(named: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMbz0TlJ313AQueSnsasjTYxSIKubP1Em")), for: .normal)
        NotificationCenter.default.addObserver(self, selector: #selector(XioDismissSceneXio), name: NSNotification.Name.init(XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMT1GkwFLoH/jg4LzC9vzv1h5aHjDw/P3Ntfsl4x4buo=")), object: nil)
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
        XioTheatreScrollXio.register(XioChatVocalCellXio.self, forCellReuseIdentifier: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMc49cjqm7srhoHK4hNBGmi6v48xnV+YLQmvV+g=="))
    }
    
    private func XioBuildFoundationXio() {
        [XioTheatreScrollXio, XioApexDeckXio, XioInputQuayXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        XioRetreatBtnXio.setImage(UIImage(systemName: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMRNU2VqsS4ICI/AhX/QUQxNb6vuv")), for: .normal)
        XioRetreatBtnXio.tintColor = .white
        XioRetreatBtnXio.addTarget(self, action: #selector(XioDismissSceneXio), for: .touchUpInside)
        
        XioHostNameXio.text =  usier.XioAliasXio
        XioHostNameXio.textColor = .white
        XioHostNameXio.font = .systemFont(ofSize: 18 * XioRatioWXio, weight: .bold)
        
        XioMoreActionXio.setImage(UIImage(systemName: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMUROWtYiBQVr3SWo7GEbehg=")), for: .normal)
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
        XioDraftFieldXio.placeholder = XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMcxT6WWOC3rnHoV7zjzxY9BCJ2MLQw==")
        XioDraftFieldXio.textColor = .white
        XioDraftFieldXio.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 1))
        XioDraftFieldXio.leftViewMode = .always
        
        XioDispatchBtnXio.setImage(UIImage(systemName: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMbTMpbjSJRgcmF4mSKtDo6v2olAyC5jz")), for: .normal)
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
            
            XioTheatreScrollXio.topAnchor.constraint(equalTo: XioApexDeckXio.bottomAnchor,constant: 70),
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
        let XioSheetXio = UIAlertController(title: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMbu6FwMtYCkD5cA3zV3qR8/ho3iQiQ=="), message: nil, preferredStyle: .actionSheet)
        XioSheetXio.addAction(UIAlertAction(title: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMRolcv/LID2u0dejrb5Iok0/nfcN"), style: .destructive, handler: { _ in
            self.navigationController?.pushViewController(XioSafetyAuditPilotXio(), animated: true)
        }))
        XioSheetXio.addAction(UIAlertAction(title: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMRFkSwaFjs6DwXoJZeHH"), style: .cancel))
        present(XioSheetXio, animated: true)
    }
    
    @objc private func XioSubmitChatXio() {
        guard let XioTxtXio = XioDraftFieldXio.text, !XioTxtXio.isEmpty else { return }
        let XioNewXio = XioCommentEntityXio(XioUserXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMeLu+/9nqROSGQw="), XioContentXio: XioTxtXio, XioIsOwnerXio: false, XIoimage: XioGovernanceHubXio.XioPrincipalXio.XioActiveProfileXio?.XioAvatarXio ?? "")
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
        let XioCellXio = tableView.dequeueReusableCell(withIdentifier: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMc49cjqm7srhoHK4hNBGmi6v48xnV+YLQmvV+g=="), for: indexPath) as! XioChatVocalCellXio
        XioCellXio.XioRenderEntityXio(XioChatBufferXio[indexPath.row])
        return XioCellXio
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let XioHeadXio = UIView()
        let XioVisualXio = UIImageView(frame: CGRect(x: 15, y: 10, width: 345 * XioRatioWXio, height: 345 * XioRatioWXio ))
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
        XioPlayBtnXio.setImage(UIImage(systemName: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMTSjGJC7hMtaeLjQZBNaH7unZf/uA8AQFw==")), for: .normal)
        XioPlayBtnXio.tintColor = .white
       
        XioInitalizeCinemaXio(in: XioVisualXio, resource: usier.XioMoivepath)
                
                
        XioPlayBtnXio.addTarget(self, action: #selector(XioToggleVisualXio(_:)), for: .touchUpInside)
        let XioGreetXio = UIButton(frame: CGRect(x: 10, y: 345*XioRatioWXio - 50, width: 80, height: 36))
        XioGreetXio.setBackgroundImage(UIImage(named: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMUSvHJ6m7hR3PdwYadhH4bBFSH0=")), for: .normal)
        XioGreetXio.addTarget(self, action: #selector(XioEnterChatPortalXio), for: .touchUpInside)
        XioVisualXio.addSubview(XioPlayBtnXio)
        XioVisualXio.addSubview(XioGreetXio)
        XioHeadXio.addSubview(XioVisualXio)
        
        let XioDescXio = UILabel(frame: CGRect(x: 15, y: XioVisualXio.frame.maxY + 12, width: 345 * XioRatioWXio, height: 60))
        XioDescXio.text = usier.XioMoiveTitle
        XioDescXio.textColor = .lightGray
        XioDescXio.numberOfLines = 0
        XioDescXio.font = .systemFont(ofSize: 15)
        XioHeadXio.addSubview(XioDescXio)
        
        return XioHeadXio
    }
    @objc private func XioEnterChatPortalXio() {
        XioPushWhisperOrbitXio(target: usier)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 450 * XioRatioHXio + 40
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
        
        XioBadgeXio.text = XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMdHLdJya8tYOMOM7ALcH")
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
