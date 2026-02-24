//
//  XIOEntryViewController.swift
//  Xnioa
//
//  Created by mumu on 2026/2/24.
//

import UIKit
import SafariServices

class XIOEntryViewController: UIViewController {

    private let XIOMainBackgroundXIO = UIImageView()
    private let XIOGoldenOverlayXIO = UIView()
    private let XIOHeadlineLabelXIO = UILabel()
    private let XIOEulaButtonXIO = UIButton(type: .system)
    private let XIOGoNowContainerXIO = UIView()
    private let XIOGoNowLabelXIO = UILabel()
    private let XIOArrowButtonXIO = UIButton(type: .custom)
    private let XIOTermsCheckboxXIO = UIButton(type: .custom)
    private let XIOTermsTextViewXIO = UITextView()
    private let XIODashedLineXIO = UIView()

    private let XIOScreenHeightXIO = UIScreen.main.bounds.height
    private let XIOScreenWidthXIO = UIScreen.main.bounds.width
    private var XIOIsAgreedXIO = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        XIOStyleBindingXIO()
        XIOLayoutSetupXIO()
        
        XIOInteractionLogicXIO()
    }

    private func XIOLayoutSetupXIO() {
        view.backgroundColor = .black
        
        [XIOMainBackgroundXIO, XIOGoldenOverlayXIO, XIOHeadlineLabelXIO,
         XIOEulaButtonXIO, XIOGoNowContainerXIO, XIOTermsCheckboxXIO,
         XIOTermsTextViewXIO, XIODashedLineXIO].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        XIOGoNowContainerXIO.addSubview(XIOGoNowLabelXIO)
        XIOGoNowContainerXIO.addSubview(XIOArrowButtonXIO)
        XIOGoNowLabelXIO.translatesAutoresizingMaskIntoConstraints = false
        XIOArrowButtonXIO.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            XIOMainBackgroundXIO.topAnchor.constraint(equalTo: view.topAnchor),
            XIOMainBackgroundXIO.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XIOMainBackgroundXIO.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XIOMainBackgroundXIO.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            XIOEulaButtonXIO.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            XIOEulaButtonXIO.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            XIOEulaButtonXIO.widthAnchor.constraint(equalToConstant: 80),
            XIOEulaButtonXIO.heightAnchor.constraint(equalToConstant: 36),

            XIOHeadlineLabelXIO.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -XIOScreenHeightXIO * 0.05),
            XIOHeadlineLabelXIO.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            XIOHeadlineLabelXIO.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),

            XIODashedLineXIO.topAnchor.constraint(equalTo: XIOHeadlineLabelXIO.bottomAnchor, constant: 40),
            XIODashedLineXIO.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -20),
            XIODashedLineXIO.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            XIODashedLineXIO.heightAnchor.constraint(equalToConstant: 20),

            XIOGoNowContainerXIO.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -XIOScreenHeightXIO * 0.12),
            XIOGoNowContainerXIO.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            XIOGoNowContainerXIO.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            XIOGoNowContainerXIO.heightAnchor.constraint(equalToConstant: 80),

            XIOGoNowLabelXIO.leadingAnchor.constraint(equalTo: XIOGoNowContainerXIO.leadingAnchor),
            XIOGoNowLabelXIO.centerYAnchor.constraint(equalTo: XIOGoNowContainerXIO.centerYAnchor),

            XIOArrowButtonXIO.trailingAnchor.constraint(equalTo: XIOGoNowContainerXIO.trailingAnchor),
            XIOArrowButtonXIO.centerYAnchor.constraint(equalTo: XIOGoNowContainerXIO.centerYAnchor),
            XIOArrowButtonXIO.widthAnchor.constraint(equalToConstant: 70),
            XIOArrowButtonXIO.heightAnchor.constraint(equalToConstant: 70),

            XIOTermsCheckboxXIO.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            XIOTermsCheckboxXIO.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            XIOTermsCheckboxXIO.widthAnchor.constraint(equalToConstant: 20),
            XIOTermsCheckboxXIO.heightAnchor.constraint(equalToConstant: 20),

            XIOTermsTextViewXIO.centerYAnchor.constraint(equalTo: XIOTermsCheckboxXIO.centerYAnchor),
            XIOTermsTextViewXIO.leadingAnchor.constraint(equalTo: XIOTermsCheckboxXIO.trailingAnchor, constant: 8),
            XIOTermsTextViewXIO.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            XIOTermsTextViewXIO.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    private func XIOStyleBindingXIO() {
        XIOMainBackgroundXIO.image = UIImage(named: "SigngLogi")
        XIOMainBackgroundXIO.contentMode = .scaleAspectFill
        
        XIOEulaButtonXIO.backgroundColor = UIColor(white: 0.1, alpha: 0.8)
        XIOEulaButtonXIO.setTitle("EULA", for: .normal)
        XIOEulaButtonXIO.setTitleColor(.green, for: .normal)
        XIOEulaButtonXIO.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        XIOEulaButtonXIO.layer.cornerRadius = 4

        XIOHeadlineLabelXIO.text = "SIGN\nIN NOW"
        XIOHeadlineLabelXIO.numberOfLines = 0
        XIOHeadlineLabelXIO.textColor = .white
        XIOHeadlineLabelXIO.font = UIFont(name: "AvenirNext-Heavy", size: 64)
        XIOHeadlineLabelXIO.textAlignment = .center

        XIOGoNowLabelXIO.text = "Go now"
        XIOGoNowLabelXIO.textColor = .white
        XIOGoNowLabelXIO.font = UIFont.systemFont(ofSize: 32, weight: .bold)

        XIOArrowButtonXIO.backgroundColor = .white
        XIOArrowButtonXIO.layer.cornerRadius = 35
        XIOArrowButtonXIO.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        XIOArrowButtonXIO.tintColor = .black

        XIOTermsCheckboxXIO.layer.borderWidth = 1
                XIOTermsCheckboxXIO.layer.borderColor = UIColor.white.cgColor
                XIOTermsCheckboxXIO.layer.cornerRadius = 4
                
                // 修正点 1: 使用更明确的富文本设置
                let XIORawTextXIO = "By signing up, you agree to the User Agrement & Privacy Policy"
                let XIOLinkTextXIO = NSMutableAttributedString(string: XIORawTextXIO)
                
                // 修正点 2: 必须先设置全局字体和颜色，否则可能因为默认黑色而在深色背景下不可见
                let XIOFullRangeXIO = NSRange(location: 0, length: XIOLinkTextXIO.length)
                XIOLinkTextXIO.addAttribute(.font, value: UIFont.systemFont(ofSize: 12), range: XIOFullRangeXIO)
                XIOLinkTextXIO.addAttribute(.foregroundColor, value: UIColor.lightGray, range: XIOFullRangeXIO)
                
                // 设置链接
                let XIOUserRangeXIO = (XIORawTextXIO as NSString).range(of: "User Agrement")
                let XIOPrivacyRangeXIO = (XIORawTextXIO as NSString).range(of: "Privacy Policy")
                
                XIOLinkTextXIO.addAttribute(.link, value: "xio://user", range: XIOUserRangeXIO)
                XIOLinkTextXIO.addAttribute(.link, value: "xio://privacy", range: XIOPrivacyRangeXIO)
                
                // 修正点 3: 这里的链接颜色需要单独指定，否则会变成系统默认的蓝色
                XIOTermsTextViewXIO.linkTextAttributes = [
                    .foregroundColor: UIColor.green, // 或者使用你喜欢的强调色
                    .underlineStyle: NSUnderlineStyle.single.rawValue
                ]
        XIOTermsTextViewXIO.attributedText = XIOLinkTextXIO
        XIOTermsTextViewXIO.isEditable = false
        XIOTermsTextViewXIO.isScrollEnabled = false // 修正点 4: 禁用滚动，确保自适应高度
                XIOTermsTextViewXIO.backgroundColor = .clear
                XIOTermsTextViewXIO.textContainerInset = .zero // 消除内边距
                XIOTermsTextViewXIO.textContainer.lineFragmentPadding = 0
                XIOTermsTextViewXIO.delegate = self
        
        XIODashedLineXIO.backgroundColor = .clear
        let XIOShapeLayerXIO = CAShapeLayer()
        XIOShapeLayerXIO.strokeColor = UIColor.white.cgColor
        XIOShapeLayerXIO.lineWidth = 8
        XIOShapeLayerXIO.lineDashPattern = [15, 10]
        let XIOPathXIO = CGMutablePath()
        XIOPathXIO.addLines(between: [CGPoint(x: 0, y: 10), CGPoint(x: XIOScreenWidthXIO + 40, y: 10)])
        XIOShapeLayerXIO.path = XIOPathXIO
        XIODashedLineXIO.layer.addSublayer(XIOShapeLayerXIO)
    }

    private func XIOInteractionLogicXIO() {
        XIOEulaButtonXIO.addTarget(self, action: #selector(XIOTapEulaXIO), for: .touchUpInside)
        XIOArrowButtonXIO.addTarget(self, action: #selector(XIOTapAuthXIO), for: .touchUpInside)
        XIOTermsCheckboxXIO.addTarget(self, action: #selector(XIOTapToggleAgreedXIO), for: .touchUpInside)
    }

    @objc private func XIOTapToggleAgreedXIO() {
        XIOIsAgreedXIO.toggle()
        XIOTermsCheckboxXIO.backgroundColor = XIOIsAgreedXIO ? .white : .clear
        XIOTermsCheckboxXIO.setImage(XIOIsAgreedXIO ? UIImage(systemName: "checkmark") : nil, for: .normal)
        XIOTermsCheckboxXIO.tintColor = .black
    }

    @objc private func XIOTapAuthXIO() {
        guard XIOIsAgreedXIO else {
            let XIOAnimXIO = CABasicAnimation(keyPath: "position")
            XIOAnimXIO.duration = 0.07
            XIOAnimXIO.repeatCount = 3
            XIOAnimXIO.autoreverses = true
            XIOAnimXIO.fromValue = NSValue(cgPoint: CGPoint(x: XIOTermsTextViewXIO.center.x - 10, y: XIOTermsTextViewXIO.center.y))
            XIOAnimXIO.toValue = NSValue(cgPoint: CGPoint(x: XIOTermsTextViewXIO.center.x + 10, y: XIOTermsTextViewXIO.center.y))
            XIOTermsTextViewXIO.layer.add(XIOAnimXIO, forKey: "shake")
            return
        }
        
        let XIOLoadingXIO = UIActivityIndicatorView(style: .large)
        XIOLoadingXIO.center = view.center
        XIOLoadingXIO.color = .white
        view.addSubview(XIOLoadingXIO)
        XIOLoadingXIO.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XIOLoadingXIO.stopAnimating()
            self.navigationController?.pushViewController(XioEmailAuthPortalXio(), animated: true)
        }
    }

    @objc private func XIOTapEulaXIO() {
        XioTriggerLegalFlowXio(from: self, XioCategoryXio: .XioEulaXio)
    }

    private func XIOOpenWebXIO(urlStr: String) {
        guard let url = URL(string: urlStr) else { return }
        let XIOSafariXIO = SFSafariViewController(url: url)
        present(XIOSafariXIO, animated: true)
    }
}

extension XIOEntryViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        if URL.absoluteString == "xio://user" {
            XioTriggerLegalFlowXio(from: self, XioCategoryXio: .XioTermsXio)
//            XIOOpenWebXIO(urlStr: "https://xnioa.com/terms")
        } else if URL.absoluteString == "xio://privacy" {
            XioTriggerLegalFlowXio(from: self, XioCategoryXio: .XioPrivacyXio)
        }
        return false
    }
}
