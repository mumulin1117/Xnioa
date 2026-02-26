//
//  XioPostCellXio.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/24.
//

import UIKit

class XioPostCellXio: UICollectionViewCell {
    private let XioMainFrameXio = UIView()
    private let XioAvatarXio = UIImageView()
    private let XioHandleXio = UILabel()
    private let AcccTopersonCou = UIButton()//personto
    
    let AccctoinCou = UIButton()//more
    
    
    
    private let XioHeroImageXio = UIImageView()
    private let XioCaptionXio = UILabel()
    private let XioLikeBtnXio = UIImageView(image: UIImage(systemName: "heart"))
    private let XioChatBtnXio = UIImageView(image: UIImage(systemName: "message"))
    private let XioGreetBtnXio = UIButton()
    private let XioPlayBtnXio = UIImageView(image: UIImage(systemName: "play.circle.fill"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        XioSetupVisualsXio()
    }
    
    private func XioSetupVisualsXio() {
        XioMainFrameXio.backgroundColor = UIColor(white: 0.12, alpha: 1.0)
        XioMainFrameXio.layer.cornerRadius = 12
         
        AcccTopersonCou.setImage(UIImage.init(named: "AcccTopersonCou"), for: .normal)
        
        
        
        XioAvatarXio.layer.cornerRadius = 15
        XioAvatarXio.clipsToBounds = true
        XioAvatarXio.backgroundColor = .lightGray
        
        XioHandleXio.font = .systemFont(ofSize: 15, weight: .semibold)
        XioHandleXio.textColor = .white
        AccctoinCou.setImage(UIImage.init(named: "AccctoinCou"), for: .normal)
      
        XioHeroImageXio.contentMode = .scaleAspectFill
        XioHeroImageXio.clipsToBounds = true
        XioHeroImageXio.layer.cornerRadius = 8
        XioHeroImageXio.backgroundColor = .darkGray
        
        XioCaptionXio.font = .systemFont(ofSize: 14)
        XioCaptionXio.textColor = .lightGray
        XioCaptionXio.numberOfLines = 2
        
        XioGreetBtnXio.setTitle("Greet", for: .normal)
        XioGreetBtnXio.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        XioGreetBtnXio.backgroundColor = .systemPurple
        XioGreetBtnXio.layer.cornerRadius = 15
        
        XioPlayBtnXio.tintColor = .white
        XioLikeBtnXio.tintColor = .white
        XioChatBtnXio.tintColor = .white
        
        [XioMainFrameXio, XioAvatarXio, XioHandleXio,AcccTopersonCou,AccctoinCou, XioHeroImageXio, XioCaptionXio, XioLikeBtnXio, XioChatBtnXio, XioGreetBtnXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        XioHeroImageXio.addSubview(XioPlayBtnXio)
        XioPlayBtnXio.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            XioMainFrameXio.topAnchor.constraint(equalTo: contentView.topAnchor),
            XioMainFrameXio.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            XioMainFrameXio.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            XioMainFrameXio.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            XioAvatarXio.topAnchor.constraint(equalTo: XioMainFrameXio.topAnchor, constant: 15),
            XioAvatarXio.leadingAnchor.constraint(equalTo: XioMainFrameXio.leadingAnchor, constant: 15),
            XioAvatarXio.widthAnchor.constraint(equalToConstant: 30),
            XioAvatarXio.heightAnchor.constraint(equalToConstant: 30),
            
            XioHandleXio.centerYAnchor.constraint(equalTo: XioAvatarXio.centerYAnchor),
            XioHandleXio.leadingAnchor.constraint(equalTo: XioAvatarXio.trailingAnchor, constant: 10),
            AcccTopersonCou.widthAnchor.constraint(equalToConstant: 25),
            AcccTopersonCou.heightAnchor.constraint(equalToConstant: 25),
            AcccTopersonCou.centerYAnchor.constraint(equalTo: XioAvatarXio.centerYAnchor),
            AcccTopersonCou.leadingAnchor.constraint(equalTo: XioHandleXio.trailingAnchor,constant: 10),
            
            AccctoinCou.widthAnchor.constraint(equalToConstant: 25),
            AccctoinCou.heightAnchor.constraint(equalToConstant: 25),
            AccctoinCou.centerYAnchor.constraint(equalTo: XioAvatarXio.centerYAnchor),
            AccctoinCou.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            
            
            
            XioHeroImageXio.topAnchor.constraint(equalTo: XioAvatarXio.bottomAnchor, constant: 15),
            XioHeroImageXio.leadingAnchor.constraint(equalTo: XioMainFrameXio.leadingAnchor, constant: 15),
            XioHeroImageXio.trailingAnchor.constraint(equalTo: XioMainFrameXio.trailingAnchor, constant: -15),
            XioHeroImageXio.heightAnchor.constraint(equalToConstant: 320),
            
            XioPlayBtnXio.bottomAnchor.constraint(equalTo: XioHeroImageXio.bottomAnchor, constant: -15),
            XioPlayBtnXio.trailingAnchor.constraint(equalTo: XioHeroImageXio.trailingAnchor, constant: -15),
            XioPlayBtnXio.widthAnchor.constraint(equalToConstant: 40),
            XioPlayBtnXio.heightAnchor.constraint(equalToConstant: 40),
            
            XioCaptionXio.topAnchor.constraint(equalTo: XioHeroImageXio.bottomAnchor, constant: 12),
            XioCaptionXio.leadingAnchor.constraint(equalTo: XioMainFrameXio.leadingAnchor, constant: 15),
            XioCaptionXio.trailingAnchor.constraint(equalTo: XioMainFrameXio.trailingAnchor, constant: -15),
            
            XioLikeBtnXio.topAnchor.constraint(equalTo: XioCaptionXio.bottomAnchor, constant: 15),
            XioLikeBtnXio.leadingAnchor.constraint(equalTo: XioMainFrameXio.leadingAnchor, constant: 15),
            XioLikeBtnXio.widthAnchor.constraint(equalToConstant: 25),
            XioLikeBtnXio.heightAnchor.constraint(equalToConstant: 25),
            
            XioChatBtnXio.centerYAnchor.constraint(equalTo: XioLikeBtnXio.centerYAnchor),
            XioChatBtnXio.leadingAnchor.constraint(equalTo: XioLikeBtnXio.trailingAnchor, constant: 20),
            XioChatBtnXio.widthAnchor.constraint(equalToConstant: 25),
            XioChatBtnXio.heightAnchor.constraint(equalToConstant: 25),
            
            XioGreetBtnXio.centerYAnchor.constraint(equalTo: XioLikeBtnXio.centerYAnchor),
            XioGreetBtnXio.trailingAnchor.constraint(equalTo: XioMainFrameXio.trailingAnchor, constant: -15),
            XioGreetBtnXio.widthAnchor.constraint(equalToConstant: 85),
            XioGreetBtnXio.heightAnchor.constraint(equalToConstant: 40),
            XioGreetBtnXio.bottomAnchor.constraint(equalTo: XioMainFrameXio.bottomAnchor, constant: -15)
        ])
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    func XioSyncEntityXio(_ data: XioVideoEntityXio) {
        XioHandleXio.text = data.XioCreatorNameXio
        XioCaptionXio.text = data.XioIntroTextXio
    }
}

class XioHeaderGadgetXio: UICollectionReusableView {
    let XioTitleLabelXio = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        XioTitleLabelXio.font = .systemFont(ofSize: 18, weight: .bold)
        XioTitleLabelXio.textColor = .gray
        addSubview(XioTitleLabelXio)
        XioTitleLabelXio.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            XioTitleLabelXio.leadingAnchor.constraint(equalTo: leadingAnchor),
            XioTitleLabelXio.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    required init?(coder: NSCoder) { fatalError() }
}
