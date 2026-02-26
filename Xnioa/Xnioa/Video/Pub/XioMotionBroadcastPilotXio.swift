//
//  XioMotionBroadcastPilotXio.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/25.
//

import UIKit
import PhotosUI

class XioMotionBroadcastPilotXio: UIViewController {

    private let XioApexDeckXio = UIView()
    private let XioRetreatBtnXio = UIButton()
    private let XioTitleBadgeXio = UILabel()
    
    private let XioVaultContainerXio = UIScrollView()
    private let XioMainStackXio = UIStackView()
    
    private let XioMediaFrameXio = UIView()
    private let XioUploadGlyphXio = UIImageView()
    private let XioUploadHintXio = UILabel()
    private let XioPreviewLayerXio = UIImageView()
    
    private let XioScribeHeaderXio = UILabel()
    private let XioCountBadgeXio = UILabel()
    private let XioInputTerminalXio = UITextView()
    
    private let XioLaunchTriggerXio = UIButton()
    
    private let XioUnitWXio = UIScreen.main.bounds.width / 375
    private let XioUnitHXio = UIScreen.main.bounds.height / 812
    
    private var XioSelectedVideoPathXio: URL?

    override func viewDidLoad() {
        super.viewDidLoad()
        XioSetupBaseOrbitXio()
        XioConstructArchitectureXio()
    }
    
    private func XioSetupBaseOrbitXio() {
        view.backgroundColor = UIColor(white: 0.08, alpha: 1.0)
        XioVaultContainerXio.contentInsetAdjustmentBehavior = .never
        XioInputTerminalXio.delegate = self
    }
    
