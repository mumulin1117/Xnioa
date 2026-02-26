//
//  XioWhisperPortalXio.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/24.
//

import UIKit

struct XioSpeechEntityXio {
    let XioContentXio: String
    let XioIsSenderXio: Bool
    let XioAvatarTokenXio: String
}

class XioWhisperPortalXio: XioResilienceAnchorXio {
    
    var XioTargetIdentityXio: String?
    private let XioNavRackXio = UIView()
    private let XioRetreatBtnXio = UIButton()
    private let XioTitleTagXio = UILabel()
    private let XioHeaderOrbitXio = UIImageView()
    private let XioOptionBtnXio = UIButton()
    
    private let XioTalkStreamXio = UITableView()
    private var XioMusingBufferXio: [XioSpeechEntityXio] = []
    
    private let XioInputRackXio = UIView()
    private let XioCamTriggerXio = UIButton()
    private let XioFieldBoxXio = UITextField()
    private let XioDeliverBtnXio = UIButton()
    
    private let XioWScaleXio = UIScreen.main.bounds.width / 375
    private let XioHScaleXio = UIScreen.main.bounds.height / 812

    override func viewDidLoad() {
        super.viewDidLoad()
        XioSetupCanvasXio()
        XioForgeLayoutXio()
        XioFetchMusingPulseXio()
    }
    
    private func XioSetupCanvasXio() {
        view.backgroundColor = UIColor(white: 0.05, alpha: 1.0)
        navigationController?.isNavigationBarHidden = true
        
        XioTalkStreamXio.backgroundColor = .clear
        XioTalkStreamXio.separatorStyle = .none
        XioTalkStreamXio.delegate = self
        XioTalkStreamXio.dataSource = self
        XioTalkStreamXio.register(XioSpeechBubbleCellXio.self, forCellReuseIdentifier: "XioSpeechBubbleCellXio")
//        XioTalkStreamXio.transform = CGAffineTransform(scaleX: 1, y: -1)
    }
    
