//
//  XioPartyCellXio.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/24.
//

import UIKit
class XioPartyCellXio: UICollectionViewCell {
    
    private let XioCardBaseXio = UIImageView(image: UIImage(named: "XioCardBaseXio"))
     let XioMainVisualXio = UIImageView()
    
    private let XioStatusBadgeXio = UIView()
    private let XioGreenDotXio = UIView()
    private let XioOnlineLabelXio = UILabel()
    
    private let XioInfoBarXio = UIView()
    private let XioUserThumbXio = UIImageView()
    private let XioUserNameXio = UILabel()
    private let XioSparkleIconXio = UIImageView(image: UIImage(systemName: "sparkles"))
    private let XioThemeTitleXio = UILabel()
    
    private let XioHotPanelXio = UIView()
    private let XioFireIconXio = UIImageView(image: UIImage(systemName: "flame.fill"))
    private let XioHotCountXio = UILabel()
    private let XioAudienceStackXio = UIStackView()
    
    private let XioWScaleXio = UIScreen.main.bounds.width / 375
    private let XioHScaleXio = UIScreen.main.bounds.height / 812

    override init(frame: CGRect) {
        super.init(frame: frame)
        XioBuildCellStructureXio()
        XioApplyThemeStyleXio()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func XioBuildCellStructureXio() {
        [XioCardBaseXio, XioMainVisualXio, XioStatusBadgeXio, XioInfoBarXio, XioHotPanelXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        XioStatusBadgeXio.addSubview(XioGreenDotXio)
        XioStatusBadgeXio.addSubview(XioOnlineLabelXio)
        XioGreenDotXio.translatesAutoresizingMaskIntoConstraints = false
        XioOnlineLabelXio.translatesAutoresizingMaskIntoConstraints = false
        
        [XioUserThumbXio, XioUserNameXio, XioSparkleIconXio, XioThemeTitleXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioInfoBarXio.addSubview($0)
        }
        
        [XioFireIconXio, XioHotCountXio, XioAudienceStackXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioHotPanelXio.addSubview($0)
        }
        XioMainVisualXio.contentMode = .scaleAspectFill
        NSLayoutConstraint.activate([
            XioCardBaseXio.topAnchor.constraint(equalTo: contentView.topAnchor),
            XioCardBaseXio.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            XioCardBaseXio.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            XioCardBaseXio.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            XioMainVisualXio.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10 * XioHScaleXio),
            XioMainVisualXio.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10 * XioWScaleXio),
            XioMainVisualXio.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10 * XioHScaleXio),
            XioMainVisualXio.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -80 * XioWScaleXio),
            
             
            
            XioGreenDotXio.leadingAnchor.constraint(equalTo: XioStatusBadgeXio.leadingAnchor, constant: 8),
            XioGreenDotXio.centerYAnchor.constraint(equalTo: XioStatusBadgeXio.centerYAnchor),
            XioGreenDotXio.widthAnchor.constraint(equalToConstant: 6),
            XioGreenDotXio.heightAnchor.constraint(equalToConstant: 6),
            
            XioOnlineLabelXio.leadingAnchor.constraint(equalTo: XioGreenDotXio.trailingAnchor, constant: 4),
            XioOnlineLabelXio.trailingAnchor.constraint(equalTo: XioStatusBadgeXio.trailingAnchor, constant: -8),
            XioOnlineLabelXio.centerYAnchor.constraint(equalTo: XioStatusBadgeXio.centerYAnchor),
            
            XioInfoBarXio.leadingAnchor.constraint(equalTo: XioMainVisualXio.leadingAnchor, constant: 8),
            XioInfoBarXio.bottomAnchor.constraint(equalTo: XioMainVisualXio.bottomAnchor, constant: -8),
            XioInfoBarXio.trailingAnchor.constraint(equalTo: XioMainVisualXio.trailingAnchor, constant: -8),
            XioInfoBarXio.heightAnchor.constraint(equalToConstant: 30),
            
            XioStatusBadgeXio.bottomAnchor.constraint(equalTo: XioInfoBarXio.topAnchor, constant: -10),
            XioStatusBadgeXio.leadingAnchor.constraint(equalTo: XioMainVisualXio.leadingAnchor, constant: 10),
            XioStatusBadgeXio.heightAnchor.constraint(equalToConstant: 22),
          
            
            XioUserThumbXio.leadingAnchor.constraint(equalTo: XioInfoBarXio.leadingAnchor,constant: 15),
            XioUserThumbXio.centerYAnchor.constraint(equalTo: XioInfoBarXio.centerYAnchor),
            XioUserThumbXio.widthAnchor.constraint(equalToConstant: 30),
            XioUserThumbXio.heightAnchor.constraint(equalToConstant: 30),
            
            XioUserNameXio.leadingAnchor.constraint(equalTo: XioUserThumbXio.trailingAnchor, constant: 5),
            XioUserNameXio.centerYAnchor.constraint(equalTo: XioInfoBarXio.centerYAnchor),
            
            XioSparkleIconXio.leadingAnchor.constraint(equalTo: XioUserNameXio.trailingAnchor, constant: 4),
            XioSparkleIconXio.centerYAnchor.constraint(equalTo: XioInfoBarXio.centerYAnchor),
            XioSparkleIconXio.widthAnchor.constraint(equalToConstant: 12),
            XioSparkleIconXio.heightAnchor.constraint(equalToConstant: 12),
            
            XioThemeTitleXio.leadingAnchor.constraint(equalTo: XioSparkleIconXio.trailingAnchor, constant: 4),
            XioThemeTitleXio.centerYAnchor.constraint(equalTo: XioInfoBarXio.centerYAnchor),
            XioThemeTitleXio.trailingAnchor.constraint(lessThanOrEqualTo: XioInfoBarXio.trailingAnchor),
            
            XioHotPanelXio.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            XioHotPanelXio.bottomAnchor.constraint(equalTo: XioMainVisualXio.bottomAnchor),
            XioHotPanelXio.widthAnchor.constraint(equalToConstant: 60),
            XioHotPanelXio.heightAnchor.constraint(equalToConstant: 70),
            
            XioFireIconXio.topAnchor.constraint(equalTo: XioHotPanelXio.topAnchor, constant: 5),
            XioFireIconXio.centerXAnchor.constraint(equalTo: XioHotPanelXio.centerXAnchor),
            XioFireIconXio.widthAnchor.constraint(equalToConstant: 16),
            XioFireIconXio.heightAnchor.constraint(equalToConstant: 16),
            
            XioHotCountXio.topAnchor.constraint(equalTo: XioFireIconXio.bottomAnchor, constant: 4),
            XioHotCountXio.centerXAnchor.constraint(equalTo: XioHotPanelXio.centerXAnchor),
            
            XioAudienceStackXio.bottomAnchor.constraint(equalTo: XioHotPanelXio.bottomAnchor, constant: -5),
            XioAudienceStackXio.centerXAnchor.constraint(equalTo: XioHotPanelXio.centerXAnchor),
            XioAudienceStackXio.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
    
    private func XioApplyThemeStyleXio() {
        XioMainVisualXio.layer.cornerRadius = 10
        XioMainVisualXio.clipsToBounds = true
        XioMainVisualXio.backgroundColor = .darkGray
        
        XioStatusBadgeXio.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        XioStatusBadgeXio.layer.cornerRadius = 11
        
        XioGreenDotXio.backgroundColor = .green
        XioGreenDotXio.layer.cornerRadius = 3
        
        XioOnlineLabelXio.font = .systemFont(ofSize: 11, weight: .medium)
        XioOnlineLabelXio.textColor = .white
        
        XioInfoBarXio.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        XioInfoBarXio.layer.cornerRadius = 15
        
        XioUserThumbXio.layer.cornerRadius = 15
        XioUserThumbXio.clipsToBounds = true
        XioUserThumbXio.backgroundColor = .lightGray
        
        XioUserNameXio.font = .systemFont(ofSize: 12, weight: .bold)
        XioUserNameXio.textColor = .white
        
        XioThemeTitleXio.font = .systemFont(ofSize: 12)
        XioThemeTitleXio.textColor = .white
        
        XioHotPanelXio.backgroundColor = UIColor(red: 0.9, green: 0.8, blue: 0.7, alpha: 1.0)
        XioHotPanelXio.layer.cornerRadius = 5
        
        XioFireIconXio.tintColor = .orange
        XioHotCountXio.font = .boldSystemFont(ofSize: 12)
        XioHotCountXio.textColor = .brown
        
        XioAudienceStackXio.axis = .horizontal
        XioAudienceStackXio.spacing = -5
    }

    func XioConfigureWithDataXio(jai:XioGalaEntryXio) {
        XioUserNameXio.text = jai.XioAliasXio
        XioThemeTitleXio.text = jai.XioRoomTItle
        XioOnlineLabelXio.text = "\(3) Online"
        XioHotCountXio.text = jai.XioHeatValueXio
        XioUserThumbXio.image = UIImage(named: jai.XioAvatarXio)
        XioAudienceStackXio.arrangedSubviews.forEach { $0.removeFromSuperview() }
        for _ in 0..<3 {
            let XioMiniAvatarXio = UIImageView()
            XioMiniAvatarXio.contentMode = .scaleAspectFill
            XioMiniAvatarXio.layer.masksToBounds = true
            XioMiniAvatarXio.layer.cornerRadius = 7.5
            XioMiniAvatarXio.layer.borderWidth = 1
            XioMiniAvatarXio.layer.borderColor = UIColor.white.cgColor
            XioMiniAvatarXio.translatesAutoresizingMaskIntoConstraints = false
            XioMiniAvatarXio.widthAnchor.constraint(equalToConstant: 15).isActive = true
            XioMiniAvatarXio.image = UIImage.init(named: "avarieou\(Int.random(in: 0...8))")
            XioAudienceStackXio.addArrangedSubview(XioMiniAvatarXio)
        }
    }
}
