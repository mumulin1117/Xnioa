//
//  XioAIVisualPilotXio.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/25.
//

import UIKit

class XioAIVisualPilotXio: XioResilienceAnchorXio {

    private let XioVortexScrollXio = UIScrollView()
    private let XioCanvasRackXio = UIView()
    
    private let XioNaviBarXio = UIView()
    private let XioRetreatBtnXio = UIButton()
    private let XioHeaderTitleXio = UILabel()
    
    // Keyword Input with Pencil icon logic
    private let XioPromptTerminalXio = UIView()
    private let XioGlyphIconXio = UIImageView()
    private let XioPromptFieldXio = UITextField()
    
    private let XioClassTitleXio = UILabel()
    private let XioClassStackXio = UIStackView()
    private let XioClassContainerXio = UIScrollView()
    
    private let XioCoutureTitleXio = UILabel()
    private let XioCoutureGridXio: UICollectionView = {
        let XioFlowXio = UICollectionViewFlowLayout()
        XioFlowXio.minimumInteritemSpacing = 12
        XioFlowXio.minimumLineSpacing = 12
        return UICollectionView(frame: .zero, collectionViewLayout: XioFlowXio)
    }()
    
    private let XioForgeTriggerXio = UIButton()
    
    private let XioWScaleXio = UIScreen.main.bounds.width / 375
    private let XioHScaleXio = UIScreen.main.bounds.height / 812
    
    private let XioPartyClassesXio = ["Court Ball", "Jazz", "Rock", "Disco", "Country"]
    private let XioStylesDataXio = ["XioStyle1","XioStyle2","XioStyle3","XioStyle4"]
    
    private var XioCurrentSelectionIndexXio: Int?
    private var XioActiveTypeXio = "Court Ball"

    
    private var XioUserBalanceXio: Int  {
       return XioGovernanceHubXio.XioPrincipalXio.XioCurrentReserveXio
    }// Local mock balance
        
    private let XioForgeCostXio: Int = 400
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        XioSetupEnvironmentXio()
        XioArchitectLayoutXio()
        XioSyncClassButtonsXio()
        
        XioForgeTriggerXio.addTarget(self, action: #selector(XioInitiateForgeProcessXio), for: .touchUpInside)
    }
    @objc private func XioInitiateForgeProcessXio() {
        
        let sxnioInputName = XioPromptFieldXio.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        if sxnioInputName.isEmpty {
            sxnioShowAlert(sxnioMsg: "Please enter the keyboard words!")
            return
            
        }
        
        if XioCurrentSelectionIndexXio == nil {
            
            sxnioShowAlert(sxnioMsg: "Please pick your clothing style at first!")
            
            return
        }
        
        XioShowDeductionAlertXio()
        
    }
    private func XioShowDeductionAlertXio() {
        let XioAlertXio = XioDiamondNoticeViewXio(frame: view.bounds)
        XioAlertXio.XioConfigureAsConfirmXio(cost: XioForgeCostXio) { [weak self] in
            self?.XioExecutePaymentXio()
        }
        view.addSubview(XioAlertXio)
        
    }
        
        private func XioExecutePaymentXio() {
            
         
            
            if XioGovernanceHubXio.XioPrincipalXio.XioSpendReserveXio(cost: XioForgeCostXio) {
                
              
                XioTriggerSuccessFeedbackXio()
            } else {
                XioShowInsufficientAlertXio()
            }
       
        }
    private func sxnioShowAlert(sxnioMsg: String) {
        let sxnioAlert = UIAlertController(title: nil, message: sxnioMsg, preferredStyle: .alert)
        sxnioAlert.addAction(UIAlertAction(title: "OK", style: .default))
        present(sxnioAlert, animated: true)
    }
        private func XioShowInsufficientAlertXio() {
            let XioAlertXio = XioDiamondNoticeViewXio(frame: view.bounds)
            XioAlertXio.XioConfigureAsInsufficientXio { [weak self] in
                self?.XioRouteToStoreXio()
            }
            view.addSubview(XioAlertXio)
        }
        
        private func XioTriggerSuccessFeedbackXio() {
            // Logic for generating AI result
            print("Payment Successful. Remaining: \(XioUserBalanceXio)")
            
            self.navigationController?.pushViewController(XioVisionOutcomeControllerXio(), animated: true)
        }
        
