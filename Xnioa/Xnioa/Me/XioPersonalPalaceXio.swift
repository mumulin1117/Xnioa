//
//  XioPersonalPalaceXio.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/24.
//

import UIKit
import PhotosUI

// MARK: - Core Data Model
struct XioUserProfileXio {
    let XioIdentityNameXio: String
    let XioAvatarKeyXio: String
    let XioWealthCountXio: Int
    let XioFollowerTotalXio: Int
    let XioFollowingTotalXio: Int
}

// MARK: - Profile Controller
class XioPersonalPalaceXio: UIViewController, PHPickerViewControllerDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    private let XioEditNameBtnXio = UIButton() // 新增编辑名字按钮
    private let XioRootScrollXio = UIScrollView()
    private let XioContentRackXio = UIView()
    
    private let XioSettingsTriggerXio = UIButton()
    private let XioDiamondBadgeXio = UIButton()
    private let XioDiamondIconXio = UIImageView()
    private let XioDiamondValueXio = UILabel()
    
    private let XioMasterAvatarXio = UIButton()
    private let XioMasterNameXio = UILabel()
    
    private let XioSocialStackXio = UIStackView()
    private let XioFollowerBoxXio = UILabel()
    private let XioFollowingBoxXio = UILabel()
    
    private let XioSegmentDockXio = UIView()
    private let XioRoomTabXio = UIButton()
    private let XioVideoTabXio = UIButton()
    private let XioHistoryTabXio = UIButton()
    
    private let XioVoidPlaceholderXio = UIImageView.init(image: UIImage.init(named: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMe4WxnaRNvfD0DNXK/MNwrwZ1fUq6ynbgi008lzF")))
    
    private let XioWScaleXio = UIScreen.main.bounds.width / 375
    private let XioHScaleXio = UIScreen.main.bounds.height / 812
    
    private var XioCurrentSelectionXio: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        XioInitializeCanvasXio()
        XioForgeArchitectureXio()
       
        XioEditNameBtnXio.setImage(UIImage(named: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMclo7o8Klt1Pov3BZlDrbcjPAygfG70JyA==")), for: .normal)
        XioMasterAvatarXio.setImage(UIImage.init(named: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMZhqpki5ffKgnRrDtIIQAyNQMJTcu0pQYg==")), for: .normal)
        
        XioMasterAvatarXio.addTarget(self, action: #selector(XioAvatarTappedXio), for: .touchUpInside)
        XNioaAppIndicatorMannager.XNioashow(XNioainfo: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMfhMDE+4YN8a8GG/gZ3DBbvjjw=="))
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XNioaAppIndicatorMannager.XNioadismiss()
           
        }
        XioEditNameBtnXio.addTarget(self, action: #selector(XioEditNameTappedXio), for: .touchUpInside)
        XioDiamondBadgeXio.addTarget(self, action: #selector(XioDimonedCallXio), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        XioRequestProfilePulseXio()
    }
    
    private func XioInitializeCanvasXio() {
        view.backgroundColor = UIColor(white: 0.05, alpha: 1.0)
        XioRootScrollXio.contentInsetAdjustmentBehavior = .never
    }
    
    private func XioForgeArchitectureXio() {
        XioRootScrollXio.translatesAutoresizingMaskIntoConstraints = false
        XioContentRackXio.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(XioRootScrollXio)
        XioRootScrollXio.addSubview(XioContentRackXio)
        XioSettingsTriggerXio.addTarget(self, action: #selector(XioDimonedsiteXio), for: .touchUpInside)
        XioSettingsTriggerXio.setImage(UIImage(systemName: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMRokioB1zTA40iqaYFd1pKs/")), for: .normal)
        XioSettingsTriggerXio.tintColor = .white
        
        XioDiamondBadgeXio.layer.cornerRadius = 15 * XioHScaleXio
        let XioGradiantXio = CAGradientLayer()
        XioGradiantXio.frame = CGRect(x: 0, y: 0, width: 100 * XioWScaleXio, height: 30 * XioHScaleXio)
        XioGradiantXio.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        XioGradiantXio.startPoint = CGPoint(x: 0, y: 0.5)
        XioGradiantXio.endPoint = CGPoint(x: 1, y: 0.5)
        XioDiamondBadgeXio.layer.insertSublayer(XioGradiantXio, at: 0)
        XioDiamondBadgeXio.clipsToBounds = true
        
        XioDiamondIconXio.image = UIImage(systemName: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMZhobrD/WO+FErgnH00Ln2pTEMMYUHa0WLE="))
        XioDiamondIconXio.tintColor = .white
        XioDiamondValueXio.textColor = .white
        XioDiamondValueXio.font = .systemFont(ofSize: 16, weight: .bold)
        
        XioMasterAvatarXio.layer.cornerRadius = 50 * XioWScaleXio
        XioMasterAvatarXio.clipsToBounds = true
        XioMasterAvatarXio.layer.borderWidth = 2
        XioMasterAvatarXio.layer.borderColor = UIColor.darkGray.cgColor
        XioMasterAvatarXio.backgroundColor = .gray
        
        XioMasterNameXio.textColor = .white
        XioMasterNameXio.font = .systemFont(ofSize: 22, weight: .bold)
        XioMasterNameXio.textAlignment = .center
        
        XioSegmentDockXio.layer.cornerRadius = 8
        XioSegmentDockXio.layer.borderWidth = 1
        XioSegmentDockXio.layer.borderColor = UIColor.init(red: 182/255, green: 240/255, blue: 156/255, alpha: 1).cgColor
        
        XioConfigureTabXio(XioRoomTabXio, title: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMWJ/3gGmdCT7x9GIWA=="), tag: 0)
        XioConfigureTabXio(XioVideoTabXio, title: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMcCRyvtzVVAwP5pauK8="), tag: 1)
        XioConfigureTabXio(XioHistoryTabXio, title: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMXaLgXhE9+CdtAxr53/ngw=="), tag: 2)
        XioUpdateTabVisualsXio()
        
        XioVoidPlaceholderXio.contentMode = .scaleAspectFit
        XioVoidPlaceholderXio.image = UIImage(named: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMe4WxnaRNvfD0DNXK/MNwrwZ1fUq6ynbgi008lzF"))
        
        [XioSettingsTriggerXio, XioDiamondBadgeXio, XioMasterAvatarXio, XioMasterNameXio,XioEditNameBtnXio, XioSocialStackXio, XioSegmentDockXio, XioVoidPlaceholderXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioContentRackXio.addSubview($0)
        }
        
        XioDiamondBadgeXio.addSubview(XioDiamondIconXio)
        XioDiamondBadgeXio.addSubview(XioDiamondValueXio)
        XioFollowerBoxXio.textColor = .white
        XioFollowerBoxXio.font = UIFont(name: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMbEFR1xl4Wu8g4j249tqu9pTo2zRr8iN"), size: 16)
        XioFollowerBoxXio.textAlignment = .center
        XioFollowerBoxXio.text = XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMfQyOKKi+IyBsyYjo1MY")
        XioFollowingBoxXio.textColor = .white
        XioFollowingBoxXio.font = UIFont(name: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMbEFR1xl4Wu8g4j249tqu9pTo2zRr8iN"), size: 16)
        XioFollowingBoxXio.textAlignment = .center
        
        
        
        view.addSubview(XioFollowerBoxXio)
        view.addSubview(XioFollowingBoxXio)
        XioFollowerBoxXio.translatesAutoresizingMaskIntoConstraints = false
        XioFollowingBoxXio.translatesAutoresizingMaskIntoConstraints = false
        XioDiamondIconXio.translatesAutoresizingMaskIntoConstraints = false
        XioDiamondValueXio.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            XioRootScrollXio.topAnchor.constraint(equalTo: view.topAnchor),
            XioRootScrollXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioRootScrollXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioRootScrollXio.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            XioContentRackXio.topAnchor.constraint(equalTo: XioRootScrollXio.topAnchor),
            XioContentRackXio.leadingAnchor.constraint(equalTo: XioRootScrollXio.leadingAnchor),
            XioContentRackXio.trailingAnchor.constraint(equalTo: XioRootScrollXio.trailingAnchor),
            XioContentRackXio.bottomAnchor.constraint(equalTo: XioRootScrollXio.bottomAnchor),
            XioContentRackXio.widthAnchor.constraint(equalTo: XioRootScrollXio.widthAnchor),
            
            XioSettingsTriggerXio.topAnchor.constraint(equalTo: XioContentRackXio.topAnchor, constant: 60 * XioHScaleXio),
            XioSettingsTriggerXio.trailingAnchor.constraint(equalTo: XioContentRackXio.trailingAnchor, constant: -20 * XioWScaleXio),
            XioSettingsTriggerXio.widthAnchor.constraint(equalToConstant: 30 * XioWScaleXio),
            XioSettingsTriggerXio.heightAnchor.constraint(equalToConstant: 30 * XioWScaleXio),
            
            XioDiamondBadgeXio.centerYAnchor.constraint(equalTo: XioSettingsTriggerXio.centerYAnchor),
            XioDiamondBadgeXio.leadingAnchor.constraint(equalTo: XioContentRackXio.leadingAnchor, constant: 20 * XioWScaleXio),
            XioDiamondBadgeXio.widthAnchor.constraint(equalToConstant: 100 * XioWScaleXio),
            XioDiamondBadgeXio.heightAnchor.constraint(equalToConstant: 30 * XioHScaleXio),
            
            XioDiamondIconXio.leadingAnchor.constraint(equalTo: XioDiamondBadgeXio.leadingAnchor, constant: 10),
            XioDiamondIconXio.centerYAnchor.constraint(equalTo: XioDiamondBadgeXio.centerYAnchor),
            XioDiamondValueXio.leadingAnchor.constraint(equalTo: XioDiamondIconXio.trailingAnchor, constant: 5),
            XioDiamondValueXio.centerYAnchor.constraint(equalTo: XioDiamondBadgeXio.centerYAnchor),
            
            XioMasterAvatarXio.topAnchor.constraint(equalTo: XioContentRackXio.topAnchor, constant: 100 * XioHScaleXio),
            XioMasterAvatarXio.centerXAnchor.constraint(equalTo: XioContentRackXio.centerXAnchor),
            XioMasterAvatarXio.widthAnchor.constraint(equalToConstant: 100 * XioWScaleXio),
            XioMasterAvatarXio.heightAnchor.constraint(equalToConstant: 100 * XioWScaleXio),
            
            XioMasterNameXio.topAnchor.constraint(equalTo: XioMasterAvatarXio.bottomAnchor, constant: 15 * XioHScaleXio),
            XioMasterNameXio.centerXAnchor.constraint(equalTo: XioContentRackXio.centerXAnchor),
            XioEditNameBtnXio.centerYAnchor.constraint(equalTo: XioMasterNameXio.centerYAnchor),
            XioEditNameBtnXio.widthAnchor.constraint(equalToConstant: 28),
            XioEditNameBtnXio.heightAnchor.constraint(equalToConstant: 28),
            XioEditNameBtnXio.leadingAnchor.constraint(equalTo: XioMasterNameXio.trailingAnchor,constant: 5),
            
            XioFollowerBoxXio.widthAnchor.constraint(equalToConstant: 100),
            XioFollowerBoxXio.heightAnchor.constraint(equalToConstant: 25),
            XioFollowerBoxXio.trailingAnchor.constraint(equalTo: view.centerXAnchor,constant: -10),
            XioFollowerBoxXio.topAnchor.constraint(equalTo: XioMasterNameXio.bottomAnchor, constant: 16),
            
            XioFollowingBoxXio.widthAnchor.constraint(equalToConstant: 100),
            XioFollowingBoxXio.heightAnchor.constraint(equalToConstant: 25),
            XioFollowingBoxXio.leadingAnchor.constraint(equalTo: view.centerXAnchor,constant: 10),
            XioFollowingBoxXio.topAnchor.constraint(equalTo: XioMasterNameXio.bottomAnchor, constant: 16),
            
            XioSegmentDockXio.topAnchor.constraint(equalTo: XioFollowingBoxXio.bottomAnchor, constant: 40 * XioHScaleXio),
            XioSegmentDockXio.leadingAnchor.constraint(equalTo: XioContentRackXio.leadingAnchor, constant: 20 * XioWScaleXio),
            XioSegmentDockXio.trailingAnchor.constraint(equalTo: XioContentRackXio.trailingAnchor, constant: -20 * XioWScaleXio),
            XioSegmentDockXio.heightAnchor.constraint(equalToConstant: 45 * XioHScaleXio),
            
            XioVoidPlaceholderXio.topAnchor.constraint(equalTo: XioSegmentDockXio.bottomAnchor, constant: 50 * XioHScaleXio),
            XioVoidPlaceholderXio.centerXAnchor.constraint(equalTo: XioContentRackXio.centerXAnchor),
            XioVoidPlaceholderXio.widthAnchor.constraint(equalToConstant: 200 * XioWScaleXio),
            XioVoidPlaceholderXio.heightAnchor.constraint(equalToConstant: 200 * XioWScaleXio),
            XioVoidPlaceholderXio.bottomAnchor.constraint(equalTo: XioContentRackXio.bottomAnchor, constant: -50)
        ])
        
        XioBuildTabStackXio()
    }
    @objc private func XioEditNameTappedXio() {
            let alertController = UIAlertController(title: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMdlyQS75iydzgR0ID9r+sMyjzHjjpw=="), message: nil, preferredStyle: .alert)
            
            alertController.addTextField { textField in
                textField.placeholder = XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMb0mIsgLb53/Rwm3OVAYAnKOWX8rmrNqqxXoysw7411VY6R5")
                textField.text = self.XioMasterNameXio.text
                textField.clearButtonMode = .whileEditing
            }
            
            alertController.addAction(UIAlertAction(title: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMRFkSwaFjs6DwXoJZeHH"), style: .cancel))
            
            alertController.addAction(UIAlertAction(title: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMbxU7fYNjm0DpwK6mA=="), style: .default, handler: { _ in
                guard let newName = alertController.textFields?.first?.text, !newName.isEmpty else { return }
                XioGovernanceHubXio.XioPrincipalXio.XioUpdateActiveAliasXio(newName)
                self.XioMasterNameXio.text = XioGovernanceHubXio.XioPrincipalXio.XioActiveProfileXio?.XioAliasXio
              
                
                self.XioShowAlertXio(message: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMcdDxbf3hpL7MA07UKAl/+jmFqOH24/zu+kcQJ+e5Xt0f4tTtK29kgw="), isSuccess: true)
            }))
            
            present(alertController, animated: true)
       
    }
    private func XioShowAlertXio(message: String, isSuccess: Bool = false) {
           
        let alert = UIAlertController(title: isSuccess ? XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMVJU3Ke/xCjeE5Ro0xKgcw==") : XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMTHbI2/qGPEAxzDziuPP"), message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMUwAOztMjNPneuMDig=="), style: .default))
        present(alert, animated: true)
       
    }
    private func XioConfigureTabXio(_ button: UIButton, title: String, tag: Int) {
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.tag = tag
        button.addTarget(self, action: #selector(XioTabSwitchActionXio(_:)), for: .touchUpInside)
    }
    
    private func XioBuildTabStackXio() {
        let XioStackXio = UIStackView(arrangedSubviews: [XioRoomTabXio, XioVideoTabXio, XioHistoryTabXio])
        XioStackXio.axis = .horizontal
        XioStackXio.distribution = .fillEqually
        XioStackXio.translatesAutoresizingMaskIntoConstraints = false
        XioSegmentDockXio.addSubview(XioStackXio)
        
        NSLayoutConstraint.activate([
            XioStackXio.topAnchor.constraint(equalTo: XioSegmentDockXio.topAnchor),
            XioStackXio.leadingAnchor.constraint(equalTo: XioSegmentDockXio.leadingAnchor),
            XioStackXio.trailingAnchor.constraint(equalTo: XioSegmentDockXio.trailingAnchor),
            XioStackXio.bottomAnchor.constraint(equalTo: XioSegmentDockXio.bottomAnchor)
        ])
    }
    
    @objc private func XioTabSwitchActionXio(_ sender: UIButton) {
        XioCurrentSelectionXio = sender.tag
        XioUpdateTabVisualsXio()
    }
    
    private func XioUpdateTabVisualsXio() {
        let XioTabsXio = [XioRoomTabXio, XioVideoTabXio, XioHistoryTabXio]
        for (index, button) in XioTabsXio.enumerated() {
            if index == XioCurrentSelectionXio {
                button.backgroundColor = UIColor.init(red: 182/255, green: 240/255, blue: 156/255, alpha: 1)
                button.setTitleColor(.black, for: .normal)
            } else {
                button.backgroundColor = .clear
                button.setTitleColor(UIColor.init(red: 182/255, green: 240/255, blue: 156/255, alpha: 1), for: .normal)
            }
        }
    }
    
    private func XioRequestProfilePulseXio() {
        self.XioMasterNameXio.text = XioGovernanceHubXio.XioPrincipalXio.XioActiveProfileXio?.XioAliasXio
        self.XioDiamondValueXio.text = String(XioGovernanceHubXio.XioPrincipalXio.XioCurrentReserveXio)
        XioFollowingBoxXio.text = String(XioGovernanceHubXio.XioPrincipalXio.XioExileListXio.count) + XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMc4eigOuOS2Xhp/LoG8zU1jjgQ==")
        
       let avo = XioGovernanceHubXio.XioPrincipalXio.XioAUsedCachePhotoio
       
        self.XioMasterAvatarXio.setBackgroundImage((avo == nil) ? UIImage(named: XioGovernanceHubXio.XioPrincipalXio.XioActiveProfileXio?.XioAvatarXio ?? "") : avo, for: .normal)
    }
    
    @objc private func XioDimonedCallXio() {
        let XioCallXio = XioTreasureVaultXio()
        XioCallXio.hidesBottomBarWhenPushed = true// Replace with your XioVideoCallPortalXio
        self.navigationController?.pushViewController(XioCallXio, animated: true)
    }
    
    @objc private func XioDimonedsiteXio() {
        let XioCallXio = XioSystemTerminalXio()
        XioCallXio.hidesBottomBarWhenPushed = true// Replace with your XioVideoCallPortalXio
        self.navigationController?.pushViewController(XioCallXio, animated: true)
    }
    
    
    
    @objc private func XioAvatarTappedXio() {
           let actionSheet = UIAlertController(title: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMUCHH+VD9JdAL7FoyOjoajiRPBGw6w=="), message: nil, preferredStyle: .actionSheet)
           
           actionSheet.addAction(UIAlertAction(title: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMWWlDkZdWviZm5O5oI95wqPzi2J1"), style: .default, handler: { _ in
               self.XioOpenCameraXio()
           }))
           
           actionSheet.addAction(UIAlertAction(title: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMUk1QPd9rbcykhE90r8Qmnvq0Jcw5ZeXWCk="), style: .default, handler: { _ in
               self.XioOpenPhotoLibraryXio()
           }))
           
           actionSheet.addAction(UIAlertAction(title: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMRFkSwaFjs6DwXoJZeHH"), style: .cancel))
           
           present(actionSheet, animated: true)
       }
       
       private func XioOpenCameraXio() {
           guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
             
               return
           }
           
           let imagePicker = UIImagePickerController()
           imagePicker.sourceType = .camera
           imagePicker.delegate = self
           imagePicker.allowsEditing = true
           present(imagePicker, animated: true)
       }
       
       private func XioOpenPhotoLibraryXio() {
           var config = PHPickerConfiguration()
           config.selectionLimit = 1
           config.filter = .images
           
           let picker = PHPickerViewController(configuration: config)
           picker.delegate = self
           present(picker, animated: true)
       }
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            guard let provider = results.first?.itemProvider,
                  provider.canLoadObject(ofClass: UIImage.self) else { return }
            
            provider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                DispatchQueue.main.async {
                    if let selectedImage = image as? UIImage {
                        self?.XioUpdateAvatarXio(with: selectedImage)
                    } else if let error = error {
                        self?.XioShowAlertXio(message: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMeqwYEhxKMUnCVC3Ksd7Y6MfV5hDo1mzG4tqZyNTfQ==") + error.localizedDescription)
                    }
                }
            }
        }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true)
            
            if let editedImage = info[.editedImage] as? UIImage {
                XioUpdateAvatarXio(with: editedImage)
            } else if let originalImage = info[.originalImage] as? UIImage {
                XioUpdateAvatarXio(with: originalImage)
            }
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    
    private func XioUpdateAvatarXio(with image: UIImage) {
            // 更新UI
        XNioaAppIndicatorMannager.XNioashowInfo(XNioawithStatus: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMQcnYHR0EB7Ko2PLglWZjdXvB/Iq"))
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XNioaAppIndicatorMannager.XNioadismiss()
            XioGovernanceHubXio.XioPrincipalXio.XioUpdateActiveAvatarXio(image)
            self.XioMasterAvatarXio.setBackgroundImage(image, for: .normal)
            
            self.XioShowAlertXio(message: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMctIV3b/8mj/ceOpe0HUtjlLW6KVMFsKlX/Uu6gyJFEYhHUkdw=="), isSuccess: true)
        }
        
       
            
       
    }
    
}
