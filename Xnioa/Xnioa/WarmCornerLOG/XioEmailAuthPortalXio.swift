import UIKit
import PhotosUI
import AuthenticationServices

class XioEmailAuthPortalXio: XioResilienceAnchorXio, UITextFieldDelegate, PHPickerViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {

    private enum XioPortalModeVerseXio {
        case XioLoginLoungeXio
        case XioSignupLoungeXio
    }

    private let XioRetroBackdropXio = UIView()
    private let XioRetroScrollXio = UIScrollView()
    private let XioRetroContentXio = UIView()
    private let XioHeaderDockXio = UIView()
    private let XioReturnTriggerXio = UIButton(type: .system)
    private let XioHeaderTitleXio = UILabel()
    private let XioPortalStackXio = UIStackView()
    private let XioHeroStageXio = UIView()
    private let XioGramophoneArtXio = UIImageView()
    private let XioAvatarFrameXio = UIView()
    private let XioAvatarPreviewXio = UIImageView()
    private let XioAvatarTriggerXio = UIButton(type: .custom)
    private let XioAvatarGlyphXio = UILabel()
    
    private let XioNameCaptionXio = UILabel()
    private let XioNameInputXio = UITextField()
    private let XioEmailCaptionXio = UILabel()
    private let XioEmailInputXio = UITextField()
    private let XioPassCaptionXio = UILabel()
    private let XioPassInputXio = UITextField()
    private let XioBirthCaptionXio = UILabel()
    private let XioBirthInputXio = UITextField()
    
    private lazy var XioNameLaneXio: UIStackView = XioForgeFieldLaneXio(label: XioNameCaptionXio, terminal: XioNameInputXio)
    private lazy var XioEmailLaneXio: UIStackView = XioForgeFieldLaneXio(label: XioEmailCaptionXio, terminal: XioEmailInputXio)
    private lazy var XioPassLaneXio: UIStackView = XioForgeFieldLaneXio(label: XioPassCaptionXio, terminal: XioPassInputXio)
    private lazy var XioBirthLaneXio: UIStackView = XioForgeFieldLaneXio(label: XioBirthCaptionXio, terminal: XioBirthInputXio)
    
    private let XioSwitchPromptXio = UIButton(type: .system)
    private lazy var XioDividerLaneXio: UIStackView = XioForgeDividerLaneXio()
    private let XioAppleDockXio = UIView()
    private let XioAppleTriggerXio = UIButton(type: .system)
    private let XioPrimaryTriggerXio = UIButton(type: .system)
    
    private let XioBirthWheelXio = UIDatePicker()
    private let XioBirthFormatterXio = DateFormatter()
    
    private let XioWidthRhythmXio = UIScreen.main.bounds.width / 375
    private let XioHeightRhythmXio = UIScreen.main.bounds.height / 812
    private let XioAccentMintXio = UIColor(red: 182/255, green: 240/255, blue: 156/255, alpha: 1)
    private let XioAppleBundleVerseXio = XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMaEhu58nzsaXNAj7CaI3TzIPUQ==")
    
    private var XioHeroHeightConstraintXio: NSLayoutConstraint?
    private var XioPortalModeXio: XioPortalModeVerseXio = .XioLoginLoungeXio
    private var XioSignupPortraitXio: UIImage?
    private var XioAppleAuthBridgeXio: ASAuthorizationController?

    override func viewDidLoad() {
        super.viewDidLoad()
        XioSetupRetroShellXio()
        XioDressRetroStageXio()
        XioBindRetroSignalsXio()
        XioApplyPortalModeXio(animated: false)
    }