        private func XioRouteToStoreXio() {
            self.navigationController?.pushViewController(XioTreasureVaultXio(), animated: true)
        }
    private func XioSetupEnvironmentXio() {
        view.backgroundColor = UIColor(white: 0.08, alpha: 1.0)
        XioVortexScrollXio.contentInsetAdjustmentBehavior = .never
        
        XioCoutureGridXio.delegate = self
        XioCoutureGridXio.dataSource = self
        XioCoutureGridXio.backgroundColor = .clear
        XioCoutureGridXio.isScrollEnabled = false
        XioCoutureGridXio.register(XioCoutureCellXio.self, forCellWithReuseIdentifier: "XioCoutureCellXio")
    }
    
    private func XioArchitectLayoutXio() {
        [XioVortexScrollXio, XioNaviBarXio, XioForgeTriggerXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        XioVortexScrollXio.addSubview(XioCanvasRackXio)
        XioCanvasRackXio.translatesAutoresizingMaskIntoConstraints = false
        
        XioRetreatBtnXio.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        XioRetreatBtnXio.tintColor = .white
        XioRetreatBtnXio.addTarget(self, action: #selector(XioPopActionXio), for: .touchUpInside)
        
        XioHeaderTitleXio.text = "AI Party Style"
        XioHeaderTitleXio.textColor = .white
        XioHeaderTitleXio.font = .systemFont(ofSize: 20 * XioWScaleXio, weight: .bold)
        
        XioPromptTerminalXio.backgroundColor = UIColor(white: 0.16, alpha: 1.0)
        XioPromptTerminalXio.layer.cornerRadius = 12 * XioWScaleXio
        
        XioGlyphIconXio.image = UIImage(systemName: "pencil")
        XioGlyphIconXio.tintColor = .white
        
        XioPromptFieldXio.attributedPlaceholder = NSAttributedString(string: "Please enter the keywords you want", attributes: [.foregroundColor: UIColor.gray])
        XioPromptFieldXio.textColor = .white
        XioPromptFieldXio.textAlignment = .center
        XioPromptFieldXio.font = .systemFont(ofSize: 15 * XioWScaleXio)
        
        XioClassTitleXio.text = "Types of party"
        XioClassTitleXio.textColor = .darkGray
        XioClassTitleXio.font = .systemFont(ofSize: 17 * XioWScaleXio, weight: .semibold)
        
        XioCoutureTitleXio.text = "Clothing Style"
        XioCoutureTitleXio.textColor = .darkGray
        XioCoutureTitleXio.font = .systemFont(ofSize: 17 * XioWScaleXio, weight: .semibold)
        
        // Gradient Button Logic
        XioForgeTriggerXio.backgroundColor = .clear
        XioForgeTriggerXio.setTitle("400 💎 Generate", for: .normal)
        XioForgeTriggerXio.titleLabel?.font = .systemFont(ofSize: 18 * XioWScaleXio, weight: .bold)
        XioForgeTriggerXio.layer.cornerRadius = 10 * XioWScaleXio
        XioForgeTriggerXio.clipsToBounds = true
        
        let XioGradLayerXio = CAGradientLayer()
        XioGradLayerXio.colors = [UIColor.systemPurple.cgColor, UIColor.systemPink.cgColor]
        XioGradLayerXio.startPoint = CGPoint(x: 0, y: 0.5)
        XioGradLayerXio.endPoint = CGPoint(x: 1, y: 0.5)
        XioGradLayerXio.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 40, height: 55 * XioHScaleXio)
        XioForgeTriggerXio.layer.insertSublayer(XioGradLayerXio, at: 0)

        [XioRetreatBtnXio, XioHeaderTitleXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioNaviBarXio.addSubview($0)
        }
        
        [XioPromptTerminalXio, XioClassTitleXio, XioClassContainerXio, XioCoutureTitleXio, XioCoutureGridXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioCanvasRackXio.addSubview($0)
        }
        
        XioGlyphIconXio.translatesAutoresizingMaskIntoConstraints = false
        XioPromptFieldXio.translatesAutoresizingMaskIntoConstraints = false
        XioPromptTerminalXio.addSubview(XioGlyphIconXio)
        XioPromptTerminalXio.addSubview(XioPromptFieldXio)

        NSLayoutConstraint.activate([
            XioNaviBarXio.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            XioNaviBarXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioNaviBarXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioNaviBarXio.heightAnchor.constraint(equalToConstant: 50 * XioHScaleXio),
            
            XioRetreatBtnXio.leadingAnchor.constraint(equalTo: XioNaviBarXio.leadingAnchor, constant: 16),
            XioRetreatBtnXio.centerYAnchor.constraint(equalTo: XioNaviBarXio.centerYAnchor),
            XioHeaderTitleXio.leadingAnchor.constraint(equalTo: XioRetreatBtnXio.trailingAnchor, constant: 12),
            XioHeaderTitleXio.centerYAnchor.constraint(equalTo: XioNaviBarXio.centerYAnchor),
            
            XioVortexScrollXio.topAnchor.constraint(equalTo: XioNaviBarXio.bottomAnchor),
            XioVortexScrollXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioVortexScrollXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioVortexScrollXio.bottomAnchor.constraint(equalTo: XioForgeTriggerXio.topAnchor, constant: -10),
            
            XioCanvasRackXio.topAnchor.constraint(equalTo: XioVortexScrollXio.topAnchor),
            XioCanvasRackXio.widthAnchor.constraint(equalTo: XioVortexScrollXio.widthAnchor),
            XioCanvasRackXio.bottomAnchor.constraint(equalTo: XioVortexScrollXio.bottomAnchor),
            
            XioPromptTerminalXio.topAnchor.constraint(equalTo: XioCanvasRackXio.topAnchor, constant: 15),
            XioPromptTerminalXio.leadingAnchor.constraint(equalTo: XioCanvasRackXio.leadingAnchor, constant: 20),
            XioPromptTerminalXio.trailingAnchor.constraint(equalTo: XioCanvasRackXio.trailingAnchor, constant: -20),
            XioPromptTerminalXio.heightAnchor.constraint(equalToConstant: 90 * XioHScaleXio),
            
            XioGlyphIconXio.topAnchor.constraint(equalTo: XioPromptTerminalXio.topAnchor, constant: 20 * XioHScaleXio),
            XioGlyphIconXio.centerXAnchor.constraint(equalTo: XioPromptTerminalXio.centerXAnchor),
            XioPromptFieldXio.topAnchor.constraint(equalTo: XioGlyphIconXio.bottomAnchor, constant: 10),
            XioPromptFieldXio.leadingAnchor.constraint(equalTo: XioPromptTerminalXio.leadingAnchor, constant: 10),
            XioPromptFieldXio.trailingAnchor.constraint(equalTo: XioPromptTerminalXio.trailingAnchor, constant: -10),
            
            XioClassTitleXio.topAnchor.constraint(equalTo: XioPromptTerminalXio.bottomAnchor, constant: 25),
            XioClassTitleXio.leadingAnchor.constraint(equalTo: XioCanvasRackXio.leadingAnchor, constant: 20),
            
            XioClassContainerXio.topAnchor.constraint(equalTo: XioClassTitleXio.bottomAnchor, constant: 12),
            XioClassContainerXio.leadingAnchor.constraint(equalTo: XioCanvasRackXio.leadingAnchor),
            XioClassContainerXio.trailingAnchor.constraint(equalTo: XioCanvasRackXio.trailingAnchor),
            XioClassContainerXio.heightAnchor.constraint(equalToConstant: 42 * XioHScaleXio),
            
            XioCoutureTitleXio.topAnchor.constraint(equalTo: XioClassContainerXio.bottomAnchor, constant: 25),
            XioCoutureTitleXio.leadingAnchor.constraint(equalTo: XioCanvasRackXio.leadingAnchor, constant: 20),
            
            XioCoutureGridXio.topAnchor.constraint(equalTo: XioCoutureTitleXio.bottomAnchor, constant: 12),
            XioCoutureGridXio.leadingAnchor.constraint(equalTo: XioCanvasRackXio.leadingAnchor, constant: 20),
            XioCoutureGridXio.trailingAnchor.constraint(equalTo: XioCanvasRackXio.trailingAnchor, constant: -20),
            XioCoutureGridXio.heightAnchor.constraint(equalToConstant: 460 * XioHScaleXio),
            XioCoutureGridXio.bottomAnchor.constraint(equalTo: XioCanvasRackXio.bottomAnchor, constant: -20),
            
            XioForgeTriggerXio.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            XioForgeTriggerXio.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            XioForgeTriggerXio.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            XioForgeTriggerXio.heightAnchor.constraint(equalToConstant: 55 * XioHScaleXio)
        ])
    }
    
    private func XioSyncClassButtonsXio() {
        XioClassStackXio.axis = .horizontal
        XioClassStackXio.spacing = 10
        XioClassStackXio.translatesAutoresizingMaskIntoConstraints = false
        XioClassContainerXio.addSubview(XioClassStackXio)
        XioClassContainerXio.showsHorizontalScrollIndicator = false
        
        XioPartyClassesXio.forEach { XioNameXio in
            let XioBtnXio = UIButton()
            XioBtnXio.setTitle(XioNameXio, for: .normal)
            XioBtnXio.titleLabel?.font = .systemFont(ofSize: 14 * XioWScaleXio)
            XioBtnXio.layer.cornerRadius = 8
            XioBtnXio.layer.borderWidth = 1
            XioBtnXio.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
            XioBtnXio.addTarget(self, action: #selector(XioSelectionTaskXio(_:)), for: .touchUpInside)
            
            if XioNameXio == XioActiveTypeXio {
                XioBtnXio.backgroundColor = UIColor.systemPurple
                XioBtnXio.layer.borderColor = UIColor.systemPurple.cgColor
                XioBtnXio.setTitleColor(.white, for: .normal)
            } else {
                XioBtnXio.layer.borderColor = UIColor.darkGray.cgColor
                XioBtnXio.setTitleColor(.lightGray, for: .normal)
            }
            XioClassStackXio.addArrangedSubview(XioBtnXio)
        }
        
        NSLayoutConstraint.activate([
            XioClassStackXio.topAnchor.constraint(equalTo: XioClassContainerXio.topAnchor),
            XioClassStackXio.bottomAnchor.constraint(equalTo: XioClassContainerXio.bottomAnchor),
            XioClassStackXio.leadingAnchor.constraint(equalTo: XioClassContainerXio.leadingAnchor, constant: 20),
            XioClassStackXio.trailingAnchor.constraint(equalTo: XioClassContainerXio.trailingAnchor, constant: -20),
            XioClassStackXio.heightAnchor.constraint(equalTo: XioClassContainerXio.heightAnchor)
        ])
    }
    
    @objc private func XioSelectionTaskXio(_ sender: UIButton) {
        XioClassStackXio.arrangedSubviews.forEach {
            let b = $0 as? UIButton
            b?.backgroundColor = .clear
            b?.layer.borderColor = UIColor.darkGray.cgColor
            b?.setTitleColor(.lightGray, for: .normal)
        }
        sender.backgroundColor = UIColor.systemPurple
        sender.layer.borderColor = UIColor.systemPurple.cgColor
        sender.setTitleColor(.white, for: .normal)
    }
    
    @objc private func XioPopActionXio() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Grid Implementation
extension XioAIVisualPilotXio: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return XioStylesDataXio.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let xCell = collectionView.dequeueReusableCell(withReuseIdentifier: "XioCoutureCellXio", for: indexPath) as! XioCoutureCellXio
        let item = XioStylesDataXio[indexPath.item]
        xCell.XioHydrateCellXio( img: item, xSelected: XioCurrentSelectionIndexXio == indexPath.item)
        return xCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        XioCurrentSelectionIndexXio = indexPath.item
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = (collectionView.frame.width - 12) / 2
        return CGSize(width: w, height: 215 * XioHScaleXio)
    }
}

class XioCoutureCellXio: UICollectionViewCell {
    private let XioPreviewHostXio = UIImageView()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 14 * (frame.width / 170)
        clipsToBounds = true
        
        XioPreviewHostXio.contentMode = .scaleAspectFill
        XioPreviewHostXio.frame = bounds
        contentView.addSubview(XioPreviewHostXio)
        
      
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    func XioHydrateCellXio( img: String, xSelected: Bool) {
      
        XioPreviewHostXio.image = UIImage(named: img)
        layer.borderWidth = xSelected ? 2.5 : 0
        layer.borderColor = UIColor.systemGreen.withAlphaComponent(0.8).cgColor
    }
}
