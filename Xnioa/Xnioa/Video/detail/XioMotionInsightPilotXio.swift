//
//  XioMotionInsightPilotXio.swift
//  Xnioa
//
//  Created by mumu on 2026/2/25.
//

import UIKit
import AVFoundation

class XioMotionInsightPilotXio: UIViewController {
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
    
    private var XioChatBufferXio: [XioCommentEntityXio] = [
        XioCommentEntityXio(XioUserXio: "Mary", XioContentXio: "I think I'm in love with you", XioIsOwnerXio: true),
        XioCommentEntityXio(XioUserXio: "Mary", XioContentXio: "I think I'm in love with you", XioIsOwnerXio: false)
    ]
    
    private var XioIsCinemaPlayingXio = false

    override func viewDidLoad() {
        super.viewDidLoad()
        XioPrepareStageXio()
        XioBuildFoundationXio()
       
        AcccTopersonCou.setImage(UIImage.init(named: "AcccTopersonCou"), for: .normal)
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
        
        XioHostNameXio.text = "Holt Hamlet"
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
        let XioNewXio = XioCommentEntityXio(XioUserXio: "Me", XioContentXio: XioTxtXio, XioIsOwnerXio: false)
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
        XioVisualXio.image = UIImage(named: "XioVideoThumbXio")
        
        let XioPlayBtnXio = UIButton(frame: CGRect(x: 345*XioRatioWXio - 50, y: 345*XioRatioWXio - 50, width: 40, height: 40))
        XioPlayBtnXio.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        XioPlayBtnXio.tintColor = .white
        XioPlayBtnXio.addTarget(self, action: #selector(XioToggleVisualXio), for: .touchUpInside)
        
        let XioGreetXio = UIButton(frame: CGRect(x: 10, y: 345*XioRatioWXio - 50, width: 80, height: 36))
        XioGreetXio.backgroundColor = .systemPurple
        XioGreetXio.setTitle("Greet", for: .normal)
        XioGreetXio.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        XioGreetXio.layer.cornerRadius = 10
        
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 450 * XioRatioHXio
    }
    
    @objc private func XioToggleVisualXio() {
        XioIsCinemaPlayingXio.toggle()
        print("Video State: \(XioIsCinemaPlayingXio ? "Playing" : "Paused")")
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
        
        XioMsgXio.textColor = .darkGray
        XioMsgXio.font = .systemFont(ofSize: 14)
        
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
            XioBadgeXio.heightAnchor.constraint(equalToConstant: 16),
            
            XioMsgXio.leadingAnchor.constraint(equalTo: XioNameXio.leadingAnchor),
            XioMsgXio.topAnchor.constraint(equalTo: XioNameXio.bottomAnchor, constant: 4),
            XioMsgXio.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func XioRenderEntityXio(_ data: XioCommentEntityXio) {
        XioNameXio.text = data.XioUserXio
        XioMsgXio.text = data.XioContentXio
        XioBadgeXio.isHidden = !data.XioIsOwnerXio
    }
}

struct XioCommentEntityXio {
    let XioUserXio: String
    let XioContentXio: String
    let XioIsOwnerXio: Bool
}
