//
//  XioSafetyAuditPilotXio.swift
//  Xnioa
//
//  Created by mumu on 2026/2/25.
//

import UIKit

class XioSafetyAuditPilotXio: UIViewController {

    private let XioApexDeckXio = UIView()
    private let XioRetreatBtnXio = UIButton()
    private let XioAuditTitleXio = UILabel()
    
    private let XioVaultScrollXio = UIScrollView()
    private let XioPortalStackXio = UIStackView()
    
    private let XioTagGridXio = UIView()
    private let XioInputTerminalXio = UITextView()
    private let XioPlaceholderXio = UILabel()
    
    private let XioSubmitTriggerXio = UIButton()
    
    private let XioUnitWXio = UIScreen.main.bounds.width / 375
    private let XioUnitHXio = UIScreen.main.bounds.height / 812
    
    private var XioSelectedOffenseXio: String?
    private let XioViolationLexiconXio = [
        "Harassment", "Malicious fraud",
        "Pornography", "Malicious insults",
        "Country"
    ]
    
    private var XioTagNodesXio: [UIButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        XioInitialBaseOrbitXio()
        XioAssembleStructureXio()
    }
    
    private func XioInitialBaseOrbitXio() {
        view.backgroundColor = UIColor(white: 0.07, alpha: 1.0)
        XioInputTerminalXio.delegate = self
    }
    
