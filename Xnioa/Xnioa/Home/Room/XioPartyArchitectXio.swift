//
//  XioPartyArchitectXio.swift
//  Xnioa
//
//  Created by mumu on 2026/2/25.
//

import UIKit

class XioPartyArchitectXio: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private let XioChronicleScrollerXio = UIScrollView()
    private let XioMasterRackXio = UIView()
    
    private let XioNavigationHeaderXio = UIView()
    private let XioRetreatTriggerXio = UIButton()
    private let XioDraftTitleTagXio = UILabel()
    
    private let XioSceneSectionTitleXio = UILabel()
    private let XioSceneCollectionXio: UICollectionView = {
        let XioLayoutXio = UICollectionViewFlowLayout()
        XioLayoutXio.scrollDirection = .vertical
        return UICollectionView(frame: .zero, collectionViewLayout: XioLayoutXio)
    }()
    
    private let XioTypeSectionTitleXio = UILabel()
    private let XioTypeStackXio = UIStackView()
    
    private let XioCoverVesselXio = UIView()
    private let XioCoverDisplayXio = UIImageView()
    private let XioCoverKillTriggerXio = UIButton()
    
    private let XioNamingVesselXio = UIView()
    private let XioNameInputXio = UITextField()
    private let XioPencilIconXio = UIImageView()
    
    private let XioFinalizeTriggerXio = UIButton()
    
    private let XioWidthRatioXio = UIScreen.main.bounds.width / 375
    private let XioHeightRatioXio = UIScreen.main.bounds.height / 812
    
    private var XioSelectedSceneIndexXio = 0
    private let XioSceneAssetsXio = ["picjkBg0", "picjkBg1", "picjkBg2", "picjkBg3"]
    private let XioTypeCategoriesXio = ["For you", "Trending", "Fairy tale", "Age"]
    private var XioCurrentCategoryXio = "For you"

    override func viewDidLoad() {
        super.viewDidLoad()
        XioInitializeStageXio()
        XioForgeLayoutXio()
        XioPopulateTypeFiltersXio()
    }
    
    private func XioInitializeStageXio() {
        view.backgroundColor = UIColor(white: 0.05, alpha: 1.0)
        XioChronicleScrollerXio.contentInsetAdjustmentBehavior = .never
        
        XioSceneCollectionXio.delegate = self
        XioSceneCollectionXio.dataSource = self
        XioSceneCollectionXio.register(XioSceneCellXio.self, forCellWithReuseIdentifier: "XioSceneCellXio")
        XioSceneCollectionXio.backgroundColor = .clear
    }
    
    private func XioForgeLayoutXio() {
        XioChronicleScrollerXio.translatesAutoresizingMaskIntoConstraints = false
        XioMasterRackXio.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(XioChronicleScrollerXio)
        XioChronicleScrollerXio.addSubview(XioMasterRackXio)
        
        XioRetreatTriggerXio.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        XioRetreatTriggerXio.tintColor = .white
        XioRetreatTriggerXio.addTarget(self, action: #selector(XioPerformRetreatXio), for: .touchUpInside)
        
        XioDraftTitleTagXio.text = "Create Vintage party"
        XioDraftTitleTagXio.textColor = .white
        XioDraftTitleTagXio.font = .systemFont(ofSize: 22 * XioWidthRatioXio, weight: .bold)
        
        XioSceneSectionTitleXio.text = "Party scene"
        XioSceneSectionTitleXio.textColor = .darkGray
        XioSceneSectionTitleXio.font = .systemFont(ofSize: 18 * XioWidthRatioXio, weight: .semibold)
        
        XioTypeSectionTitleXio.text = "Type"
        XioTypeSectionTitleXio.textColor = .darkGray
        XioTypeSectionTitleXio.font = .systemFont(ofSize: 18 * XioWidthRatioXio, weight: .semibold)
        
        XioCoverVesselXio.layer.cornerRadius = 12 * XioWidthRatioXio
        XioCoverVesselXio.clipsToBounds = true
        XioCoverDisplayXio.image = UIImage(named: "XioDefaultCoverXio")
        XioCoverDisplayXio.contentMode = .scaleAspectFill
        XioCoverDisplayXio.isUserInteractionEnabled = true
        let XioTapXio = UITapGestureRecognizer(target: self, action: #selector(XioTriggerGalleryXio))
        XioCoverDisplayXio.addGestureRecognizer(XioTapXio)
        
        XioCoverKillTriggerXio.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        XioCoverKillTriggerXio.tintColor = .white
        
        XioNamingVesselXio.backgroundColor = UIColor(white: 0.15, alpha: 1.0)
        XioNamingVesselXio.layer.cornerRadius = 12 * XioWidthRatioXio
        
        XioNameInputXio.attributedPlaceholder = NSAttributedString(string: "Room Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        XioNameInputXio.textColor = .white
        XioNameInputXio.font = .systemFont(ofSize: 16 * XioWidthRatioXio)
        XioPencilIconXio.image = UIImage(systemName: "pencil")
        XioPencilIconXio.tintColor = .white
        
        XioFinalizeTriggerXio.backgroundColor = UIColor(red: 0.7, green: 0.9, blue: 0.6, alpha: 1.0)
        XioFinalizeTriggerXio.setTitle("Create", for: .normal)
        XioFinalizeTriggerXio.setTitleColor(.black, for: .normal)
        XioFinalizeTriggerXio.titleLabel?.font = .systemFont(ofSize: 18 * XioWidthRatioXio, weight: .bold)
        XioFinalizeTriggerXio.layer.cornerRadius = 10 * XioWidthRatioXio
        XioFinalizeTriggerXio.addTarget(self, action: #selector(XioExecuteCreationXio), for: .touchUpInside)
        
        [XioNavigationHeaderXio, XioSceneSectionTitleXio, XioSceneCollectionXio, XioTypeSectionTitleXio, XioTypeStackXio, XioCoverVesselXio, XioNamingVesselXio, XioFinalizeTriggerXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioMasterRackXio.addSubview($0)
        }
        
        [XioRetreatTriggerXio, XioDraftTitleTagXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioNavigationHeaderXio.addSubview($0)
        }
        
        XioCoverDisplayXio.image = UIImage(named: "adddCovertw")
        
        
        XioCoverDisplayXio.translatesAutoresizingMaskIntoConstraints = false
        XioCoverKillTriggerXio.translatesAutoresizingMaskIntoConstraints = false
        XioCoverVesselXio.addSubview(XioCoverDisplayXio)
        XioCoverVesselXio.addSubview(XioCoverKillTriggerXio)
        
        XioNameInputXio.translatesAutoresizingMaskIntoConstraints = false
        XioPencilIconXio.translatesAutoresizingMaskIntoConstraints = false
        XioNamingVesselXio.addSubview(XioNameInputXio)
        XioNamingVesselXio.addSubview(XioPencilIconXio)
        
        NSLayoutConstraint.activate([
            XioChronicleScrollerXio.topAnchor.constraint(equalTo: view.topAnchor),
            XioChronicleScrollerXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioChronicleScrollerXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioChronicleScrollerXio.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            XioMasterRackXio.topAnchor.constraint(equalTo: XioChronicleScrollerXio.topAnchor),
            XioMasterRackXio.widthAnchor.constraint(equalTo: XioChronicleScrollerXio.widthAnchor),
            XioMasterRackXio.bottomAnchor.constraint(equalTo: XioChronicleScrollerXio.bottomAnchor),
            
            XioNavigationHeaderXio.topAnchor.constraint(equalTo: XioMasterRackXio.topAnchor, constant: 50 * XioHeightRatioXio),
            XioNavigationHeaderXio.leadingAnchor.constraint(equalTo: XioMasterRackXio.leadingAnchor),
            XioNavigationHeaderXio.heightAnchor.constraint(equalToConstant: 44),
            
            XioRetreatTriggerXio.leadingAnchor.constraint(equalTo: XioNavigationHeaderXio.leadingAnchor, constant: 20 * XioWidthRatioXio),
            XioRetreatTriggerXio.centerYAnchor.constraint(equalTo: XioNavigationHeaderXio.centerYAnchor),
            XioDraftTitleTagXio.leadingAnchor.constraint(equalTo: XioRetreatTriggerXio.trailingAnchor, constant: 15 * XioWidthRatioXio),
            XioDraftTitleTagXio.centerYAnchor.constraint(equalTo: XioNavigationHeaderXio.centerYAnchor),
            
            XioSceneSectionTitleXio.topAnchor.constraint(equalTo: XioNavigationHeaderXio.bottomAnchor, constant: 30 * XioHeightRatioXio),
            XioSceneSectionTitleXio.leadingAnchor.constraint(equalTo: XioMasterRackXio.leadingAnchor, constant: 20 * XioWidthRatioXio),
            
            XioSceneCollectionXio.topAnchor.constraint(equalTo: XioSceneSectionTitleXio.bottomAnchor, constant: 15 * XioHeightRatioXio),
            XioSceneCollectionXio.leadingAnchor.constraint(equalTo: XioMasterRackXio.leadingAnchor, constant: 15 * XioWidthRatioXio),
            XioSceneCollectionXio.trailingAnchor.constraint(equalTo: XioMasterRackXio.trailingAnchor, constant: -15 * XioWidthRatioXio),
            XioSceneCollectionXio.heightAnchor.constraint(equalToConstant: 340 * XioHeightRatioXio),
            
            XioTypeSectionTitleXio.topAnchor.constraint(equalTo: XioSceneCollectionXio.bottomAnchor, constant: 20 * XioHeightRatioXio),
            XioTypeSectionTitleXio.leadingAnchor.constraint(equalTo: XioSceneSectionTitleXio.leadingAnchor),
            
            XioTypeStackXio.topAnchor.constraint(equalTo: XioTypeSectionTitleXio.bottomAnchor, constant: 15 * XioHeightRatioXio),
            XioTypeStackXio.leadingAnchor.constraint(equalTo: XioMasterRackXio.leadingAnchor, constant: 20 * XioWidthRatioXio),
            XioTypeStackXio.heightAnchor.constraint(equalToConstant: 40 * XioHeightRatioXio),
            
            XioCoverVesselXio.topAnchor.constraint(equalTo: XioTypeStackXio.bottomAnchor, constant: 20 * XioHeightRatioXio),
            XioCoverVesselXio.leadingAnchor.constraint(equalTo: XioMasterRackXio.leadingAnchor, constant: 20 * XioWidthRatioXio),
            XioCoverVesselXio.widthAnchor.constraint(equalToConstant: 100 * XioWidthRatioXio),
            XioCoverVesselXio.heightAnchor.constraint(equalToConstant: 100 * XioWidthRatioXio),
            
            XioCoverDisplayXio.topAnchor.constraint(equalTo: XioCoverVesselXio.topAnchor),
            XioCoverDisplayXio.bottomAnchor.constraint(equalTo: XioCoverVesselXio.bottomAnchor),
            XioCoverDisplayXio.leadingAnchor.constraint(equalTo: XioCoverVesselXio.leadingAnchor),
            XioCoverDisplayXio.trailingAnchor.constraint(equalTo: XioCoverVesselXio.trailingAnchor),
            
            XioCoverKillTriggerXio.topAnchor.constraint(equalTo: XioCoverVesselXio.topAnchor, constant: 5),
            XioCoverKillTriggerXio.trailingAnchor.constraint(equalTo: XioCoverVesselXio.trailingAnchor, constant: -5),
            
            XioNamingVesselXio.topAnchor.constraint(equalTo: XioCoverVesselXio.topAnchor),
            XioNamingVesselXio.leadingAnchor.constraint(equalTo: XioCoverVesselXio.trailingAnchor, constant: 15 * XioWidthRatioXio),
            XioNamingVesselXio.trailingAnchor.constraint(equalTo: XioMasterRackXio.trailingAnchor, constant: -20 * XioWidthRatioXio),
            XioNamingVesselXio.heightAnchor.constraint(equalTo: XioCoverVesselXio.heightAnchor),
            
            XioPencilIconXio.centerXAnchor.constraint(equalTo: XioNamingVesselXio.centerXAnchor),
            XioPencilIconXio.topAnchor.constraint(equalTo: XioNamingVesselXio.topAnchor, constant: 25 * XioHeightRatioXio),
            XioNameInputXio.topAnchor.constraint(equalTo: XioPencilIconXio.bottomAnchor, constant: 10),
            XioNameInputXio.centerXAnchor.constraint(equalTo: XioNamingVesselXio.centerXAnchor),
            
            XioFinalizeTriggerXio.topAnchor.constraint(equalTo: XioNamingVesselXio.bottomAnchor, constant: 50 * XioHeightRatioXio),
            XioFinalizeTriggerXio.leadingAnchor.constraint(equalTo: XioMasterRackXio.leadingAnchor, constant: 20 * XioWidthRatioXio),
            XioFinalizeTriggerXio.trailingAnchor.constraint(equalTo: XioMasterRackXio.trailingAnchor, constant: -20 * XioWidthRatioXio),
            XioFinalizeTriggerXio.heightAnchor.constraint(equalToConstant: 55 * XioHeightRatioXio),
            XioFinalizeTriggerXio.bottomAnchor.constraint(equalTo: XioMasterRackXio.bottomAnchor, constant: -40 * XioHeightRatioXio)
        ])
    }
    
    private func XioPopulateTypeFiltersXio() {
        XioTypeStackXio.axis = .horizontal
        XioTypeStackXio.spacing = 10 * XioWidthRatioXio
        XioTypeCategoriesXio.forEach { XioNameXio in
            let XioBtnXio = UIButton()
            XioBtnXio.setTitle(XioNameXio, for: .normal)
            XioBtnXio.titleLabel?.font = .italicSystemFont(ofSize: 15 * XioWidthRatioXio)
            XioBtnXio.contentEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
            XioBtnXio.layer.cornerRadius = 8
            XioBtnXio.layer.borderWidth = 1
            XioBtnXio.layer.borderColor = UIColor.darkGray.cgColor
            XioBtnXio.addTarget(self, action: #selector(XioToggleCategoryXio(_:)), for: .touchUpInside)
            if XioNameXio == XioCurrentCategoryXio {
                XioBtnXio.backgroundColor = UIColor(red: 0.7, green: 0.9, blue: 0.6, alpha: 1.0)
                XioBtnXio.setTitleColor(.black, for: .normal)
            } else {
                XioBtnXio.setTitleColor(.white, for: .normal)
            }
            XioTypeStackXio.addArrangedSubview(XioBtnXio)
        }
    }
    
    @objc private func XioToggleCategoryXio(_ XioSenderXio: UIButton) {
        XioTypeStackXio.arrangedSubviews.forEach { ($0 as? UIButton)?.backgroundColor = .clear; ($0 as? UIButton)?.setTitleColor(.white, for: .normal) }
        XioSenderXio.backgroundColor = UIColor(red: 0.7, green: 0.9, blue: 0.6, alpha: 1.0)
        XioSenderXio.setTitleColor(.black, for: .normal)
        XioCurrentCategoryXio = XioSenderXio.title(for: .normal) ?? ""
    }
    
    @objc private func XioTriggerGalleryXio() {
        let XioPickerXio = UIImagePickerController()
        XioPickerXio.delegate = self
        XioPickerXio.sourceType = .photoLibrary
        present(XioPickerXio, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let XioImgXio = info[.originalImage] as? UIImage { XioCoverDisplayXio.image = XioImgXio }
        picker.dismiss(animated: true)
    }
    
    @objc private func XioExecuteCreationXio() {
        let XioFeedbackXio = UIImpactFeedbackGenerator(style: .heavy)
        XioFeedbackXio.impactOccurred()
        self.dismiss(animated: true)
    }
    
    @objc private func XioPerformRetreatXio() {
        navigationController?.popViewController(animated: true)
    }
}

extension XioPartyArchitectXio: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return 4 }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let XioCellXio = collectionView.dequeueReusableCell(withReuseIdentifier: "XioSceneCellXio", for: indexPath) as! XioSceneCellXio
        XioCellXio.XioApplySceneXio(XioSceneAssetsXio[indexPath.item], XioIsChosenXio: indexPath.item == XioSelectedSceneIndexXio)
        return XioCellXio
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        XioSelectedSceneIndexXio = indexPath.item
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let XioWidthXio = (collectionView.frame.width - 15) / 2
        return CGSize(width: XioWidthXio, height: 160 * XioHeightRatioXio)
    }
}

class XioSceneCellXio: UICollectionViewCell {
    private let XioPreviewXio = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        XioPreviewXio.frame = bounds
        XioPreviewXio.contentMode = .scaleAspectFill
        XioPreviewXio.layer.cornerRadius = 12
        XioPreviewXio.clipsToBounds = true
        contentView.addSubview(XioPreviewXio)
    }
    required init?(coder: NSCoder) { fatalError() }
    
    func XioApplySceneXio(_ XioAssetNameXio: String, XioIsChosenXio: Bool) {
        XioPreviewXio.image = UIImage(named: XioAssetNameXio)
        layer.borderWidth = XioIsChosenXio ? 3 : 0
        layer.borderColor = UIColor(red: 0.7, green: 0.9, blue: 0.6, alpha: 1.0).cgColor
        layer.cornerRadius = 12
    }
}