    private func XioConstructArchitectureXio() {
        [XioApexDeckXio, XioVaultContainerXio, XioLaunchTriggerXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        XioRetreatBtnXio.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        XioRetreatBtnXio.tintColor = .white
        XioRetreatBtnXio.addTarget(self, action: #selector(XioExitProtocolXio), for: .touchUpInside)
        
        XioTitleBadgeXio.text = "Release video"
        XioTitleBadgeXio.textColor = .white
        XioTitleBadgeXio.font = .systemFont(ofSize: 18 * XioUnitWXio, weight: .bold)
        
        [XioRetreatBtnXio, XioTitleBadgeXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioApexDeckXio.addSubview($0)
        }
        
        XioVaultContainerXio.addSubview(XioMainStackXio)
        XioMainStackXio.axis = .vertical
        XioMainStackXio.spacing = 20 * XioUnitHXio
        XioMainStackXio.translatesAutoresizingMaskIntoConstraints = false
        
        XioMediaFrameXio.backgroundColor = .clear
        XioMediaFrameXio.layer.cornerRadius = 12 * XioUnitWXio
        XioMediaFrameXio.clipsToBounds = true
        
        let XioDashBorderXio = CAShapeLayer()
        XioDashBorderXio.strokeColor = UIColor.systemGreen.withAlphaComponent(0.5).cgColor
        XioDashBorderXio.lineDashPattern = [4, 4]
        XioDashBorderXio.fillColor = nil
        XioDashBorderXio.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 335 * XioUnitWXio, height: 335 * XioUnitWXio), cornerRadius: 12 * XioUnitWXio).cgPath
        XioMediaFrameXio.layer.addSublayer(XioDashBorderXio)
        
        XioUploadGlyphXio.image = UIImage(systemName: "video.badge.plus")
        XioUploadGlyphXio.tintColor = .white
        XioUploadGlyphXio.contentMode = .scaleAspectFit
        
        XioUploadHintXio.text = "Upload video"
        XioUploadHintXio.textColor = .lightGray
        XioUploadHintXio.font = .systemFont(ofSize: 14 * XioUnitWXio)
        
        XioPreviewLayerXio.contentMode = .scaleAspectFill
        XioPreviewLayerXio.isHidden = true
        
        [XioUploadGlyphXio, XioUploadHintXio, XioPreviewLayerXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioMediaFrameXio.addSubview($0)
        }
        
        let XioTapGestureXio = UITapGestureRecognizer(target: self, action: #selector(XioInvokeGalleryXio))
        XioMediaFrameXio.addGestureRecognizer(XioTapGestureXio)
        
        let XioScribeRowXio = UIView()
        XioScribeHeaderXio.text = "Copywriter"
        XioScribeHeaderXio.textColor = .darkGray
        XioScribeHeaderXio.font = .systemFont(ofSize: 16 * XioUnitWXio, weight: .semibold)
        
        XioCountBadgeXio.text = "0/350"
        XioCountBadgeXio.textColor = .darkGray
        XioCountBadgeXio.font = .systemFont(ofSize: 14 * XioUnitWXio)
        
        [XioScribeHeaderXio, XioCountBadgeXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioScribeRowXio.addSubview($0)
        }
        
        XioInputTerminalXio.backgroundColor = UIColor(white: 0.15, alpha: 1.0)
        XioInputTerminalXio.textColor = .white
        XioInputTerminalXio.font = .systemFont(ofSize: 15 * XioUnitWXio)
        XioInputTerminalXio.layer.cornerRadius = 8 * XioUnitWXio
        XioInputTerminalXio.textContainerInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        
        XioLaunchTriggerXio.backgroundColor = UIColor(red: 0.72, green: 0.95, blue: 0.55, alpha: 1.0)
        XioLaunchTriggerXio.setTitle("Release", for: .normal)
        XioLaunchTriggerXio.setTitleColor(.black, for: .normal)
        XioLaunchTriggerXio.titleLabel?.font = .systemFont(ofSize: 16 * XioUnitWXio, weight: .bold)
        XioLaunchTriggerXio.layer.cornerRadius = 10 * XioUnitWXio
        XioLaunchTriggerXio.addTarget(self, action: #selector(XioExecuteBroadcastXio), for: .touchUpInside)

        XioMainStackXio.addArrangedSubview(XioMediaFrameXio)
        XioMainStackXio.addArrangedSubview(XioScribeRowXio)
        XioMainStackXio.addArrangedSubview(XioInputTerminalXio)
        
        NSLayoutConstraint.activate([
            XioApexDeckXio.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            XioApexDeckXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioApexDeckXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioApexDeckXio.heightAnchor.constraint(equalToConstant: 50 * XioUnitHXio),
            
            XioRetreatBtnXio.leadingAnchor.constraint(equalTo: XioApexDeckXio.leadingAnchor, constant: 20),
            XioRetreatBtnXio.centerYAnchor.constraint(equalTo: XioApexDeckXio.centerYAnchor),
            XioTitleBadgeXio.leadingAnchor.constraint(equalTo: XioRetreatBtnXio.trailingAnchor, constant: 15),
            XioTitleBadgeXio.centerYAnchor.constraint(equalTo: XioApexDeckXio.centerYAnchor),
            
            XioVaultContainerXio.topAnchor.constraint(equalTo: XioApexDeckXio.bottomAnchor),
            XioVaultContainerXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioVaultContainerXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioVaultContainerXio.bottomAnchor.constraint(equalTo: XioLaunchTriggerXio.topAnchor),
            
            XioMainStackXio.topAnchor.constraint(equalTo: XioVaultContainerXio.topAnchor, constant: 20 * XioUnitHXio),
            XioMainStackXio.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * XioUnitWXio),
            XioMainStackXio.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * XioUnitWXio),
            XioMainStackXio.bottomAnchor.constraint(equalTo: XioVaultContainerXio.bottomAnchor),
            
            XioMediaFrameXio.heightAnchor.constraint(equalToConstant: 335 * XioUnitWXio),
            XioUploadGlyphXio.centerXAnchor.constraint(equalTo: XioMediaFrameXio.centerXAnchor),
            XioUploadGlyphXio.centerYAnchor.constraint(equalTo: XioMediaFrameXio.centerYAnchor, constant: -10),
            XioUploadGlyphXio.widthAnchor.constraint(equalToConstant: 40 * XioUnitWXio),
            XioUploadGlyphXio.heightAnchor.constraint(equalToConstant: 40 * XioUnitWXio),
            
            XioUploadHintXio.topAnchor.constraint(equalTo: XioUploadGlyphXio.bottomAnchor, constant: 10),
            XioUploadHintXio.centerXAnchor.constraint(equalTo: XioMediaFrameXio.centerXAnchor),
            
            XioPreviewLayerXio.topAnchor.constraint(equalTo: XioMediaFrameXio.topAnchor),
            XioPreviewLayerXio.bottomAnchor.constraint(equalTo: XioMediaFrameXio.bottomAnchor),
            XioPreviewLayerXio.leadingAnchor.constraint(equalTo: XioMediaFrameXio.leadingAnchor),
            XioPreviewLayerXio.trailingAnchor.constraint(equalTo: XioMediaFrameXio.trailingAnchor),
            
            XioScribeHeaderXio.leadingAnchor.constraint(equalTo: XioMainStackXio.leadingAnchor),
            XioScribeHeaderXio.centerYAnchor.constraint(equalTo: XioScribeHeaderXio.superview!.centerYAnchor),
            XioCountBadgeXio.trailingAnchor.constraint(equalTo: XioMainStackXio.trailingAnchor),
            XioCountBadgeXio.centerYAnchor.constraint(equalTo: XioScribeHeaderXio.superview!.centerYAnchor),
            XioScribeHeaderXio.superview!.heightAnchor.constraint(equalToConstant: 30),
            
            XioInputTerminalXio.heightAnchor.constraint(equalToConstant: 180 * XioUnitHXio),
            
            XioLaunchTriggerXio.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * XioUnitWXio),
            XioLaunchTriggerXio.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * XioUnitWXio),
            XioLaunchTriggerXio.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10 * XioUnitHXio),
            XioLaunchTriggerXio.heightAnchor.constraint(equalToConstant: 50 * XioUnitHXio)
        ])
    }
    
    @objc private func XioInvokeGalleryXio() {
        var XioConfigXio = PHPickerConfiguration()
        XioConfigXio.filter = .videos
        let XioPickerXio = PHPickerViewController(configuration: XioConfigXio)
        XioPickerXio.delegate = self
        present(XioPickerXio, animated: true)
    }
    
    @objc private func XioExecuteBroadcastXio() {
        guard XioSelectedVideoPathXio != nil else {
            XioShowPromptXio("Please upload a video first")
            return
        }
        XioShowPromptXio("Broadcast successfully initialized")
    }
    
    @objc private func XioExitProtocolXio() {
        navigationController?.popViewController(animated: true)
    }
    
    private func XioShowPromptXio(_ msg: String) {
        let XioAlertXio = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        XioAlertXio.addAction(UIAlertAction(title: "Confirm", style: .default))
        present(XioAlertXio, animated: true)
    }
}

extension XioMotionBroadcastPilotXio: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        guard let XioProviderXio = results.first?.itemProvider, XioProviderXio.hasItemConformingToTypeIdentifier(UTType.movie.identifier) else { return }
        
        XioProviderXio.loadFileRepresentation(forTypeIdentifier: UTType.movie.identifier) { [weak self] url, error in
            if let XioUrlXio = url {
                DispatchQueue.main.async {
                    self?.XioSelectedVideoPathXio = XioUrlXio
                    self?.XioUploadGlyphXio.isHidden = true
                    self?.XioUploadHintXio.isHidden = true
                    self?.XioPreviewLayerXio.isHidden = false
                    self?.XioPreviewLayerXio.image = UIImage(systemName: "checkmark.circle.fill")
                    self?.XioPreviewLayerXio.tintColor = .systemGreen
                }
            }
        }
    }
}

extension XioMotionBroadcastPilotXio: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let XioLenXio = textView.text.count
        XioCountBadgeXio.text = "\(XioLenXio)/350"
        XioCountBadgeXio.textColor = XioLenXio > 350 ? .systemRed : .darkGray
    }
}