    private func XioSetupRetroShellXio() {
        view.backgroundColor = UIColor(red: 12/255, green: 15/255, blue: 18/255, alpha: 1)
        XioRetroScrollXio.contentInsetAdjustmentBehavior = .never
        XioRetroScrollXio.showsVerticalScrollIndicator = false
        
        [XioRetroBackdropXio, XioRetroScrollXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        XioRetroContentXio.translatesAutoresizingMaskIntoConstraints = false
        XioRetroScrollXio.addSubview(XioRetroContentXio)
        
        [XioHeaderDockXio, XioPortalStackXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioRetroContentXio.addSubview($0)
        }
        
        [XioReturnTriggerXio, XioHeaderTitleXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioHeaderDockXio.addSubview($0)
        }
        
        [XioGramophoneArtXio, XioAvatarFrameXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioHeroStageXio.addSubview($0)
        }
        
        [XioAvatarPreviewXio, XioAvatarTriggerXio, XioAvatarGlyphXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioAvatarFrameXio.addSubview($0)
        }
        
        XioAppleDockXio.translatesAutoresizingMaskIntoConstraints = false
        XioAppleDockXio.addSubview(XioAppleTriggerXio)
        XioAppleTriggerXio.translatesAutoresizingMaskIntoConstraints = false
        
        XioPortalStackXio.axis = .vertical
        XioPortalStackXio.spacing = 18 * XioHeightRhythmXio
        
        [XioHeroStageXio, XioNameLaneXio, XioEmailLaneXio, XioPassLaneXio, XioBirthLaneXio, XioSwitchPromptXio, XioDividerLaneXio, XioAppleDockXio, XioPrimaryTriggerXio].forEach {
            XioPortalStackXio.addArrangedSubview($0)
        }
        
        XioHeroHeightConstraintXio = XioHeroStageXio.heightAnchor.constraint(equalToConstant: 212 * XioHeightRhythmXio)
        
        NSLayoutConstraint.activate([
            XioRetroBackdropXio.topAnchor.constraint(equalTo: view.topAnchor),
            XioRetroBackdropXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioRetroBackdropXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioRetroBackdropXio.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            XioRetroScrollXio.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            XioRetroScrollXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioRetroScrollXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioRetroScrollXio.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            XioRetroContentXio.topAnchor.constraint(equalTo: XioRetroScrollXio.contentLayoutGuide.topAnchor),
            XioRetroContentXio.leadingAnchor.constraint(equalTo: XioRetroScrollXio.contentLayoutGuide.leadingAnchor),
            XioRetroContentXio.trailingAnchor.constraint(equalTo: XioRetroScrollXio.contentLayoutGuide.trailingAnchor),
            XioRetroContentXio.bottomAnchor.constraint(equalTo: XioRetroScrollXio.contentLayoutGuide.bottomAnchor),
            XioRetroContentXio.widthAnchor.constraint(equalTo: XioRetroScrollXio.frameLayoutGuide.widthAnchor),
            
            XioHeaderDockXio.topAnchor.constraint(equalTo: XioRetroContentXio.topAnchor, constant: 10 * XioHeightRhythmXio),
            XioHeaderDockXio.leadingAnchor.constraint(equalTo: XioRetroContentXio.leadingAnchor, constant: 20 * XioWidthRhythmXio),
            XioHeaderDockXio.trailingAnchor.constraint(equalTo: XioRetroContentXio.trailingAnchor, constant: -20 * XioWidthRhythmXio),
            XioHeaderDockXio.heightAnchor.constraint(equalToConstant: 36 * XioHeightRhythmXio),
            
            XioReturnTriggerXio.leadingAnchor.constraint(equalTo: XioHeaderDockXio.leadingAnchor),
            XioReturnTriggerXio.centerYAnchor.constraint(equalTo: XioHeaderDockXio.centerYAnchor),
            XioReturnTriggerXio.widthAnchor.constraint(equalToConstant: 28 * XioWidthRhythmXio),
            XioReturnTriggerXio.heightAnchor.constraint(equalToConstant: 28 * XioWidthRhythmXio),
            
            XioHeaderTitleXio.leadingAnchor.constraint(equalTo: XioReturnTriggerXio.trailingAnchor, constant: 8 * XioWidthRhythmXio),
            XioHeaderTitleXio.centerYAnchor.constraint(equalTo: XioHeaderDockXio.centerYAnchor),
            XioHeaderTitleXio.trailingAnchor.constraint(lessThanOrEqualTo: XioHeaderDockXio.trailingAnchor),
            
            XioPortalStackXio.topAnchor.constraint(equalTo: XioHeaderDockXio.bottomAnchor, constant: 22 * XioHeightRhythmXio),
            XioPortalStackXio.leadingAnchor.constraint(equalTo: XioRetroContentXio.leadingAnchor, constant: 30 * XioWidthRhythmXio),
            XioPortalStackXio.trailingAnchor.constraint(equalTo: XioRetroContentXio.trailingAnchor, constant: -30 * XioWidthRhythmXio),
            XioPortalStackXio.bottomAnchor.constraint(equalTo: XioRetroContentXio.bottomAnchor, constant: -28 * XioHeightRhythmXio),
            
            XioHeroHeightConstraintXio!,
            
            XioGramophoneArtXio.centerXAnchor.constraint(equalTo: XioHeroStageXio.centerXAnchor),
            XioGramophoneArtXio.centerYAnchor.constraint(equalTo: XioHeroStageXio.centerYAnchor),
            XioGramophoneArtXio.widthAnchor.constraint(equalToConstant: 188 * XioWidthRhythmXio),
            XioGramophoneArtXio.heightAnchor.constraint(equalToConstant: 188 * XioWidthRhythmXio),
            
            XioAvatarFrameXio.centerXAnchor.constraint(equalTo: XioHeroStageXio.centerXAnchor),
            XioAvatarFrameXio.centerYAnchor.constraint(equalTo: XioHeroStageXio.centerYAnchor),
            XioAvatarFrameXio.widthAnchor.constraint(equalToConstant: 120 * XioWidthRhythmXio),
            XioAvatarFrameXio.heightAnchor.constraint(equalToConstant: 120 * XioWidthRhythmXio),
            
            XioAvatarPreviewXio.topAnchor.constraint(equalTo: XioAvatarFrameXio.topAnchor),
            XioAvatarPreviewXio.leadingAnchor.constraint(equalTo: XioAvatarFrameXio.leadingAnchor),
            XioAvatarPreviewXio.trailingAnchor.constraint(equalTo: XioAvatarFrameXio.trailingAnchor),
            XioAvatarPreviewXio.bottomAnchor.constraint(equalTo: XioAvatarFrameXio.bottomAnchor),
            
            XioAvatarTriggerXio.topAnchor.constraint(equalTo: XioAvatarFrameXio.topAnchor),
            XioAvatarTriggerXio.leadingAnchor.constraint(equalTo: XioAvatarFrameXio.leadingAnchor),
            XioAvatarTriggerXio.trailingAnchor.constraint(equalTo: XioAvatarFrameXio.trailingAnchor),
            XioAvatarTriggerXio.bottomAnchor.constraint(equalTo: XioAvatarFrameXio.bottomAnchor),
            
            XioAvatarGlyphXio.centerXAnchor.constraint(equalTo: XioAvatarFrameXio.centerXAnchor),
            XioAvatarGlyphXio.centerYAnchor.constraint(equalTo: XioAvatarFrameXio.centerYAnchor),
            
            XioAppleTriggerXio.centerXAnchor.constraint(equalTo: XioAppleDockXio.centerXAnchor),
            XioAppleTriggerXio.topAnchor.constraint(equalTo: XioAppleDockXio.topAnchor),
            XioAppleTriggerXio.bottomAnchor.constraint(equalTo: XioAppleDockXio.bottomAnchor),
            XioAppleTriggerXio.widthAnchor.constraint(equalToConstant: 46 * XioWidthRhythmXio),
            XioAppleTriggerXio.heightAnchor.constraint(equalToConstant: 46 * XioWidthRhythmXio),
            
            XioPrimaryTriggerXio.heightAnchor.constraint(equalToConstant: 54 * XioHeightRhythmXio)
        ])
    }

    private func XioDressRetroStageXio() {
        XioRetroBackdropXio.backgroundColor = UIColor(red: 12/255, green: 15/255, blue: 18/255, alpha: 1)
        
        XioReturnTriggerXio.setImage(UIImage(systemName: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMeq1SHs0UPSgNhZzAjLW+njqAQ==")), for: .normal)
        XioReturnTriggerXio.tintColor = .white
        
        XioHeaderTitleXio.font = .systemFont(ofSize: 28 * XioWidthRhythmXio, weight: .semibold)
        XioHeaderTitleXio.textColor = .white
        
        XioGramophoneArtXio.image = UIImage(named: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMWYUr8gm/KxxgGxZYssKQ3mc2y5fEWdXbEWXDBw79A=="))
        XioGramophoneArtXio.contentMode = .scaleAspectFit
        
        XioAvatarFrameXio.backgroundColor = UIColor(white: 1, alpha: 0.06)
        XioAvatarFrameXio.layer.cornerRadius = 12 * XioWidthRhythmXio
        XioAvatarFrameXio.clipsToBounds = true
        
        XioAvatarPreviewXio.contentMode = .scaleAspectFill
        XioAvatarPreviewXio.backgroundColor = UIColor(white: 1, alpha: 0.02)
        
        XioAvatarGlyphXio.text = XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMXSErHDdxq54UA==")
        XioAvatarGlyphXio.textColor = UIColor(white: 1, alpha: 0.55)
        XioAvatarGlyphXio.font = .systemFont(ofSize: 44 * XioWidthRhythmXio, weight: .light)
        
        XioDressCaptionXio(XioNameCaptionXio, text: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMRVblOosZXuWluonIg=="))
        XioDressCaptionXio(XioEmailCaptionXio, text: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMTDBdndB45piPfPXGms="))
        XioDressCaptionXio(XioPassCaptionXio, text: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMYZlNDaJ2EW16rir/q95Mao="))
        XioDressCaptionXio(XioBirthCaptionXio, text: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMc4WfKEc7/3BsjJYC9GG0Q1Lqc0="))
        
        XioDressInputXio(XioNameInputXio,
                         placeholder: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMUgVtCTW1gQ0JUcjC46iP31xEuJRgYrQ"),
                         secure: false,
                         keyboardType: .default,
                         contentType: .name,
                         capitalization: .words,
                         returnKey: .next)
        XioDressInputXio(XioEmailInputXio,
                         placeholder: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMek/0nOJ141tle9jbHuek1P/YoRgP1hXNw=="),
                         secure: false,
                         keyboardType: .emailAddress,
                         contentType: .emailAddress,
                         capitalization: .none,
                         returnKey: .next)
        XioDressInputXio(XioPassInputXio,
                         placeholder: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMecNLRAZdcqDvUALeDuVw5v6kXFgw3c="),
                         secure: true,
                         keyboardType: .default,
                         contentType: .password,
                         capitalization: .none,
                         returnKey: .go)
        XioDressInputXio(XioBirthInputXio,
                         placeholder: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMf7fwPtigUgKbwo+gwHvirxkIoP4jSMkRNuHN1Ukpwo="),
                         secure: false,
                         keyboardType: .default,
                         contentType: nil,
                         capitalization: .none,
                         returnKey: .done)
        
        XioBirthInputXio.tintColor = .clear
        XioBirthInputXio.rightView = UIImageView(image: UIImage(systemName: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMacujVv0DUc6nvoT+ysqH58=")))
        XioBirthInputXio.rightViewMode = .always
        XioBirthInputXio.inputView = XioBirthWheelXio
        XioBirthInputXio.inputAccessoryView = XioBirthAccessoryVerseXio()
        
        XioBirthWheelXio.datePickerMode = .date
        XioBirthWheelXio.maximumDate = Date()
        XioBirthWheelXio.preferredDatePickerStyle = .wheels
        
        XioBirthFormatterXio.dateFormat = XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMR2ZR2SFaeMDSJpwwxrBfw==")
        
        XioSwitchPromptXio.setAttributedTitle(XioSwitchPromptVerseXio(), for: .normal)
        XioSwitchPromptXio.contentHorizontalAlignment = .center
        
        XioAppleTriggerXio.backgroundColor = .white
        XioAppleTriggerXio.layer.cornerRadius = 23 * XioWidthRhythmXio
        XioAppleTriggerXio.tintColor = .black
        XioAppleTriggerXio.setImage(UIImage(systemName: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMf7pCjDdVRe/j7rVV3ijG94H")), for: .normal)
        XioAppleTriggerXio.imageView?.contentMode = .scaleAspectFit
        
        XioPrimaryTriggerXio.backgroundColor = XioAccentMintXio
        XioPrimaryTriggerXio.setTitleColor(.black, for: .normal)
        XioPrimaryTriggerXio.titleLabel?.font = .systemFont(ofSize: 18 * XioWidthRhythmXio, weight: .bold)
        XioPrimaryTriggerXio.layer.cornerRadius = 10 * XioWidthRhythmXio
        
        XioRefreshAvatarPreviewXio()
    }

    private func XioBindRetroSignalsXio() {
        XioReturnTriggerXio.addTarget(self, action: #selector(XioExitFlowXio), for: .touchUpInside)
        XioSwitchPromptXio.addTarget(self, action: #selector(XioEnterSignupPoseXio), for: .touchUpInside)
        XioPrimaryTriggerXio.addTarget(self, action: #selector(XioHandlePrimaryPulseXio), for: .touchUpInside)
        XioAppleTriggerXio.addTarget(self, action: #selector(XioHandleApplePulseXio), for: .touchUpInside)
        XioAvatarTriggerXio.addTarget(self, action: #selector(XioHandleAvatarPulseXio), for: .touchUpInside)
        XioBirthWheelXio.addTarget(self, action: #selector(XioBirthWheelShiftedXio), for: .valueChanged)
    }

    private func XioForgeFieldLaneXio(label: UILabel, terminal: UITextField) -> UIStackView {
        let XioLaneXio = UIStackView(arrangedSubviews: [label, terminal])
        XioLaneXio.axis = .vertical
        XioLaneXio.spacing = 10 * XioHeightRhythmXio
        terminal.heightAnchor.constraint(equalToConstant: 54 * XioHeightRhythmXio).isActive = true
        return XioLaneXio
    }

    private func XioForgeDividerLaneXio() -> UIStackView {
        let XioLeftRuleXio = UIView()
        let XioRightRuleXio = UIView()
        let XioWordLabelXio = UILabel()
        
        [XioLeftRuleXio, XioRightRuleXio].forEach {
            $0.backgroundColor = UIColor(white: 1, alpha: 0.12)
            $0.heightAnchor.constraint(equalToConstant: 1).isActive = true
        }
        
        XioWordLabelXio.text = XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMcIcs31myaISX6A=")
        XioWordLabelXio.textColor = UIColor(white: 1, alpha: 0.5)
        XioWordLabelXio.font = .systemFont(ofSize: 13 * XioWidthRhythmXio, weight: .regular)
        XioWordLabelXio.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        let XioLaneXio = UIStackView(arrangedSubviews: [XioLeftRuleXio, XioWordLabelXio, XioRightRuleXio])
        XioLaneXio.axis = .horizontal
        XioLaneXio.alignment = .center
        XioLaneXio.spacing = 10 * XioWidthRhythmXio
        return XioLaneXio
    }

    private func XioDressCaptionXio(_ label: UILabel, text: String) {
        label.text = text
        label.font = .systemFont(ofSize: 15 * XioWidthRhythmXio, weight: .semibold)
        label.textColor = .white
    }

    private func XioDressInputXio(_ textField: UITextField,
                                  placeholder: String,
                                  secure: Bool,
                                  keyboardType: UIKeyboardType,
                                  contentType: UITextContentType?,
                                  capitalization: UITextAutocapitalizationType,
                                  returnKey: UIReturnKeyType) {
        textField.backgroundColor = UIColor(white: 1, alpha: 0.1)
        textField.layer.cornerRadius = 8 * XioWidthRhythmXio
        textField.textColor = .white
        textField.font = .systemFont(ofSize: 15 * XioWidthRhythmXio, weight: .medium)
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.34)])
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14 * XioWidthRhythmXio, height: 10))
        textField.leftViewMode = .always
        textField.keyboardType = keyboardType
        textField.autocapitalizationType = capitalization
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.isSecureTextEntry = secure
        textField.textContentType = contentType
        textField.returnKeyType = returnKey
        textField.clearButtonMode = .whileEditing
        textField.delegate = self
    }

    private func XioBirthAccessoryVerseXio() -> UIToolbar {
        let XioAccessoryBarXio = UIToolbar()
        XioAccessoryBarXio.sizeToFit()
        let XioFlexVerseXio = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let XioDoneVerseXio = UIBarButtonItem(title: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMcNMe4HxuXhNxWA/iQ=="), style: .done, target: self, action: #selector(XioSealBirthVerseXio))
        XioAccessoryBarXio.items = [XioFlexVerseXio, XioDoneVerseXio]
        return XioAccessoryBarXio
    }

    private func XioSwitchPromptVerseXio() -> NSAttributedString {
        let XioPromptVerseXio = NSMutableAttributedString(string: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMVzXuyHRGLgeDdhSiINthfAbAAoVajafiIuQ1LaUxB4="), attributes: [
            .foregroundColor: UIColor(white: 1, alpha: 0.75),
            .font: UIFont.systemFont(ofSize: 14 * XioWidthRhythmXio, weight: .regular)
        ])
        XioPromptVerseXio.append(NSAttributedString(string: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMetDrXty0jA+qyJUFwlF6w=="), attributes: [
            .foregroundColor: XioAccentMintXio,
            .font: UIFont.systemFont(ofSize: 14 * XioWidthRhythmXio, weight: .bold)
        ]))
        return XioPromptVerseXio
    }

    private func XioApplyPortalModeXio(animated: Bool) {
        let XioIsSignupXio = XioPortalModeXio == .XioSignupLoungeXio
        
        XioHeaderTitleXio.text = XioIsSignupXio ? XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMetDrXty0jA+qyJUFwlF6w==") : XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMRBK7jKY1uxJw2v0mnAy")
        XioPrimaryTriggerXio.setTitle(XioIsSignupXio ? XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMetDrXty0jA+qyJUFwlF6w==") : XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMRBK7jKY1uxJw2v0mnAy"), for: .normal)
        XioGramophoneArtXio.isHidden = XioIsSignupXio
        XioAvatarFrameXio.isHidden = !XioIsSignupXio
        XioNameLaneXio.isHidden = !XioIsSignupXio
        XioBirthLaneXio.isHidden = !XioIsSignupXio
        XioSwitchPromptXio.isHidden = XioIsSignupXio
        XioDividerLaneXio.isHidden = XioIsSignupXio
        XioAppleDockXio.isHidden = XioIsSignupXio
        XioPassInputXio.returnKeyType = XioIsSignupXio ? .next : .go
        XioHeroHeightConstraintXio?.constant = XioIsSignupXio ? 146 * XioHeightRhythmXio : 212 * XioHeightRhythmXio
        XioAvatarGlyphXio.isHidden = !XioIsSignupXio || XioSignupPortraitXio != nil
        
        let XioMotionVerseXio = {
            self.view.layoutIfNeeded()
        }
        
        if animated {
            UIView.animate(withDuration: 0.24, delay: 0, options: [.curveEaseInOut]) {
                XioMotionVerseXio()
            }
        } else {
            XioMotionVerseXio()
        }
    }

    private func XioRefreshAvatarPreviewXio() {
        XioAvatarPreviewXio.image = XioSignupPortraitXio
        XioAvatarGlyphXio.isHidden = XioPortalModeXio != .XioSignupLoungeXio || XioSignupPortraitXio != nil
    }

    private func XioPrepareSignupDraftXio(mail: String, secret: String) {
        let XioEchoMailXio = XioNormalizeMailXio(mail)
        if !XioEchoMailXio.isEmpty {
            XioEmailInputXio.text = XioEchoMailXio
        }
        if !secret.isEmpty {
            XioPassInputXio.text = secret
        }
        if (XioNameInputXio.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            XioNameInputXio.text = XioDisplayNameVerseXio(from: XioEchoMailXio)
        }
    }

    private func XioPerformLoginVerseXio(mail: String, secret: String) {
        XioSetPortalEnabledXio(false)
        XNioaAppIndicatorMannager.XNioashow(XNioainfo: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMWXZhmN1BsTorFN8HvvLmqMi"))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.65) { [weak self] in
            guard let XioSelfXio = self else {
                return
            }
            XioSelfXio.XioSetPortalEnabledXio(true)
            XNioaAppIndicatorMannager.XNioadismiss()
            
            if XioGovernanceHubXio.XioPrincipalXio.XioAuthenticateXio(uid: mail, secret: secret) {
                XioEmailAuthPortalXio.XioTransitionToMainStageXio()
            } else {
                XioSelfXio.XioFeedbackErrXio()
                XNioaAppIndicatorMannager.XNioashowInfo(XNioawithStatus: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMTAcyq9lpfBlYZIrc2N6yteMCNNLCg=="))
            }
        }
    }

    private func XioPerformSignupVerseXio(name: String, mail: String, secret: String, birthVerse: String) {
        XioSetPortalEnabledXio(false)
        XNioaAppIndicatorMannager.XNioashow(XNioainfo: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMZno7u/BWVZ9vpT0WxLxHoatzw=="))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) { [weak self] in
            guard let XioSelfXio = self else {
                return
            }
            
            let XioStoredVerseXio = XioGovernanceHubXio.XioPrincipalXio.XioRegisterRetroPassportXio(
                email: mail,
                secret: secret,
                displayName: name,
                birthVerse: birthVerse,
                avatar: XioSelfXio.XioSignupPortraitXio
            )
            
            let XioLoggedVerseXio = XioStoredVerseXio && XioGovernanceHubXio.XioPrincipalXio.XioAuthenticateXio(uid: mail, secret: secret)
            
            XioSelfXio.XioSetPortalEnabledXio(true)
            XNioaAppIndicatorMannager.XNioadismiss()
            
            if XioLoggedVerseXio {
                XioEmailAuthPortalXio.XioTransitionToMainStageXio()
            } else {
                XioSelfXio.XioFeedbackErrXio()
                XNioaAppIndicatorMannager.XNioashowInfo(XNioawithStatus: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMR4/zDyUdxHGmgBQm/H9w/8D4C7fyGM="))
            }
        }
    }

    private func XioSetPortalEnabledXio(_ enabled: Bool) {
        [XioPrimaryTriggerXio, XioAppleTriggerXio, XioSwitchPromptXio, XioReturnTriggerXio].forEach {
            $0.isEnabled = enabled
            $0.alpha = enabled ? 1 : 0.6
        }
        XioAvatarTriggerXio.isUserInteractionEnabled = enabled
        XioEmailInputXio.isEnabled = enabled
        XioPassInputXio.isEnabled = enabled
        XioNameInputXio.isEnabled = enabled
        XioBirthInputXio.isEnabled = enabled
    }

    private func XioNormalizeMailXio(_ mail: String?) -> String {
        (mail ?? "").trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
    }

    private func XioDisplayNameVerseXio(from mail: String) -> String {
        let XioFrontVerseXio = mail.components(separatedBy: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMdTUsXDd5ql4eQ==")).first?.trimmingCharacters(in: .whitespacesAndNewlines) ?? XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMadPi1PiJ7d8iUXH2oc=")
        return XioFrontVerseXio.isEmpty ? XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMadPi1PiJ7d8iUXH2oc=") : XioFrontVerseXio
    }

    private func XioRequestAppleVerseXio(identityToken: String) {
        guard let XioApiVerseXio = URL(string: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMeXNhs0hKp7McKAekpE1RcjgxKonO7VP46W0S25Q5P1R4zJyPXH2fyBuoMvg6woHhxCoqI1LUYYoEEJs")) else {
            XNioaAppIndicatorMannager.XNioashowInfo(XNioawithStatus: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMUl/gPJvUb1c7RqqsBe9PrRnysMmL5LCJ/86obOrYag="))
            return
        }
        
        let XioBodyVerseXio: [String: String] = [
            XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMQgCP9rWkqCJOGeB0YiOoghmYoe4gw=="): identityToken,
            XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMXgEL+2qjI4XESXqoffLtNI="): XioAppleBundleVerseXio,
            XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMQ0KPC1xoHRaraOf0FHDxD0BSYM="): XioGovernanceHubXio.XioPrincipalXio.XioEquipmentNoXio()
        ]
        
        guard let XioBodyArchiveXio = try? JSONSerialization.data(withJSONObject: XioBodyVerseXio) else {
            XNioaAppIndicatorMannager.XNioashowInfo(XNioawithStatus: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMUl/gPJvUb1c7RqqsBe9PrRnysMmL5LCJ/86obOrYag="))
            return
        }
        
        var XioRequestVerseXio = URLRequest(url: XioApiVerseXio)
        XioRequestVerseXio.httpMethod = XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMTEv30jKoJbJWQ/l6Q==")
        XioRequestVerseXio.timeoutInterval = 20
        XioRequestVerseXio.setValue(XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMQpafGBBsIt0dytaF8JYV4jX4qGSk4i7wA=="), forHTTPHeaderField: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMZYTwHOG40AI92tgD0eAuDIm6j15"))
        XioRequestVerseXio.httpBody = XioBodyArchiveXio
        
        XioSetPortalEnabledXio(false)
        XNioaAppIndicatorMannager.XNioashow(XNioainfo: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMeUIJuNriLOyC+dauNsVs3Ml8FMTOioB"))
        
        URLSession.shared.dataTask(with: XioRequestVerseXio) { [weak self] XioDataVerseXio, _, XioErrorVerseXio in
            DispatchQueue.main.async {
                guard let XioSelfXio = self else {
                    return
                }
                
                XioSelfXio.XioSetPortalEnabledXio(true)
                XNioaAppIndicatorMannager.XNioadismiss()
                
                if XioErrorVerseXio != nil {
                    XioSelfXio.XioFeedbackErrXio()
                    XNioaAppIndicatorMannager.XNioashowInfo(XNioawithStatus: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMSwsLgIXVfqTF896r4QdmE1/hl+nxUunoJTlsw=="))
                    return
                }
                
                guard let XioDataVerseXio,
                      let XioEnvelopeXio = try? JSONDecoder().decode(XioAppleSsoEnvelopeXio.self, from: XioDataVerseXio),
                      XioEnvelopeXio.code == 200000,
                      let XioMirrorVerseXio = XioEnvelopeXio.data else {
                    XioSelfXio.XioFeedbackErrXio()
                    XNioaAppIndicatorMannager.XNioashowInfo(XNioawithStatus: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMSwsLgIXVfqTF896r4QdmE1/hl+nxUunoJTlsw=="))
                    return
                }
                
                let XioRemoteBadgeXio = XioMirrorVerseXio.userId.map { String($0) }
                let XioEchoMailXio = XioSelfXio.XioNormalizeMailXio(XioMirrorVerseXio.userEmail)
                let XioDisplayVibeXio = (XioMirrorVerseXio.userName ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
                let XioSeedNameXio = XioDisplayVibeXio.isEmpty ? XioSelfXio.XioDisplayNameVerseXio(from: XioEchoMailXio.isEmpty ? XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMRt09KtZSUJHQwKwReUd2dvzi8A=") : XioEchoMailXio) : XioDisplayVibeXio
                
                if XioGovernanceHubXio.XioPrincipalXio.XioAcceptApplePassportXio(
                    email: XioEchoMailXio,
                    displayName: XioSeedNameXio,
                    genderTone: XioMirrorVerseXio.userGender,
                    remoteBadge: XioRemoteBadgeXio,
                    sessionToken: XioMirrorVerseXio.token,
                    briefVerse: XioMirrorVerseXio.userBrief,
                    remoteImageLink: XioMirrorVerseXio.userImgUrl
                ) {
                    XioEmailAuthPortalXio.XioTransitionToMainStageXio()
                } else {
                    XioSelfXio.XioFeedbackErrXio()
                    XNioaAppIndicatorMannager.XNioashowInfo(XNioawithStatus: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMSwsLgIXVfqTF896r4QdmE1/hl+nxUunoJTlsw=="))
                }
            }
        }.resume()
    }

    @objc private func XioHandlePrimaryPulseXio() {
        view.endEditing(true)
        
        let XioEchoMailXio = XioNormalizeMailXio(XioEmailInputXio.text)
        let XioSecretVerseXio = (XioPassInputXio.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard XioEchoMailXio.contains(XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMdTUsXDd5ql4eQ==")), XioSecretVerseXio.count >= 6 else {
            XioFeedbackErrXio()
            XNioaAppIndicatorMannager.XNioashowInfo(XNioawithStatus: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMWogMdBL/qa4q0o8f8+Kg8Svs9iQkQIrWndMNPosMVYFN7SP4EDzdBC6sFjri9c="))
            return
        }
        
        if XioPortalModeXio == .XioLoginLoungeXio {
            if XioGovernanceHubXio.XioPrincipalXio.XioShouldRouteDirectEntryXio(email: XioEchoMailXio) {
                XioPerformLoginVerseXio(mail: XioEchoMailXio, secret: XioSecretVerseXio)
            } else {
                XioPrepareSignupDraftXio(mail: XioEchoMailXio, secret: XioSecretVerseXio)
                XioPortalModeXio = .XioSignupLoungeXio
                XioApplyPortalModeXio(animated: true)
                XNioaAppIndicatorMannager.XNioashowInfo(XNioawithStatus: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMfecEc7wzJV1DSWjs1mFe3NAqos+ksuvoJekL2i9ps7oTaFt3680KovgE8fWaSVC"))
            }
            return
        }
        
        let XioDisplayVibeXio = (XioNameInputXio.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        let XioBirthVerseXio = (XioBirthInputXio.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !XioDisplayVibeXio.isEmpty else {
            XioFeedbackErrXio()
            XNioaAppIndicatorMannager.XNioashowInfo(XNioawithStatus: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMUgVtCTW1gQ0JUcjC46iP31xEuJRgYrQ"))
            return
        }
        
        guard XioSignupPortraitXio != nil else {
            XioFeedbackErrXio()
            XNioaAppIndicatorMannager.XNioashowInfo(XNioawithStatus: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMcLZWnSDLfBQwcJye5vLbsGs4+GTQwZ1mRPF8Azwbw=="))
            return
        }
        
        guard !XioBirthVerseXio.isEmpty else {
            XioFeedbackErrXio()
            XNioaAppIndicatorMannager.XNioashowInfo(XNioawithStatus: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMf7fwPtigUgKbwo+gwHvirxkIoP4jSMkRNuHN1Ukpwo="))
            return
        }
        
        guard XioEchoMailXio != XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMaxYylhHsR9si3wFHMOHJ0hVFdu7ygOaqw==") else {
            XioFeedbackErrXio()
            XNioaAppIndicatorMannager.XNioashowInfo(XNioawithStatus: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMTFF8mF/GJ7Ae5vH7rbj/8ArQZCRuhWnVZQopAPFDGCI"))
            return
        }
        
        if XioGovernanceHubXio.XioPrincipalXio.XioShouldRouteDirectEntryXio(email: XioEchoMailXio) {
            XioPortalModeXio = .XioLoginLoungeXio
            XioApplyPortalModeXio(animated: true)
            XNioaAppIndicatorMannager.XNioashowInfo(XNioawithStatus: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMRRr9MIWQ7sB6+zytnLPhEL3O3gvkmYqDktjTL0Liu8W1k21eSLoDeYxGnPhOTY5Q3i6jho="))
            return
        }
        
        XioPerformSignupVerseXio(name: XioDisplayVibeXio, mail: XioEchoMailXio, secret: XioSecretVerseXio, birthVerse: XioBirthVerseXio)
    }

    @objc private func XioEnterSignupPoseXio() {
        XioPrepareSignupDraftXio(mail: XioNormalizeMailXio(XioEmailInputXio.text), secret: XioPassInputXio.text ?? "")
        XioPortalModeXio = .XioSignupLoungeXio
        XioApplyPortalModeXio(animated: true)
    }

    @objc private func XioHandleApplePulseXio() {
        view.endEditing(true)
        let XioAppleVerseXio = ASAuthorizationAppleIDProvider().createRequest()
        XioAppleVerseXio.requestedScopes = [.fullName, .email]
        
        let XioControllerVerseXio = ASAuthorizationController(authorizationRequests: [XioAppleVerseXio])
        XioControllerVerseXio.delegate = self
        XioControllerVerseXio.presentationContextProvider = self
        XioAppleAuthBridgeXio = XioControllerVerseXio
        XioControllerVerseXio.performRequests()
    }

    @objc private func XioHandleAvatarPulseXio() {
        let XioAvatarVerseXio = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        XioAvatarVerseXio.addAction(UIAlertAction(title: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMVOourPm1ZF7sdGLZ4I="), style: .default) { [weak self] _ in
            self?.XioOpenRetroCameraXio()
        })
        XioAvatarVerseXio.addAction(UIAlertAction(title: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMWQB63OXZXWbqYg5eHA="), style: .default) { [weak self] _ in
            self?.XioOpenRetroAlbumXio()
        })
        XioAvatarVerseXio.addAction(UIAlertAction(title: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMRFkSwaFjs6DwXoJZeHH"), style: .cancel))
        
        if let XioPopoverVerseXio = XioAvatarVerseXio.popoverPresentationController {
            XioPopoverVerseXio.sourceView = XioAvatarFrameXio
            XioPopoverVerseXio.sourceRect = XioAvatarFrameXio.bounds
        }
        
        present(XioAvatarVerseXio, animated: true)
    }

    @objc private func XioBirthWheelShiftedXio() {
        XioBirthInputXio.text = XioBirthFormatterXio.string(from: XioBirthWheelXio.date)
    }

    @objc private func XioSealBirthVerseXio() {
        XioBirthWheelShiftedXio()
        XioBirthInputXio.resignFirstResponder()
    }

    @objc private func XioExitFlowXio() {
        if XioPortalModeXio == .XioSignupLoungeXio {
            XioPortalModeXio = .XioLoginLoungeXio
            XioApplyPortalModeXio(animated: true)
            return
        }
        
        if let XioNavVerseXio = navigationController, XioNavVerseXio.viewControllers.first != self {
            XioNavVerseXio.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case XioNameInputXio:
            XioEmailInputXio.becomeFirstResponder()
        case XioEmailInputXio:
            XioPassInputXio.becomeFirstResponder()
        case XioPassInputXio:
            if XioPortalModeXio == .XioSignupLoungeXio {
                XioBirthInputXio.becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
                XioHandlePrimaryPulseXio()
            }
        case XioBirthInputXio:
            textField.resignFirstResponder()
            XioHandlePrimaryPulseXio()
        default:
            textField.resignFirstResponder()
        }
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == XioBirthInputXio, (XioBirthInputXio.text ?? "").isEmpty {
            XioBirthWheelShiftedXio()
        }
    }

    private func XioOpenRetroCameraXio() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            XNioaAppIndicatorMannager.XNioashowInfo(XNioawithStatus: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMSZa+i5prdN6PvAvUPMLBQNrLjI5PZsY69LQg2BY"))
            return
        }
        
        let XioCameraVerseXio = UIImagePickerController()
        XioCameraVerseXio.sourceType = .camera
        XioCameraVerseXio.delegate = self
        XioCameraVerseXio.allowsEditing = true
        present(XioCameraVerseXio, animated: true)
    }
    
    private func XioOpenRetroAlbumXio() {
        var XioAlbumVerseXio = PHPickerConfiguration()
        XioAlbumVerseXio.selectionLimit = 1
        XioAlbumVerseXio.filter = .images
        
        let XioAlbumPickerXio = PHPickerViewController(configuration: XioAlbumVerseXio)
        XioAlbumPickerXio.delegate = self
        present(XioAlbumPickerXio, animated: true)
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        guard let XioProviderVerseXio = results.first?.itemProvider,
              XioProviderVerseXio.canLoadObject(ofClass: UIImage.self) else {
            return
        }
        
        XioProviderVerseXio.loadObject(ofClass: UIImage.self) { [weak self] XioImageVerseXio, _ in
            DispatchQueue.main.async {
                self?.XioAcceptPortraitVerseXio(XioImageVerseXio as? UIImage)
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        let XioPortraitVerseXio = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage
        XioAcceptPortraitVerseXio(XioPortraitVerseXio)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    private func XioAcceptPortraitVerseXio(_ image: UIImage?) {
        guard let XioPortraitVerseXio = image else {
            return
        }
        XioSignupPortraitXio = XioPortraitVerseXio
        XioRefreshAvatarPreviewXio()
    }

    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        view.window ?? ASPresentationAnchor()
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        XioAppleAuthBridgeXio = nil
        guard let XioAppleVerseXio = authorization.credential as? ASAuthorizationAppleIDCredential,
              let XioIdentityArchiveXio = XioAppleVerseXio.identityToken,
              let XioIdentityVerseXio = String(data: XioIdentityArchiveXio, encoding: .utf8),
              !XioIdentityVerseXio.isEmpty else {
            XioFeedbackErrXio()
            XNioaAppIndicatorMannager.XNioashowInfo(XNioawithStatus: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMSwsLgIXVfqTF896r4QdmE1/hl+nxUunoJTlsw=="))
            return
        }
        
        XioRequestAppleVerseXio(identityToken: XioIdentityVerseXio)
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        XioAppleAuthBridgeXio = nil
        if (error as NSError).code != ASAuthorizationError.canceled.rawValue {
            XioFeedbackErrXio()
            XNioaAppIndicatorMannager.XNioashowInfo(XNioawithStatus: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMSwsLgIXVfqTF896r4QdmE1/hl+nxUunoJTlsw=="))
        }
    }

    class func XioTransitionToMainStageXio() {
        guard let XioActiveWinXio = UIApplication.shared.connectedScenes
                .filter({ $0.activationState == .foregroundActive })
                .compactMap({ $0 as? UIWindowScene })
                .first?.windows
                .first(where: { $0.isKeyWindow }) else {
            return
        }
            
        if let XioDelegateXio = XioActiveWinXio.windowScene?.delegate as? SceneDelegate {
            let XIOLobbyVCXIO = XioMainCoordinatorXio()
            let XIONavXIO = UINavigationController(rootViewController: XIOLobbyVCXIO)
            XIONavXIO.navigationBar.isHidden = true
            XioDelegateXio.window?.rootViewController = XIONavXIO
        }
    }

    private func XioFeedbackErrXio() {
        let XioShakeVerseXio = CABasicAnimation(keyPath: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMTNr73O1MzJcH4FD8Mirsyc="))
        XioShakeVerseXio.duration = 0.05
        XioShakeVerseXio.repeatCount = 4
        XioShakeVerseXio.autoreverses = true
        XioShakeVerseXio.fromValue = NSValue(cgPoint: CGPoint(x: XioPrimaryTriggerXio.center.x - 5, y: XioPrimaryTriggerXio.center.y))
        XioShakeVerseXio.toValue = NSValue(cgPoint: CGPoint(x: XioPrimaryTriggerXio.center.x + 5, y: XioPrimaryTriggerXio.center.y))
        XioPrimaryTriggerXio.layer.add(XioShakeVerseXio, forKey: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMTIIHFbm8CES19Q30kg="))
    }
}

private struct XioAppleSsoEnvelopeXio: Decodable {
    let code: Int
    let data: XioAppleSsoMirrorXio?
    let message: String?
}

private struct XioAppleSsoMirrorXio: Decodable {
    let userStatus: Int?
    let bundleId: String?
    let userEmail: String?
    let userGender: Int?
    let userImgUrl: String?
    let equipmentNo: String?
    let userType: Int?
    let userBrief: String?
    let userName: String?
    let userId: Int64?
    let token: String?
}
