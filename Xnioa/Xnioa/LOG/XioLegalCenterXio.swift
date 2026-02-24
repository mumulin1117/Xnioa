import UIKit
enum XioLegalTypeXio {
    case XioEulaXio
    case XioPrivacyXio
    case XioTermsXio
}

class XioLegalCenterXio: UIViewController {

    private let XioDimmingBaseXio = UIView()
    private let XioSheetCanvasXio = UIView()
    private let XioHeadlineXio = UILabel()
    private let XioScrollContentXio = UIScrollView()
    private let XioLegalTextXio = UILabel()
    
    private let XioRejectTriggerXio = UIButton(type: .system)
    private let XioConfirmTriggerXio = UIButton(type: .system)
    
    private let XioRatioWXio = UIScreen.main.bounds.width / 375
    private let XioRatioHXio = UIScreen.main.bounds.height / 812
    
    private var XioCurrentTypeXio: XioLegalTypeXio = .XioEulaXio
    var XioAgreedCallbackXio: (() -> Void)?

   
    init(XioContentTypeXio: XioLegalTypeXio) {
        super.init(nibName: nil, bundle: nil)
        self.XioCurrentTypeXio = XioContentTypeXio
    }
    
    required init?(coder: NSCoder) {
        fatalError("Xio_Init_Error")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        XioSetupFrameXio()
        XioApplyAestheticXio()
        XioPopulateContentXio()
        XioBindActionsXio()
    }

    private func XioSetupFrameXio() {
        view.backgroundColor = .clear
        [XioDimmingBaseXio, XioSheetCanvasXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        [XioHeadlineXio, XioScrollContentXio, XioRejectTriggerXio, XioConfirmTriggerXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioSheetCanvasXio.addSubview($0)
        }
        
        XioScrollContentXio.addSubview(XioLegalTextXio)
        XioLegalTextXio.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            XioDimmingBaseXio.topAnchor.constraint(equalTo: view.topAnchor),
            XioDimmingBaseXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioDimmingBaseXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioDimmingBaseXio.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            XioSheetCanvasXio.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            XioSheetCanvasXio.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            XioSheetCanvasXio.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.88),
            XioSheetCanvasXio.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.65),

            XioHeadlineXio.topAnchor.constraint(equalTo: XioSheetCanvasXio.topAnchor, constant: 30 * XioRatioHXio),
            XioHeadlineXio.centerXAnchor.constraint(equalTo: XioSheetCanvasXio.centerXAnchor),

            XioScrollContentXio.topAnchor.constraint(equalTo: XioHeadlineXio.bottomAnchor, constant: 20 * XioRatioHXio),
            XioScrollContentXio.leadingAnchor.constraint(equalTo: XioSheetCanvasXio.leadingAnchor, constant: 20 * XioRatioWXio),
            XioScrollContentXio.trailingAnchor.constraint(equalTo: XioSheetCanvasXio.trailingAnchor, constant: -20 * XioRatioWXio),
            XioScrollContentXio.bottomAnchor.constraint(equalTo: XioRejectTriggerXio.topAnchor, constant: -20 * XioRatioHXio),

            XioLegalTextXio.topAnchor.constraint(equalTo: XioScrollContentXio.topAnchor),
            XioLegalTextXio.leadingAnchor.constraint(equalTo: XioScrollContentXio.leadingAnchor),
            XioLegalTextXio.trailingAnchor.constraint(equalTo: XioScrollContentXio.trailingAnchor),
            XioLegalTextXio.bottomAnchor.constraint(equalTo: XioScrollContentXio.bottomAnchor),
            XioLegalTextXio.widthAnchor.constraint(equalTo: XioScrollContentXio.widthAnchor),

            XioRejectTriggerXio.leadingAnchor.constraint(equalTo: XioSheetCanvasXio.leadingAnchor, constant: 15 * XioRatioWXio),
            XioRejectTriggerXio.bottomAnchor.constraint(equalTo: XioSheetCanvasXio.bottomAnchor, constant: -20 * XioRatioHXio),
            XioRejectTriggerXio.widthAnchor.constraint(equalTo: XioSheetCanvasXio.widthAnchor, multiplier: 0.45),
            XioRejectTriggerXio.heightAnchor.constraint(equalToConstant: 50 * XioRatioHXio),

