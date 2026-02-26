//
//  XioVoidStateNavigatorXio.swift
//  Xnioa
//
//  Created by  on 2026/2/26.
//

import UIKit

class XioVoidStateNavigatorXio: UIView {
    
    private let XioVoidIconXio = UIImageView()
    private let XioVoidMessageXio = UILabel()
    private let XioSuggestionLabXio = UILabel()
    
    private let XioUnitWXio = UIScreen.main.bounds.width / 375

    override init(frame: CGRect) {
        super.init(frame: frame)
        XioForgeVoidLayoutXio()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func XioForgeVoidLayoutXio() {
        self.backgroundColor = .black
        
        // 使用系统图标或项目内置的 Xio 图标
        XioVoidIconXio.image = UIImage(systemName: "magnifyingglass.circle")
        XioVoidIconXio.tintColor = UIColor(white: 0.3, alpha: 1.0)
        XioVoidIconXio.contentMode = .scaleAspectFit
        
        XioVoidMessageXio.text = "No results found"
        XioVoidMessageXio.textColor = .white
        XioVoidMessageXio.font = .systemFont(ofSize: 18 * XioUnitWXio, weight: .bold)
        
        XioSuggestionLabXio.text = "Try searching for other party keywords"
        XioSuggestionLabXio.textColor = .darkGray
        XioSuggestionLabXio.font = .systemFont(ofSize: 14 * XioUnitWXio)
        XioSuggestionLabXio.numberOfLines = 0
        XioSuggestionLabXio.textAlignment = .center
        
        [XioVoidIconXio, XioVoidMessageXio, XioSuggestionLabXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            XioVoidIconXio.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            XioVoidIconXio.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -60),
            XioVoidIconXio.widthAnchor.constraint(equalToConstant: 80 * XioUnitWXio),
            XioVoidIconXio.heightAnchor.constraint(equalToConstant: 80 * XioUnitWXio),
            
            XioVoidMessageXio.topAnchor.constraint(equalTo: XioVoidIconXio.bottomAnchor, constant: 20),
            XioVoidMessageXio.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            XioSuggestionLabXio.topAnchor.constraint(equalTo: XioVoidMessageXio.bottomAnchor, constant: 10),
            XioSuggestionLabXio.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            XioSuggestionLabXio.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8)
        ])
    }
}