    private func XioForgeLayoutXio() {
        [XioNavRackXio, XioTalkStreamXio, XioInputRackXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        XioTitleTagXio.text = XioTargetIdentityXio ?? "Martin Randolph"
        XioTitleTagXio.textColor = .white
        XioTitleTagXio.font = .systemFont(ofSize: 18, weight: .bold)
        
        XioRetreatBtnXio.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        XioRetreatBtnXio.tintColor = .white
        XioRetreatBtnXio.addTarget(self, action: #selector(XioExitPortalXio), for: .touchUpInside)
        
        XioHeaderOrbitXio.layer.cornerRadius = 6
        XioHeaderOrbitXio.clipsToBounds = true
        XioHeaderOrbitXio.backgroundColor = .gray
        
        XioOptionBtnXio.setTitle("•••", for: .normal)
        XioOptionBtnXio.setTitleColor(.white, for: .normal)
        
        [XioRetreatBtnXio, XioHeaderOrbitXio, XioTitleTagXio, XioOptionBtnXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioNavRackXio.addSubview($0)
        }
        
        XioInputRackXio.backgroundColor = .clear
        XioFieldBoxXio.backgroundColor = UIColor(white: 0.15, alpha: 1.0)
        XioFieldBoxXio.layer.cornerRadius = 10
        XioFieldBoxXio.textColor = .white
        XioFieldBoxXio.attributedPlaceholder = NSAttributedString(string: "Say something", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        let XioPadViewXio = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 1))
        XioFieldBoxXio.leftView = XioPadViewXio
        XioFieldBoxXio.leftViewMode = .always
        
        XioCamTriggerXio.setBackgroundImage(UIImage.init(named: "XioCamTriggerXio"), for: .normal)
        
        XioCamTriggerXio.addTarget(self, action: #selector(sssXioVerdeoCabyllPortalXio), for: .touchUpInside)
        XioDeliverBtnXio.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        XioDeliverBtnXio.tintColor = .black
        XioDeliverBtnXio.backgroundColor = UIColor(red: 0.7, green: 0.9, blue: 0.6, alpha: 1.0)
        XioDeliverBtnXio.layer.cornerRadius = 10
        
        [XioCamTriggerXio, XioFieldBoxXio, XioDeliverBtnXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioInputRackXio.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            XioNavRackXio.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            XioNavRackXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioNavRackXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioNavRackXio.heightAnchor.constraint(equalToConstant: 50 * XioHScaleXio),
            
            XioRetreatBtnXio.leadingAnchor.constraint(equalTo: XioNavRackXio.leadingAnchor, constant: 15),
            XioRetreatBtnXio.centerYAnchor.constraint(equalTo: XioNavRackXio.centerYAnchor),
            
            XioHeaderOrbitXio.leadingAnchor.constraint(equalTo: XioRetreatBtnXio.trailingAnchor, constant: 15),
            XioHeaderOrbitXio.centerYAnchor.constraint(equalTo: XioNavRackXio.centerYAnchor),
            XioHeaderOrbitXio.widthAnchor.constraint(equalToConstant: 35),
            XioHeaderOrbitXio.heightAnchor.constraint(equalToConstant: 35),
            
            XioTitleTagXio.leadingAnchor.constraint(equalTo: XioHeaderOrbitXio.trailingAnchor, constant: 12),
            XioTitleTagXio.centerYAnchor.constraint(equalTo: XioNavRackXio.centerYAnchor),
            
            XioOptionBtnXio.trailingAnchor.constraint(equalTo: XioNavRackXio.trailingAnchor, constant: -15),
            XioOptionBtnXio.centerYAnchor.constraint(equalTo: XioNavRackXio.centerYAnchor),
            
            XioInputRackXio.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            XioInputRackXio.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            XioInputRackXio.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            XioInputRackXio.heightAnchor.constraint(equalToConstant: 50),
            
            XioCamTriggerXio.leadingAnchor.constraint(equalTo: XioInputRackXio.leadingAnchor),
            XioCamTriggerXio.centerYAnchor.constraint(equalTo: XioInputRackXio.centerYAnchor),
            XioCamTriggerXio.widthAnchor.constraint(equalToConstant: 40),
            XioCamTriggerXio.heightAnchor.constraint(equalToConstant: 40),
            
            XioDeliverBtnXio.trailingAnchor.constraint(equalTo: XioInputRackXio.trailingAnchor),
            XioDeliverBtnXio.centerYAnchor.constraint(equalTo: XioInputRackXio.centerYAnchor),
            XioDeliverBtnXio.widthAnchor.constraint(equalToConstant: 40),
            XioDeliverBtnXio.heightAnchor.constraint(equalToConstant: 40),
            
            XioFieldBoxXio.leadingAnchor.constraint(equalTo: XioCamTriggerXio.trailingAnchor, constant: 12),
            XioFieldBoxXio.trailingAnchor.constraint(equalTo: XioDeliverBtnXio.leadingAnchor, constant: -12),
            XioFieldBoxXio.centerYAnchor.constraint(equalTo: XioInputRackXio.centerYAnchor),
            XioFieldBoxXio.heightAnchor.constraint(equalToConstant: 40),
            
            XioTalkStreamXio.topAnchor.constraint(equalTo: XioNavRackXio.bottomAnchor),
            XioTalkStreamXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioTalkStreamXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioTalkStreamXio.bottomAnchor.constraint(equalTo: XioInputRackXio.topAnchor, constant: -10)
        ])
    }
    
    private func XioFetchMusingPulseXio() {
        XioMusingBufferXio = [
            XioSpeechEntityXio(XioContentXio: "How do you do today?\nHow do you do", XioIsSenderXio: false, XioAvatarTokenXio: ""),
            XioSpeechEntityXio(XioContentXio: "I feel good", XioIsSenderXio: true, XioAvatarTokenXio: ""),
            XioSpeechEntityXio(XioContentXio: "How do you do today?", XioIsSenderXio: false, XioAvatarTokenXio: "")
        ]
        XioTalkStreamXio.reloadData()
    }
    
    @objc private func XioExitPortalXio() {
        navigationController?.popViewController(animated: true)
    }
    
   @objc func sssXioVerdeoCabyllPortalXio()  {
        
       self.navigationController?.pushViewController(XioVerdeoCabyllPortalXio(), animated: true)
    }
}

extension XioWhisperPortalXio: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return XioMusingBufferXio.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let XioCellXio = tableView.dequeueReusableCell(withIdentifier: "XioSpeechBubbleCellXio", for: indexPath) as! XioSpeechBubbleCellXio
//        XioCellXio.transform = CGAffineTransform(scaleX: 1, y: -1)
        XioCellXio.XioHydrateBubbleXio(XioMusingBufferXio[indexPath.row])
        return XioCellXio
    }
}