            XioConfirmTriggerXio.trailingAnchor.constraint(equalTo: XioSheetCanvasXio.trailingAnchor, constant: -15 * XioRatioWXio),
            XioConfirmTriggerXio.bottomAnchor.constraint(equalTo: XioRejectTriggerXio.bottomAnchor),
            XioConfirmTriggerXio.widthAnchor.constraint(equalTo: XioRejectTriggerXio.widthAnchor),
            XioConfirmTriggerXio.heightAnchor.constraint(equalTo: XioRejectTriggerXio.heightAnchor)
        ])
    }

    private func XioPopulateContentXio() {
        switch XioCurrentTypeXio {
        case .XioEulaXio:
            XioHeadlineXio.text = "EULA"
            XioLegalTextXio.text = """
            Last Updated: 2026-03-01
            Contact: xiona@gmail.com

            I. Acceptance of Terms
            This End User License Agreement ("Agreement") is a legal bond between you and Xnioa. By downloading or using the Xnioa application, you agree to step into our retro-social sanctuary and abide by these rules. If you do not agree to the warmth of our community standards, please do not use the application.

            II. License Grant
            Xnioa grants you a personal, non-exclusive, non-transferable, limited license to use the app for personal, non-commercial, and expressive purposes, specifically to rediscover the joy of shared style and voice interactions.

            III. Prohibited User Conduct
            To maintain the "hustle-free" atmosphere of Xnioa, users are strictly prohibited from the following behaviors:

            Harmful Content: Posting, sharing, or transmitting any content involving the exploitation of minors, child pornography, or material harmful to children is strictly forbidden.

            Harassment and Bullying: Every voice matters here. You may not engage in stalking, bullying, or the promotion of violence against individuals or groups.

            Adult Content: Xnioa is a space for style and casual everyday moments; the promotion or sharing of explicit pornography is prohibited.

            Misinformation: You must not spread false, harmful, or deceptive information regarding current events or individuals.

            Automation: The use of bots, scrapers, or automated screen-scrolling scripts is prohibited to ensure authentic human interaction.
"""
        case .XioPrivacyXio:
            XioHeadlineXio.text = "Privacy Policy"
            XioLegalTextXio.text = """
Last Updated: 2026-03-01
Contact: xiona@gmail.com

I. Our Philosophy
At Xnioa, we believe your privacy is as classic as a vintage vinyl record. We focus on "authentic style" and "real voices," which means we collect only what is necessary to make your social experience wonderful and engaging. We avoid the invasive "endless tracking" common in modern scrolling apps.

II. Information Collection
Personal Expressions: We collect the short videos and voice clips you choose to share to showcase your style and current status.

Direct Interaction Data: When you engage in video chats or respond via voice, these streams are processed to facilitate real-time connection.

Device Context: We collect minimal device information (model, OS version) to optimize the video and audio performance for your specific hardware.

Contact Information: Your email address (xiona@gmail.com for inquiries) is used only for account security and essential community updates.

III. How We Use Your Data
Your data is used to curate a welcoming space where every conversation is a wonderful experience. This includes:

Enabling face-to-face video interactions.

Facilitating the exchange of ideas through voice content.

Preventing toxic behavior and ensuring the community remains a safe "escape" from modern digital fatigue.

IV. Data Sharing and Security
Xnioa does not sell your personal style or voice data to third-party advertisers. We believe your data is your identity. We use industry-standard encryption to protect your video chats and shared moments from unauthorized access.

V. Your Rights
You have the right to access, update, or delete your shared moments at any time. If you wish to disappear from the retro gathering, you can delete your account, and your personal data will be purged from our active systems within a reasonable timeframe.
"""
        case .XioTermsXio:
            XioHeadlineXio.text = "User Agreement"
            XioLegalTextXio.text = """
            Last Updated: 2026-03-01
            Contact: xiona@gmail.com

            I. The Xnioa Experience
            Xnioa is designed to revitalize social interaction by bringing people together in a familiar, expressive, and welcoming space. By using Xnioa, you agree to join a community where voices, laughter, and shared style matter more than numbers.

            II. User Content and Style Showcases
            You retain ownership of the content you post. However, by sharing short videos or voice responses on Xnioa, you grant us a worldwide, royalty-free license to host, store, and display that content to other members of the community to facilitate engagement. You represent that you have the rights to any style or content you showcase.

            III. Relaxed Interaction Logic
            Our community thrives on a "relaxed atmosphere" without the need for forced conversations. You agree not to use Xnioa for commercial solicitation, spamming, or high-frequency marketing that disrupts the "un-scrolled" nature of our platform.

            IV. Video Chat and Authenticity
            Our video chat features are intended for authentic, face-to-face interaction. You agree not to use filters or third-party software that masks your identity in a deceptive manner during these interactions. We value the "direct" and "engaging" nature of seeing real expressions.

            V. Limitation of Liability
            Xnioa is provided "as is." While we strive to make every conversation a wonderful experience, we cannot guarantee that the service will be uninterrupted or error-free. We are not liable for any indirect, incidental, or emotional damages resulting from your interactions with other users or your time spent in the app.

            VI. Amendments
            As we grow our retro gatherings, these terms may evolve. We will notify you of significant changes via the app. Your continued presence in the Xnioa community signifies your acceptance of the updated terms.
            """
        }
    }

    private func XioApplyAestheticXio() {
        XioDimmingBaseXio.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        XioSheetCanvasXio.backgroundColor = UIColor(white: 0.15, alpha: 1.0)
        XioSheetCanvasXio.layer.cornerRadius = 15
        
        XioHeadlineXio.textColor = .white
        XioHeadlineXio.font = .systemFont(ofSize: 24, weight: .bold)
        
        XioLegalTextXio.numberOfLines = 0
        XioLegalTextXio.textColor = UIColor(white: 0.85, alpha: 1.0)
        XioLegalTextXio.font = .systemFont(ofSize: 15, weight: .light)
        
        XioRejectTriggerXio.setTitle("Decline", for: .normal)
        XioRejectTriggerXio.setTitleColor(.white, for: .normal)
        XioRejectTriggerXio.layer.borderWidth = 1
        XioRejectTriggerXio.layer.borderColor = UIColor.gray.cgColor
        XioRejectTriggerXio.layer.cornerRadius = 8
        
        XioConfirmTriggerXio.setTitle("I Agree", for: .normal)
        XioConfirmTriggerXio.setTitleColor(.black, for: .normal)
        XioConfirmTriggerXio.backgroundColor = UIColor(red: 0.7, green: 0.9, blue: 0.6, alpha: 1.0)
        XioConfirmTriggerXio.layer.cornerRadius = 8
    }

    private func XioBindActionsXio() {
        XioRejectTriggerXio.addTarget(self, action: #selector(XioDismissPortalXio), for: .touchUpInside)
        XioConfirmTriggerXio.addTarget(self, action: #selector(XioGrantConsentXio), for: .touchUpInside)
    }

    @objc private func XioGrantConsentXio() {
        let XioFeedbackXio = UINotificationFeedbackGenerator()
        XioFeedbackXio.notificationOccurred(.success)
        
        UIView.animate(withDuration: 0.25) {
            self.view.alpha = 0
        } completion: { _ in
            self.dismiss(animated: false) {
                self.XioAgreedCallbackXio?()
            }
        }
    }

    @objc private func XioDismissPortalXio() {
        dismiss(animated: true)
    }
}

func XioTriggerLegalFlowXio(from XioHostXio: UIViewController, XioCategoryXio: XioLegalTypeXio) {
    let XioLegalPortalXio = XioLegalCenterXio(XioContentTypeXio: XioCategoryXio)
    XioLegalPortalXio.modalPresentationStyle = .overFullScreen
    XioLegalPortalXio.modalTransitionStyle = .crossDissolve
    
    XioLegalPortalXio.XioAgreedCallbackXio = {
        print("User_Accepted_\(XioCategoryXio)_Successfully")
    }
    
    XioHostXio.present(XioLegalPortalXio, animated: true)
}


