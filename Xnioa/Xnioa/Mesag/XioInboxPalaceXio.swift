//
//  XioInboxPalaceXio.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/24.
//

import UIKit

// MARK: - Data Core
struct XioChatEntityXio {
    let XioSnippetTextXio: String
    let XioTimestampXio: String
    let whosayIsMe:Bool
}

struct Diolodlisr {

    let Xiouser: XioGalaEntryXio
    var dilog:Array<XioChatEntityXio>
    
    
}
// MARK: - Message List Controller
class XioInboxPalaceXio: UIViewController {
    
    private let XioTitlePlateXio = UILabel()
    private let XioChronicleListXio = UITableView()
    static var XioChatBufferXio: [Diolodlisr] = []
    private let XioVoidPlaceholderXio = UIImageView.init(image: UIImage.init(named: "XioVoidPlaceholderXio"))
   
    private let XioWScaleXio = UIScreen.main.bounds.width / 375
    private let XioHScaleXio = UIScreen.main.bounds.height / 812

    override func viewDidLoad() {
        super.viewDidLoad()
        XioAssembleEnvironmentXio()
        XioInvokeNetworkPulseXio()
        XNioaAppIndicatorMannager.XNioashow(XNioainfo: "Loading...")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XNioaAppIndicatorMannager.XNioadismiss()
          
        }
        NotificationCenter.default.addObserver(self, selector: #selector(refreshinG), name: NSNotification.Name.init("XioUpdateExileStatusXio"), object: nil)
        
    }
   @objc func refreshinG()  {
        
       XioInvokeNetworkPulseXio() 
   }
    
    
    private func XioAssembleEnvironmentXio() {
        view.backgroundColor = UIColor(white: 0.05, alpha: 1.0)
        navigationController?.isNavigationBarHidden = true
        
        XioTitlePlateXio.text = "Message"
        XioTitlePlateXio.font = .systemFont(ofSize: 28, weight: .bold)
        XioTitlePlateXio.textColor = .white
        XioTitlePlateXio.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(XioTitlePlateXio)
        
        XioChronicleListXio.backgroundColor = .clear
        XioChronicleListXio.separatorStyle = .none
        XioChronicleListXio.delegate = self
        XioChronicleListXio.dataSource = self
        XioChronicleListXio.register(XioChatTomeCellXio.self, forCellReuseIdentifier: "XioChatTomeCellXio")
        XioChronicleListXio.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(XioChronicleListXio)
        view.addSubview(XioVoidPlaceholderXio)
        XioVoidPlaceholderXio.isHidden = true
        XioVoidPlaceholderXio.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            XioTitlePlateXio.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15 * XioHScaleXio),
            XioTitlePlateXio.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * XioWScaleXio),
            
            XioChronicleListXio.topAnchor.constraint(equalTo: XioTitlePlateXio.bottomAnchor, constant: 25 * XioHScaleXio),
            XioChronicleListXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioChronicleListXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioChronicleListXio.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            XioVoidPlaceholderXio.topAnchor.constraint(equalTo: XioChronicleListXio.topAnchor, constant: 30),
            XioVoidPlaceholderXio.centerXAnchor.constraint(equalTo: XioChronicleListXio.centerXAnchor),
            XioVoidPlaceholderXio.widthAnchor.constraint(equalToConstant: 200 * XioWScaleXio),
            XioVoidPlaceholderXio.heightAnchor.constraint(equalToConstant: 200 * XioWScaleXio),
        ])
    }
    
    private func XioInvokeNetworkPulseXio() {
        
        self.XioChronicleListXio.reloadData()
        self.XioVoidPlaceholderXio.isHidden = !(XioInboxPalaceXio.XioChatBufferXio.count == 0)
    }
}

// MARK: - List Protocols
extension XioInboxPalaceXio: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return XioInboxPalaceXio.XioChatBufferXio.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let XioCellXio = tableView.dequeueReusableCell(withIdentifier: "XioChatTomeCellXio", for: indexPath) as! XioChatTomeCellXio
        XioCellXio.XioHydrateCellXio(XioInboxPalaceXio.XioChatBufferXio[indexPath.row])
        return XioCellXio
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85 * XioHScaleXio
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let XioSubjectXio = XioInboxPalaceXio.XioChatBufferXio[indexPath.row]
        let XioDetailXio = XioWhisperPortalXio(usiersd: XioSubjectXio)
        XioDetailXio.hidesBottomBarWhenPushed = true
//        XioDetailXio.XioTargetIdentityXio = XioSubjectXio.XioPartnerNameXio
        navigationController?.pushViewController(XioDetailXio, animated: true)
    }
}

// MARK: - Custom Message Cell
class XioChatTomeCellXio: UITableViewCell {
    
    private let XioAvatarOrbitXio = UIImageView()
    private let XioPartnerLabelXio = UILabel()
    private let XioSnippetLabelXio = UILabel()
    private let XioTimeLabelXio = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        XioConfigureStructureXio()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func XioConfigureStructureXio() {
        backgroundColor = .clear
        selectionStyle = .none
        
        XioAvatarOrbitXio.layer.cornerRadius = 8
        XioAvatarOrbitXio.clipsToBounds = true
        XioAvatarOrbitXio.backgroundColor = .darkGray
        
        XioPartnerLabelXio.textColor = .white
        XioPartnerLabelXio.font = .systemFont(ofSize: 17, weight: .bold)
        
        XioSnippetLabelXio.textColor = .lightGray
        XioSnippetLabelXio.font = .systemFont(ofSize: 14)
        
        XioTimeLabelXio.textColor = .gray
        XioTimeLabelXio.font = .systemFont(ofSize: 12)
        XioTimeLabelXio.textAlignment = .right
        
        [XioAvatarOrbitXio, XioPartnerLabelXio, XioSnippetLabelXio, XioTimeLabelXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            XioAvatarOrbitXio.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            XioAvatarOrbitXio.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            XioAvatarOrbitXio.widthAnchor.constraint(equalToConstant: 60),
            XioAvatarOrbitXio.heightAnchor.constraint(equalToConstant: 60),
            
            XioPartnerLabelXio.topAnchor.constraint(equalTo: XioAvatarOrbitXio.topAnchor, constant: 5),
            XioPartnerLabelXio.leadingAnchor.constraint(equalTo: XioAvatarOrbitXio.trailingAnchor, constant: 15),
            
            XioSnippetLabelXio.bottomAnchor.constraint(equalTo: XioAvatarOrbitXio.bottomAnchor, constant: -5),
            XioSnippetLabelXio.leadingAnchor.constraint(equalTo: XioPartnerLabelXio.leadingAnchor),
            
            XioTimeLabelXio.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            XioTimeLabelXio.centerYAnchor.constraint(equalTo: XioPartnerLabelXio.centerYAnchor)
        ])
    }
    
    func XioHydrateCellXio(_ entity: Diolodlisr) {
        XioPartnerLabelXio.text = entity.Xiouser.XioAliasXio
        XioSnippetLabelXio.text = entity.dilog.first?.XioSnippetTextXio
        XioTimeLabelXio.text = entity.dilog.first?.XioTimestampXio
        XioAvatarOrbitXio.image = UIImage(named: entity.Xiouser.XioAvatarXio)
    }
}