class XioSpeechBubbleCellXio: UITableViewCell {
    
    private let XioAvatarPinXio = UIImageView()
    private let XioBubbleCoreXio = UIView()
    private let XioContentLabelXio = UILabel()
    
    private var XioLeadingXio: NSLayoutConstraint?
    private var XioTrailingXio: NSLayoutConstraint?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        XioBuildBubbleStructureXio()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func XioBuildBubbleStructureXio() {
        backgroundColor = .clear
        selectionStyle = .none
        
        XioAvatarPinXio.layer.cornerRadius = 15
        XioAvatarPinXio.clipsToBounds = true
        XioAvatarPinXio.backgroundColor = .gray
        
        XioBubbleCoreXio.layer.cornerRadius = 10
        
        XioContentLabelXio.numberOfLines = 0
        XioContentLabelXio.font = .systemFont(ofSize: 15)
        
        [XioAvatarPinXio, XioBubbleCoreXio, XioContentLabelXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            XioAvatarPinXio.widthAnchor.constraint(equalToConstant: 30),
            XioAvatarPinXio.heightAnchor.constraint(equalToConstant: 30),
            XioAvatarPinXio.bottomAnchor.constraint(equalTo: XioBubbleCoreXio.bottomAnchor),
            
            XioBubbleCoreXio.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            XioBubbleCoreXio.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            XioBubbleCoreXio.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            
            XioContentLabelXio.topAnchor.constraint(equalTo: XioBubbleCoreXio.topAnchor, constant: 10),
            XioContentLabelXio.bottomAnchor.constraint(equalTo: XioBubbleCoreXio.bottomAnchor, constant: -10),
            XioContentLabelXio.leadingAnchor.constraint(equalTo: XioBubbleCoreXio.leadingAnchor, constant: 12),
            XioContentLabelXio.trailingAnchor.constraint(equalTo: XioBubbleCoreXio.trailingAnchor, constant: -12)
        ])
        
        XioLeadingXio = XioAvatarPinXio.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15)
        XioTrailingXio = XioAvatarPinXio.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
    }
    
    func XioHydrateBubbleXio(_ data: XioSpeechEntityXio) {
        XioContentLabelXio.text = data.XioContentXio
        
        XioLeadingXio?.isActive = !data.XioIsSenderXio
        XioTrailingXio?.isActive = data.XioIsSenderXio
        
        if data.XioIsSenderXio {
            XioBubbleCoreXio.backgroundColor = UIColor(white: 0.15, alpha: 1.0)
            XioContentLabelXio.textColor = .white
            NSLayoutConstraint.activate([
                XioBubbleCoreXio.trailingAnchor.constraint(equalTo: XioAvatarPinXio.leadingAnchor, constant: -10)
            ])
        } else {
            XioBubbleCoreXio.backgroundColor = UIColor(white: 0.12, alpha: 1.0)
            XioContentLabelXio.textColor = .white
            NSLayoutConstraint.activate([
                XioBubbleCoreXio.leadingAnchor.constraint(equalTo: XioAvatarPinXio.trailingAnchor, constant: 10)
            ])
        }
    }
}
