//
//  XioVisionOutcomeControllerXio.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/25.
//

import UIKit

class XioVisionOutcomeControllerXio: UIViewController {

    private let XioTopShipXio = UIView()
    private let XioBackAnchorXio = UIButton()
    private let XioVerdictTitleXio = UILabel()
    
    private let XioPrimeDisplayXio = UIImageView()
    
    private let XioActionDeckXio = UIStackView()
    private let XioCaptureTriggerXio = UIButton()
    private let XioArchiveTriggerXio = UIButton()
    
    private let XioScaleWXio = UIScreen.main.bounds.width / 375
    private let XioScaleHXio = UIScreen.main.bounds.height / 812
    
    var XioFinalArtXio: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        XioPrepareStageXio()
        XioMapHierarchyXio()
        XioLoadSampleArtXio()
    }
    
    private func XioPrepareStageXio() {
        view.backgroundColor = UIColor(white: 0.07, alpha: 1.0)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func XioMapHierarchyXio() {
        [XioTopShipXio, XioPrimeDisplayXio, XioActionDeckXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        XioBackAnchorXio.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        XioBackAnchorXio.tintColor = .white
        XioBackAnchorXio.addTarget(self, action: #selector(XioReverseFlowXio), for: .touchUpInside)
        
        XioVerdictTitleXio.text = "Generute results"
        XioVerdictTitleXio.textColor = .white
        XioVerdictTitleXio.font = .systemFont(ofSize: 20 * XioScaleWXio, weight: .bold)
        
        [XioBackAnchorXio, XioVerdictTitleXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioTopShipXio.addSubview($0)
        }
        
        XioPrimeDisplayXio.contentMode = .scaleAspectFill
        XioPrimeDisplayXio.clipsToBounds = true
        XioPrimeDisplayXio.backgroundColor = .darkGray
        
        XioActionDeckXio.axis = .vertical
        XioActionDeckXio.spacing = 16 * XioScaleHXio
        XioActionDeckXio.distribution = .fillEqually
        
        XioCaptureTriggerXio.setTitle("Download", for: .normal)
        XioCaptureTriggerXio.setTitleColor(.white, for: .normal)
        XioCaptureTriggerXio.titleLabel?.font = .systemFont(ofSize: 16 * XioScaleWXio, weight: .semibold)
        XioCaptureTriggerXio.layer.borderWidth = 1.5
        XioCaptureTriggerXio.layer.borderColor = UIColor.white.cgColor
        XioCaptureTriggerXio.layer.cornerRadius = 8 * XioScaleWXio
        XioCaptureTriggerXio.addTarget(self, action: #selector(XioInitiateDownloadXio), for: .touchUpInside)
        
        XioArchiveTriggerXio.setTitle("Save", for: .normal)
        XioArchiveTriggerXio.setTitleColor(.black, for: .normal)
        XioArchiveTriggerXio.backgroundColor = UIColor(red: 0.72, green: 0.95, blue: 0.55, alpha: 1.0)
        XioArchiveTriggerXio.titleLabel?.font = .systemFont(ofSize: 16 * XioScaleWXio, weight: .bold)
        XioArchiveTriggerXio.layer.cornerRadius = 8 * XioScaleWXio
        XioArchiveTriggerXio.addTarget(self, action: #selector(XioInitiateSaveXio), for: .touchUpInside)
        
        XioActionDeckXio.addArrangedSubview(XioCaptureTriggerXio)
        XioActionDeckXio.addArrangedSubview(XioArchiveTriggerXio)
        
        NSLayoutConstraint.activate([
            XioTopShipXio.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            XioTopShipXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioTopShipXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioTopShipXio.heightAnchor.constraint(equalToConstant: 60 * XioScaleHXio),
            
            XioBackAnchorXio.leadingAnchor.constraint(equalTo: XioTopShipXio.leadingAnchor, constant: 16),
            XioBackAnchorXio.centerYAnchor.constraint(equalTo: XioTopShipXio.centerYAnchor),
            XioVerdictTitleXio.leadingAnchor.constraint(equalTo: XioBackAnchorXio.trailingAnchor, constant: 16),
            XioVerdictTitleXio.centerYAnchor.constraint(equalTo: XioTopShipXio.centerYAnchor),
            
            XioPrimeDisplayXio.topAnchor.constraint(equalTo: XioTopShipXio.bottomAnchor, constant: 10),
            XioPrimeDisplayXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioPrimeDisplayXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioPrimeDisplayXio.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.3),
            
            XioActionDeckXio.topAnchor.constraint(equalTo: XioPrimeDisplayXio.bottomAnchor, constant: 40 * XioScaleHXio),
            XioActionDeckXio.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25 * XioScaleWXio),
            XioActionDeckXio.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25 * XioScaleWXio),
            XioActionDeckXio.heightAnchor.constraint(equalToConstant: 120 * XioScaleHXio)
        ])
    }
    
    private func XioLoadSampleArtXio() {
        XioPrimeDisplayXio.image = UIImage(named: "XioGeneratedSampleXio")
    }
    
    @objc private func XioReverseFlowXio() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func XioInitiateDownloadXio() {
        guard let XioImgXio = XioPrimeDisplayXio.image else { return }
        UIImageWriteToSavedPhotosAlbum(XioImgXio, self, #selector(XioTransferFinalizedXio(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc private func XioInitiateSaveXio() {
        let XioAlertXio = UIAlertController(title: "Success", message: "Result has been synced to your profile.", preferredStyle: .alert)
        XioAlertXio.addAction(UIAlertAction(title: "OK", style: .default))
        present(XioAlertXio, animated: true)
    }
    
    @objc private func XioTransferFinalizedXio(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        let XioToastXio = UILabel()
        XioToastXio.text = error == nil ? "Saved to Gallery" : "Storage Error"
        XioToastXio.textColor = .white
        XioToastXio.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        XioToastXio.textAlignment = .center
        XioToastXio.font = .systemFont(ofSize: 14)
        XioToastXio.layer.cornerRadius = 15
        XioToastXio.clipsToBounds = true
        XioToastXio.frame = CGRect(x: (view.frame.width - 150)/2, y: view.frame.height - 150, width: 150, height: 30)
        view.addSubview(XioToastXio)
        
        UIView.animate(withDuration: 2.0, animations: { XioToastXio.alpha = 0 }) { _ in XioToastXio.removeFromSuperview() }
    }
}
