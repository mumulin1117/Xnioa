import UIKit

class XNioaAppIndicatorMannager {
    
    static let shared = XNioaAppIndicatorMannager()
    private var XNioaoverlayWindow: UIWindow?
    
   
    private func XNioapresent(XNioamessage: String, XNioaicon: UIImage?, XNioaisLoading: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.XNioadismissIndicator()
            
            guard let windowScene = UIApplication.shared.connectedScenes
                .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene else {
                return
            }
            
            let XNioawindow = UIWindow(windowScene: windowScene) // 修改：显式关联 Scene
            XNioawindow.frame = UIScreen.main.bounds
            XNioawindow.windowLevel = .alert + 1
            XNioawindow.backgroundColor = .clear
         
            XNioawindow.rootViewController = UIViewController()
            XNioawindow.rootViewController?.view.backgroundColor = .clear
            
            let XNioacontainer = UIView()
            XNioacontainer.backgroundColor = UIColor.black.withAlphaComponent(0.8)
            XNioacontainer.layer.cornerRadius = 14
            XNioacontainer.translatesAutoresizingMaskIntoConstraints = false
            
            let XNioastack = UIStackView()
            XNioastack.axis = .vertical
            XNioastack.alignment = .center
            XNioastack.spacing = 12
            XNioastack.translatesAutoresizingMaskIntoConstraints = false
            
            let XNioaindicatorView = UIActivityIndicatorView(style: .large)
            XNioaindicatorView.color = .white
            
            let XNioaimageView = UIImageView(image: XNioaicon)
            XNioaimageView.tintColor = .white
            XNioaimageView.contentMode = .scaleAspectFit
            XNioaimageView.translatesAutoresizingMaskIntoConstraints = false
            XNioaimageView.widthAnchor.constraint(equalToConstant: 36).isActive = true
            XNioaimageView.heightAnchor.constraint(equalToConstant: 36).isActive = true
            
            let XNioalabel = UILabel()
            XNioalabel.text = XNioamessage
            XNioalabel.textColor = .white
            XNioalabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
            XNioalabel.numberOfLines = 2
            XNioalabel.textAlignment = .center
            
            if XNioaisLoading {
                XNioastack.addArrangedSubview(XNioaindicatorView)
                XNioaindicatorView.startAnimating()
            } else if XNioaicon != nil {
                XNioastack.addArrangedSubview(XNioaimageView)
            }
            XNioastack.addArrangedSubview(XNioalabel)
            
            XNioacontainer.addSubview(XNioastack)
            XNioawindow.addSubview(XNioacontainer)
            
            NSLayoutConstraint.activate([
                XNioacontainer.centerXAnchor.constraint(equalTo: XNioawindow.centerXAnchor),
                XNioacontainer.centerYAnchor.constraint(equalTo: XNioawindow.centerYAnchor),
                XNioacontainer.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),
                XNioacontainer.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
                
                XNioastack.topAnchor.constraint(equalTo: XNioacontainer.topAnchor, constant: 20),
                XNioastack.bottomAnchor.constraint(equalTo: XNioacontainer.bottomAnchor, constant: -20),
                XNioastack.leadingAnchor.constraint(equalTo: XNioacontainer.leadingAnchor, constant: 16),
                XNioastack.trailingAnchor.constraint(equalTo: XNioacontainer.trailingAnchor, constant: -16),
            ])
            
            XNioawindow.isHidden = false // 替代 makeKeyAndVisible，避免干扰主窗口
            self.XNioaoverlayWindow = XNioawindow
            
            XNioacontainer.alpha = 0
            XNioacontainer.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            UIView.animate(withDuration: 0.2, animations: {
                XNioacontainer.alpha = 1
                XNioacontainer.transform = .identity
            })
            
            if !XNioaisLoading {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
                    self?.XNioadismissIndicator()
                }
            }
        }
    }
    
    private func XNioadismissIndicator() {
       
        if !Thread.isMainThread {
            DispatchQueue.main.async { self.XNioadismissIndicator() }
            return
        }
        self.XNioaoverlayWindow?.isHidden = true
        self.XNioaoverlayWindow = nil
    }
  
    class func XNioashow(XNioainfo: String) {
        shared.XNioapresent(XNioamessage: XNioainfo, XNioaicon: nil, XNioaisLoading: true)
    }
    
    class func XNioashowInfo(XNioawithStatus: String) {
        shared.XNioapresent(XNioamessage: XNioawithStatus, XNioaicon: nil, XNioaisLoading: false)
    }
    
    class func XNioashowSuccess(XNioawithStatus message: String) {
        shared.XNioapresent(XNioamessage: message, XNioaicon: UIImage(systemName: "checkmark.circle.fill"), XNioaisLoading: false)
    }
    
    class func XNioadismiss() {
        shared.XNioadismissIndicator()
    }
}
