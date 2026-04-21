//
//  XIOEntryViewController.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/24.
//

import UIKit
import SafariServices

class XIOEntryViewController: UIViewController {
    static var ifAccept:Bool = false
    
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
    @objc  func upadateStatuse()  {
        
//        self.XIOTermsCheckboxXIO.isSelected = XIOEntryViewController.ifAccept
        XIOTermsCheckboxXIO.backgroundColor = XIOEntryViewController.ifAccept ? .white : .clear
        XIOTermsCheckboxXIO.setImage(XIOEntryViewController.ifAccept ? UIImage(systemName: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMQSU2cCH46OJPnP/ohpNKgJo")) : nil, for: .normal)
//        XIOTermsCheckboxXIO.tintColor = .black
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        XIOEntryViewController.ifAccept = false
        NotificationCenter.default.addObserver(self, selector: #selector(upadateStatuse), name: NSNotification.Name.init(XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMV1zK1IfDWuEpGd1ut+TWwA=")), object: nil)
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
        XIOMainBackgroundXIO.image = UIImage(named: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMYDSMbrv+cPLRxo8P5zCd+hy"))
        XIOMainBackgroundXIO.contentMode = .scaleAspectFill
        
        XIOEulaButtonXIO.backgroundColor = UIColor(white: 0.1, alpha: 0.8)
        XIOEulaButtonXIO.setTitle(XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMS9KGkc/Og89BZEgAQ=="), for: .normal)
        XIOEulaButtonXIO.setTitleColor(.green, for: .normal)
        XIOEulaButtonXIO.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        XIOEulaButtonXIO.layer.cornerRadius = 4

        XIOHeadlineLabelXIO.text = XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMUULXJX1W2WK0eBEadUQoSeLPug=")
        XIOHeadlineLabelXIO.numberOfLines = 0
        XIOHeadlineLabelXIO.textColor = .white
        XIOHeadlineLabelXIO.font = UIFont(name: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMeRxFhFIGlv6I3MZKyhL43Q/M3chgwsVxA=="), size: 64)
        XIOHeadlineLabelXIO.textAlignment = .center

        XIOGoNowLabelXIO.text = XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMSXEOOXkYDqDMTheOvYB")
        XIOGoNowLabelXIO.textColor = .white
        XIOGoNowLabelXIO.font = UIFont.systemFont(ofSize: 32, weight: .bold)

        XIOArrowButtonXIO.backgroundColor = .white
        XIOArrowButtonXIO.layer.cornerRadius = 35
        XIOArrowButtonXIO.setImage(UIImage(systemName: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMXJZUiFjdX7+l/MPX3XbRDuqo+mblQ==")), for: .normal)
        XIOArrowButtonXIO.tintColor = .black

        XIOTermsCheckboxXIO.layer.borderWidth = 1
                XIOTermsCheckboxXIO.layer.borderColor = UIColor.white.cgColor
                XIOTermsCheckboxXIO.layer.cornerRadius = 4
                
                // 修正点 1: 使用更明确的富文本设置
                let XIORawTextXIO = XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMUOrMqgEDlZd5RouqNEj8fIrmPUQkZuQmGquAlsDJ9+KmsHMopV11thTy5nz1mFJG3XQyFCXdrFvN06TZDuQLzaYZ8/PcHw=")
                let XIOLinkTextXIO = NSMutableAttributedString(string: XIORawTextXIO)
                
                // 修正点 2: 必须先设置全局字体和颜色，否则可能因为默认黑色而在深色背景下不可见
                let XIOFullRangeXIO = NSRange(location: 0, length: XIOLinkTextXIO.length)
                XIOLinkTextXIO.addAttribute(.font, value: UIFont.systemFont(ofSize: 12), range: XIOFullRangeXIO)
                XIOLinkTextXIO.addAttribute(.foregroundColor, value: UIColor.lightGray, range: XIOFullRangeXIO)
                
                // 设置链接
                let XIOUserRangeXIO = (XIORawTextXIO as NSString).range(of: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMT1tG/+OdOWM5QnBfdoYkaCRszhLyA=="))
                let XIOPrivacyRangeXIO = (XIORawTextXIO as NSString).range(of: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMcNqwDHSD1IUGtvqQ6sJr39ZYXajNfQ="))
                
                XIOLinkTextXIO.addAttribute(.link, value: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMb15PWjg7fWI+Dx7usuc2IMSjw=="), range: XIOUserRangeXIO)
                XIOLinkTextXIO.addAttribute(.link, value: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMe6h2fmxPapbK5IpQTPPgJrYl68CXA=="), range: XIOPrivacyRangeXIO)
                
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
        XIOEntryViewController.ifAccept.toggle()
        XIOTermsCheckboxXIO.backgroundColor = XIOEntryViewController.ifAccept ? .white : .clear
        XIOTermsCheckboxXIO.setImage(XIOEntryViewController.ifAccept ? UIImage(systemName: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMQSU2cCH46OJPnP/ohpNKgJo")) : nil, for: .normal)
        XIOTermsCheckboxXIO.tintColor = .black
    }

    @objc private func XIOTapAuthXIO() {
        guard XIOEntryViewController.ifAccept else {
            let XIOAnimXIO = CABasicAnimation(keyPath: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMTNr73O1MzJcH4FD8Mirsyc="))
            XIOAnimXIO.duration = 0.07
            XIOAnimXIO.repeatCount = 3
            XIOAnimXIO.autoreverses = true
            XIOAnimXIO.fromValue = NSValue(cgPoint: CGPoint(x: XIOTermsTextViewXIO.center.x - 10, y: XIOTermsTextViewXIO.center.y))
            XIOAnimXIO.toValue = NSValue(cgPoint: CGPoint(x: XIOTermsTextViewXIO.center.x + 10, y: XIOTermsTextViewXIO.center.y))
            XIOTermsTextViewXIO.layer.add(XIOAnimXIO, forKey: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMTIIHFbm8CES19Q30kg="))
            return
        }
        
      
        XNioaAppIndicatorMannager.XNioashowInfo(XNioawithStatus: "")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XNioaAppIndicatorMannager.XNioadismiss()
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
        if URL.absoluteString == XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMb15PWjg7fWI+Dx7usuc2IMSjw==") {
            XioTriggerLegalFlowXio(from: self, XioCategoryXio: .XioTermsXio)
//            XIOOpenWebXIO(urlStr: "https://xnioa.com/terms")
        } else if URL.absoluteString == XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMe6h2fmxPapbK5IpQTPPgJrYl68CXA==") {
            XioTriggerLegalFlowXio(from: self, XioCategoryXio: .XioPrivacyXio)
        }
        return false
    }
}