    private func XioAssembleStructureXio() {
        [XioApexDeckXio, XioVaultScrollXio, XioSubmitTriggerXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        XioRetreatBtnXio.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        XioRetreatBtnXio.tintColor = .white
        XioRetreatBtnXio.addTarget(self, action: #selector(XioExitProtocolXio), for: .touchUpInside)
        
        XioAuditTitleXio.text = "Report"
        XioAuditTitleXio.textColor = .white
        XioAuditTitleXio.font = .systemFont(ofSize: 20 * XioUnitWXio, weight: .bold)
        
        [XioRetreatBtnXio, XioAuditTitleXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioApexDeckXio.addSubview($0)
        }
        
        XioVaultScrollXio.addSubview(XioPortalStackXio)
        XioPortalStackXio.axis = .vertical
        XioPortalStackXio.spacing = 25 * XioUnitHXio
        XioPortalStackXio.translatesAutoresizingMaskIntoConstraints = false
        
        XioBuildTagMatrixXio()
        
        XioInputTerminalXio.backgroundColor = UIColor(white: 0.15, alpha: 1.0)
        XioInputTerminalXio.textColor = .white
        XioInputTerminalXio.font = .systemFont(ofSize: 15 * XioUnitWXio)
        XioInputTerminalXio.layer.cornerRadius = 8 * XioUnitWXio
        XioInputTerminalXio.textContainerInset = UIEdgeInsets(top: 15, left: 12, bottom: 15, right: 12)
        
        XioPlaceholderXio.text = "Please enter"
        XioPlaceholderXio.textColor = .darkGray
        XioPlaceholderXio.font = .systemFont(ofSize: 15 * XioUnitWXio)
        XioPlaceholderXio.translatesAutoresizingMaskIntoConstraints = false
        XioInputTerminalXio.addSubview(XioPlaceholderXio)
        
        XioSubmitTriggerXio.backgroundColor = UIColor(red: 0.72, green: 0.95, blue: 0.55, alpha: 1.0)
        XioSubmitTriggerXio.setTitle("Submit", for: .normal)
        XioSubmitTriggerXio.setTitleColor(.black, for: .normal)
        XioSubmitTriggerXio.titleLabel?.font = .systemFont(ofSize: 16 * XioUnitWXio, weight: .bold)
        XioSubmitTriggerXio.layer.cornerRadius = 10 * XioUnitWXio
        XioSubmitTriggerXio.addTarget(self, action: #selector(XioExecuteDispatchXio), for: .touchUpInside)
        
        XioPortalStackXio.addArrangedSubview(XioTagGridXio)
        XioPortalStackXio.addArrangedSubview(XioInputTerminalXio)
        
        NSLayoutConstraint.activate([
            XioApexDeckXio.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            XioApexDeckXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioApexDeckXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioApexDeckXio.heightAnchor.constraint(equalToConstant: 60 * XioUnitHXio),
            
            XioRetreatBtnXio.leadingAnchor.constraint(equalTo: XioApexDeckXio.leadingAnchor, constant: 20),
            XioRetreatBtnXio.centerYAnchor.constraint(equalTo: XioApexDeckXio.centerYAnchor),
            XioAuditTitleXio.leadingAnchor.constraint(equalTo: XioRetreatBtnXio.trailingAnchor, constant: 15),
            XioAuditTitleXio.centerYAnchor.constraint(equalTo: XioApexDeckXio.centerYAnchor),
            
            XioVaultScrollXio.topAnchor.constraint(equalTo: XioApexDeckXio.bottomAnchor),
            XioVaultScrollXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioVaultScrollXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioVaultScrollXio.bottomAnchor.constraint(equalTo: XioSubmitTriggerXio.topAnchor),
            
            XioPortalStackXio.topAnchor.constraint(equalTo: XioVaultScrollXio.topAnchor, constant: 10 * XioUnitHXio),
            XioPortalStackXio.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * XioUnitWXio),
            XioPortalStackXio.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * XioUnitWXio),
            XioPortalStackXio.bottomAnchor.constraint(equalTo: XioVaultScrollXio.bottomAnchor),
            XioPortalStackXio.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40 * XioUnitWXio),
            
            XioTagGridXio.heightAnchor.constraint(equalToConstant: 160 * XioUnitHXio),
            XioInputTerminalXio.heightAnchor.constraint(equalToConstant: 220 * XioUnitHXio),
            
            XioPlaceholderXio.topAnchor.constraint(equalTo: XioInputTerminalXio.topAnchor, constant: 15),
            XioPlaceholderXio.leadingAnchor.constraint(equalTo: XioInputTerminalXio.leadingAnchor, constant: 16),
            
            XioSubmitTriggerXio.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * XioUnitWXio),
            XioSubmitTriggerXio.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * XioUnitWXio),
            XioSubmitTriggerXio.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15 * XioUnitHXio),
            XioSubmitTriggerXio.heightAnchor.constraint(equalToConstant: 50 * XioUnitHXio)
        ])
    }
    
    private func XioBuildTagMatrixXio() {
        var XioCursorXXio: CGFloat = 0
        var XioCursorYXio: CGFloat = 0
        let XioGapXio: CGFloat = 10 * XioUnitWXio
        
        for XioItemXio in XioViolationLexiconXio {
            let XioNodeXio = UIButton()
            XioNodeXio.setTitle(XioItemXio, for: .normal)
            XioNodeXio.titleLabel?.font = .systemFont(ofSize: 14 * XioUnitWXio)
            XioNodeXio.contentEdgeInsets = UIEdgeInsets(top: 8, left: 14, bottom: 8, right: 14)
            XioNodeXio.layer.cornerRadius = 6 * XioUnitWXio
            XioNodeXio.layer.borderWidth = 1
            XioNodeXio.layer.borderColor = UIColor.darkGray.cgColor
            XioNodeXio.setTitleColor(.lightGray, for: .normal)
            XioNodeXio.addTarget(self, action: #selector(XioSelectViolationXio(_:)), for: .touchUpInside)
            
            XioNodeXio.sizeToFit()
            let XioNodeWXio = XioNodeXio.frame.width + 28
            let XioNodeHXio = XioNodeXio.frame.height + 16
            
            if XioCursorXXio + XioNodeWXio > (UIScreen.main.bounds.width - 40 * XioUnitWXio) {
                XioCursorXXio = 0
                XioCursorYXio += XioNodeHXio + XioGapXio
            }
            
            XioNodeXio.frame = CGRect(x: XioCursorXXio, y: XioCursorYXio, width: XioNodeWXio, height: XioNodeHXio)
            XioTagGridXio.addSubview(XioNodeXio)
            XioTagNodesXio.append(XioNodeXio)
            XioCursorXXio += XioNodeWXio + XioGapXio
        }
    }
    
    @objc private func XioSelectViolationXio(_ sender: UIButton) {
        XioTagNodesXio.forEach {
            $0.layer.borderColor = UIColor.darkGray.cgColor
            $0.setTitleColor(.lightGray, for: .normal)
            $0.backgroundColor = .clear
        }
        sender.layer.borderColor = UIColor(red: 0.72, green: 0.95, blue: 0.55, alpha: 1.0).cgColor
        sender.setTitleColor(UIColor(red: 0.72, green: 0.95, blue: 0.55, alpha: 1.0), for: .normal)
        XioSelectedOffenseXio = sender.titleLabel?.text
    }
    
    @objc private func XioExecuteDispatchXio() {
        guard XioSelectedOffenseXio != nil else { return }
        let XioSuccessXio = UIAlertController(title: "Success", message: "Report has been filed", preferredStyle: .alert)
        XioSuccessXio.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.XioExitProtocolXio()
        }))
        present(XioSuccessXio, animated: true)
    }
    
    @objc private func XioExitProtocolXio() {
        navigationController?.popViewController(animated: true)
    }
}

extension XioSafetyAuditPilotXio: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        XioPlaceholderXio.isHidden = !textView.text.isEmpty
    }
}
