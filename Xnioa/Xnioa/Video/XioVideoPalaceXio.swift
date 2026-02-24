//
//  XioVideoPalaceXio.swift
//  Xnioa
//
//  Created by mumu on 2026/2/24.
//

import UIKit

// MARK: - Models
struct XioVideoEntityXio {
    let XioIdentiferXio = UUID()
    let XioCreatorNameXio: String
    let XioIntroTextXio: String
    let XioCoverTokenXio: String
}

// MARK: - Controller
class XioVideoPalaceXio: UIViewController {
    
    private let XioPrimaryShelfXio = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let XioNavTitleXio = UILabel()
    private let XioStreamToggleXio = UIImageView()
    private var XioHotListXio: [XioVideoEntityXio] = []
    private var XioFeedListXio: [XioVideoEntityXio] = []
    
    private let XioWFactorXio = UIScreen.main.bounds.width / 375
    private let XioHFactorXio = UIScreen.main.bounds.height / 812

    override func viewDidLoad() {
        super.viewDidLoad()
        XioInitialBaseSettingsXio()
        XioAssembleHierarchyXio()
        XioTriggerRemotePulseXio()
    }
    
    private func XioInitialBaseSettingsXio() {
        view.backgroundColor = UIColor(white: 0.05, alpha: 1.0)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func XioAssembleHierarchyXio() {
        XioNavTitleXio.text = "Trending"
        XioNavTitleXio.font = .systemFont(ofSize: 28, weight: .bold)
        XioNavTitleXio.textColor = .white
        
        XioStreamToggleXio.image = UIImage(systemName: "video.fill.badge.plus")
        XioStreamToggleXio.tintColor = .systemPurple
        
        let XioLayoutXio = UICollectionViewCompositionalLayout { (sectionIndex, _) -> NSCollectionLayoutSection? in
            return sectionIndex == 0 ? self.XioBuildHorizonZoneXio() : self.XioBuildVerticalZoneXio()
        }
        
        XioPrimaryShelfXio.setCollectionViewLayout(XioLayoutXio, animated: false)
        XioPrimaryShelfXio.backgroundColor = .clear
        XioPrimaryShelfXio.delegate = self
        XioPrimaryShelfXio.dataSource = self
        XioPrimaryShelfXio.register(XioOrbitCellXio.self, forCellWithReuseIdentifier: "XioOrbitCellXio")
        XioPrimaryShelfXio.register(XioPostCellXio.self, forCellWithReuseIdentifier: "XioPostCellXio")
        XioPrimaryShelfXio.register(XioHeaderGadgetXio.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "XioHeaderGadgetXio")
        
        [XioNavTitleXio, XioStreamToggleXio, XioPrimaryShelfXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            XioNavTitleXio.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10 * XioHFactorXio),
            XioNavTitleXio.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * XioWFactorXio),
            
            XioStreamToggleXio.centerYAnchor.constraint(equalTo: XioNavTitleXio.centerYAnchor),
            XioStreamToggleXio.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * XioWFactorXio),
            XioStreamToggleXio.widthAnchor.constraint(equalToConstant: 30),
            XioStreamToggleXio.heightAnchor.constraint(equalToConstant: 25),
            
            XioPrimaryShelfXio.topAnchor.constraint(equalTo: XioNavTitleXio.bottomAnchor, constant: 10),
            XioPrimaryShelfXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioPrimaryShelfXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioPrimaryShelfXio.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func XioBuildHorizonZoneXio() -> NSCollectionLayoutSection {
        let XioItemXio = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        let XioGroupXio = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(120 * XioWFactorXio), heightDimension: .absolute(45 * XioHFactorXio)), subitems: [XioItemXio])
        let XioSectionXio = NSCollectionLayoutSection(group: XioGroupXio)
        XioSectionXio.orthogonalScrollingBehavior = .continuous
        XioSectionXio.interGroupSpacing = 12
        XioSectionXio.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 20)
        
        let XioHeaderSizeXio = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(30))
        let XioHeaderXio = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: XioHeaderSizeXio, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        XioSectionXio.boundarySupplementaryItems = [XioHeaderXio]
        return XioSectionXio
    }
    
    private func XioBuildVerticalZoneXio() -> NSCollectionLayoutSection {
        let XioItemXio = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(450)))
        let XioGroupXio = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(450)), subitems: [XioItemXio])
        let XioSectionXio = NSCollectionLayoutSection(group: XioGroupXio)
        XioSectionXio.interGroupSpacing = 20
        XioSectionXio.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 100, trailing: 20)
        return XioSectionXio
    }
    
    private func XioTriggerRemotePulseXio() {
        XioHotListXio = [
            XioVideoEntityXio(XioCreatorNameXio: "EmpirePower", XioIntroTextXio: "", XioCoverTokenXio: ""),
            XioVideoEntityXio(XioCreatorNameXio: "RetroVibe", XioIntroTextXio: "", XioCoverTokenXio: ""),
            XioVideoEntityXio(XioCreatorNameXio: "ClassicArt", XioIntroTextXio: "", XioCoverTokenXio: "")
        ]
        
        XioFeedListXio = [
            XioVideoEntityXio(XioCreatorNameXio: "HoltHamlet", XioIntroTextXio: "Soft lights, old songs, and unhurried conversations.", XioCoverTokenXio: ""),
            XioVideoEntityXio(XioCreatorNameXio: "SilkRoad", XioIntroTextXio: "Echoes of the past in a modern lens.", XioCoverTokenXio: "")
        ]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.XioPrimaryShelfXio.reloadData()
        }
    }
}

// MARK: - UI Logic
extension XioVideoPalaceXio: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 2 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? XioHotListXio.count : XioFeedListXio.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let XioCellXio = collectionView.dequeueReusableCell(withReuseIdentifier: "XioOrbitCellXio", for: indexPath) as! XioOrbitCellXio
            XioCellXio.XioSyncEntityXio(XioHotListXio[indexPath.item])
            return XioCellXio
        } else {
            let XioCellXio = collectionView.dequeueReusableCell(withReuseIdentifier: "XioPostCellXio", for: indexPath) as! XioPostCellXio
            XioCellXio.XioSyncEntityXio(XioFeedListXio[indexPath.item])
            return XioCellXio
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let XioHeadXio = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "XioHeaderGadgetXio", for: indexPath) as! XioHeaderGadgetXio
        XioHeadXio.XioTitleLabelXio.text = "Recommend"
        return XioHeadXio
    }
}

