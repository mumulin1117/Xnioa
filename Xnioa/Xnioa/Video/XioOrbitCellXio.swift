//
//  XioOrbitCellXio.swift
//  Xnioa
//
//  Created by mumu on 2026/2/24.
//

import UIKit
// MARK: - Custom Cells
class XioOrbitCellXio: UICollectionViewCell {
    private let XioBasePlateXio = UIView()
    private let XioIconViewXio = UIImageView()
    private let XioNameLabelXio = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        XioBasePlateXio.backgroundColor = UIColor(white: 0.15, alpha: 1.0)
        XioBasePlateXio.layer.cornerRadius = 22.5
        XioBasePlateXio.layer.borderWidth = 1
        XioBasePlateXio.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        
        XioIconViewXio.layer.cornerRadius = 15
        XioIconViewXio.clipsToBounds = true
        XioIconViewXio.backgroundColor = .gray
        
        XioNameLabelXio.font = .systemFont(ofSize: 13, weight: .medium)
        XioNameLabelXio.textColor = .white
        
        [XioBasePlateXio, XioIconViewXio, XioNameLabelXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            XioBasePlateXio.topAnchor.constraint(equalTo: contentView.topAnchor),
            XioBasePlateXio.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            XioBasePlateXio.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            XioBasePlateXio.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            XioIconViewXio.leadingAnchor.constraint(equalTo: XioBasePlateXio.leadingAnchor, constant: 5),
            XioIconViewXio.centerYAnchor.constraint(equalTo: XioBasePlateXio.centerYAnchor),
            XioIconViewXio.widthAnchor.constraint(equalToConstant: 30),
            XioIconViewXio.heightAnchor.constraint(equalToConstant: 30),
            
            XioNameLabelXio.leadingAnchor.constraint(equalTo: XioIconViewXio.trailingAnchor, constant: 8),
            XioNameLabelXio.trailingAnchor.constraint(equalTo: XioBasePlateXio.trailingAnchor, constant: -10),
            XioNameLabelXio.centerYAnchor.constraint(equalTo: XioBasePlateXio.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    func XioSyncEntityXio(_ data: XioVideoEntityXio) {
        XioNameLabelXio.text = data.XioCreatorNameXio
    }
}

