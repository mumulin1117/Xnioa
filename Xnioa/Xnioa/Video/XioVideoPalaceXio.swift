//
//  XioVideoPalaceXio.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/24.
//

import UIKit

// MARK: - Models
//struct XioVideoEntityXio {
//    let XioIdentiferXio = UUID()
//    let XioCreatorNameXio: String
//    let XioIntroTextXio: String
//    let XioCoverTokenXio: String
//}

// MARK: - Controller
class XioVideoPalaceXio: UIViewController {
    private var XioCurrentAvatoDataXio: [XioGalaEntryXio] = []
    
    
    private var XioCurrentVioDataXio: [XioGalaEntryXio] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        XioCurrentAvatoDataXio = Array(XioGovernanceHubXio.XioPrincipalXio.XioRoomPoolXio.suffix(3))
        
        XioCurrentVioDataXio = XioGovernanceHubXio.XioPrincipalXio.XioRoomPoolXio.filter {
            $0.XioMoivepath != "" && !$0.XioMoivepath.isEmpty
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.XioPrimaryShelfXio.reloadData()
        }
        
    }
    
    
    private let XioPrimaryShelfXio = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let XioNavTitleXio = UILabel()
    private let XioStreamToggleXio = UIButton()
//    private var XioHotListXio: [XioVideoEntityXio] = []
//    private var XioFeedListXio: [XioVideoEntityXio] = []
//    
    private let XioWFactorXio = UIScreen.main.bounds.width / 375
    private let XioHFactorXio = UIScreen.main.bounds.height / 812

    override func viewDidLoad() {
        super.viewDidLoad()
        XioInitialBaseSettingsXio()
        XioAssembleHierarchyXio()
//        XioTriggerRemotePulseXio()
    }
    
    private func XioInitialBaseSettingsXio() {
        view.backgroundColor = UIColor(white: 0.05, alpha: 1.0)
        navigationController?.isNavigationBarHidden = true
    }
    
    @objc func createXIOXioStreamToggleXio()  {
        let aicrrwte = XioMotionBroadcastPilotXio()
        aicrrwte.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(aicrrwte, animated: true)
    }
    private func XioAssembleHierarchyXio() {
        XioNavTitleXio.text = "Trending"
        XioNavTitleXio.font = .systemFont(ofSize: 28, weight: .bold)
        XioNavTitleXio.textColor = .white
        
        XioStreamToggleXio.setBackgroundImage(UIImage.init(named: "videoill.badge.plus"), for: .normal)
        
        XioStreamToggleXio.addTarget(self, action: #selector(createXIOXioStreamToggleXio), for: .touchUpInside)
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
    

}

// MARK: - UI Logic
extension XioVideoPalaceXio: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 2 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? XioCurrentAvatoDataXio.count : XioCurrentVioDataXio.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let XioCellXio = collectionView.dequeueReusableCell(withReuseIdentifier: "XioOrbitCellXio", for: indexPath) as! XioOrbitCellXio
            XioCellXio.XioSyncEntityXio(XioCurrentAvatoDataXio[indexPath.item])
            return XioCellXio
        } else {
            let XioCellXio = collectionView.dequeueReusableCell(withReuseIdentifier: "XioPostCellXio", for: indexPath) as! XioPostCellXio
            XioCellXio.XioSyncEntityXio(XioCurrentVioDataXio[indexPath.item])
            return XioCellXio
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let XioHeadXio = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "XioHeaderGadgetXio", for: indexPath) as! XioHeaderGadgetXio
        XioHeadXio.XioTitleLabelXio.text = "Recommend"
        return XioHeadXio
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let detailuser  = XioPeerPortalPalaceXio(usiersd: XioCurrentAvatoDataXio[indexPath.row])
            detailuser.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(detailuser, animated: true)
        } else {
            let detailuser  = XioMotionInsightPilotXio(usiersd: XioCurrentVioDataXio[indexPath.row])
            detailuser.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(detailuser, animated: true)
        }
    }
}

