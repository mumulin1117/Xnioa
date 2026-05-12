//
//  XioTreasureVaultXio.swift
//  Xnioa
//
//  Created by Xnioa on 2026/2/24.
//

import UIKit
import StoreKit
struct XioWealthPackageXio {
    let XioDiamondCountXio: String
    let XioPriceLabelXio: String
    let XioAisiKeyXio :String
    
}

class XioTreasureVaultXio: UIViewController {
    deinit {
        SKPaymentQueue.default().remove(self)
    }
    private let XioSkyBackdropXio = UIView()
    private let XioRetreatTriggerXio = UIButton()
    
    private let XioCloudRackXio = UIImageView.init(image: UIImage.init(named: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMdNKrYFjhn1Rs7A/pt8JC1IqZDYZAA2ic9e6")))
    private let XioCrownOrbitXio = UIImageView()
    private let XioTotalWealthTagXio = UILabel()
    private let XioSubWealthTagXio = UILabel()
    
    private let XioWealthStreamXio = UITableView()
    private let XioExecuteRechargeXio = UIButton()
    
    private var XioSelectedIdxXio: Int = 0
    private let XioWScaleXio = UIScreen.main.bounds.width / 375
    
    private let XioHScaleXio = UIScreen.main.bounds.height / 812
    
    private let XioInventoryXio: [XioWealthPackageXio] = [
        XioWealthPackageXio(XioDiamondCountXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMUI0C0LlSTUhI8Zd"), XioPriceLabelXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMRzZtplCuUN+lU47/5I="), XioAisiKeyXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMUG0lzhuX0eGhNPTKmRgC5CccxLZA1CfhA==")),
        XioWealthPackageXio(XioDiamondCountXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMbV/bfcjjDVH6AIn"), XioPriceLabelXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMeLAIj9os4ThR9qRVKc="), XioAisiKeyXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMW/Yl41L/Lme8/QI61DnkCUGs69vv4rxKw==")),
        XioWealthPackageXio(XioDiamondCountXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMQzuVQ567TEbnxIKQw=="), XioPriceLabelXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMS1fAWrQPqnebHqiKlc="), XioAisiKeyXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMdwVp+HlQ8rCmluff5rwqoRQKLD7u48XXyE=")),
        XioWealthPackageXio(XioDiamondCountXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMSo7VAPhrUkVQjrr0w=="), XioPriceLabelXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMTEacFZP+db43Z6ftH8=") ,XioAisiKeyXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMTDTiABxuoQIS+Nvc7jXfxvrIKhN+pUs2Q==")),
        XioWealthPackageXio(XioDiamondCountXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMQH/OOzoDNdvI7Bvxw=="), XioPriceLabelXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMajgEJ9BzXN/za/amnk="), XioAisiKeyXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMRAWpNvJzom0N4NJFe8AkROeKNRHsvVISUM=")),
        XioWealthPackageXio(XioDiamondCountXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMUQ87jAGZ9yO950iyg=="), XioPriceLabelXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMaUcHUbp9DZDwVLJEco="), XioAisiKeyXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMeddsRfGu+lVQHh3BNrbW/w7Rlv9CtczwA==")),
        
        XioWealthPackageXio(XioDiamondCountXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMQTlav7hyJxc8u2WNgs="), XioPriceLabelXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMZxrO2G7fWn+Gv0CMVUC"), XioAisiKeyXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMarpNHAwp5PhDdJjEICQwHCIU1v81wxYqA==")),
        XioWealthPackageXio(XioDiamondCountXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMTOIERB8v4BC1VIssls="), XioPriceLabelXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMeRSUM6OZ79UZJ9ywzl6"), XioAisiKeyXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMdDHkeY8IKB6K9MqI2sD2OrxQyWLGcMfCA==")),
        XioWealthPackageXio(XioDiamondCountXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMQTlav7hyJxc8u2WNgs="), XioPriceLabelXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMf8TXB/tTgyWTVeX0x46"), XioAisiKeyXio: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMXljG3yBRmXtSbgZoBXz0/slLKOTZNIC/w==")),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        XioInitializeStageXio()
        XioAssembleComponentsXio()
        sxnioSetupIAPCore()
        XioWealthStreamXio.showsVerticalScrollIndicator = false
    }
    
    private func XioInitializeStageXio() {
        view.backgroundColor = .black
        XioSkyBackdropXio.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.15, alpha: 1.0)
        XioSkyBackdropXio.contentMode = .scaleAspectFill
        
        
        XioCloudRackXio.isUserInteractionEnabled = true
        XioCloudRackXio.contentMode = .scaleAspectFill
        XioWealthStreamXio.delegate = self
        XioWealthStreamXio.dataSource = self
        XioWealthStreamXio.backgroundColor = .clear
        XioWealthStreamXio.separatorStyle = .none
        XioWealthStreamXio.register(XioWealthTokenCellXio.self, forCellReuseIdentifier: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMW+QPPDmYmocCRD3E5LUwDg/WcOLw2+/NXqdsCE2"))
    }
    
    private func XioAssembleComponentsXio() {
        [XioSkyBackdropXio, XioRetreatTriggerXio, XioCloudRackXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        XioRetreatTriggerXio.setImage(UIImage(systemName: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMeq1SHs0UPSgNhZzAjLW+njqAQ==")), for: .normal)
        XioRetreatTriggerXio.tintColor = .white
        XioRetreatTriggerXio.addTarget(self, action: #selector(XioExitVaultXio), for: .touchUpInside)
        
        XioTotalWealthTagXio.text = String(sxnioCurrentBalance)
        XioTotalWealthTagXio.font = .systemFont(ofSize: 32, weight: .bold)
        XioTotalWealthTagXio.textColor = .black
        
        XioSubWealthTagXio.text = XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMY0qGm1bVIWW2MPmWgcTrC/ggwgzmg==")
        XioSubWealthTagXio.font = UIFont(name: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMbPISkUnFBt76+9dAAsi7xzhiqvb"), size: 20)
        XioSubWealthTagXio.textColor = UIColor(red: 0.07, green: 0.08, blue: 0.09, alpha: 0.5000)
        
        let XioGradiantXio = CAGradientLayer()
        XioGradiantXio.frame = CGRect(x: 0, y: 0, width: 335 * XioWScaleXio, height: 50 * XioHScaleXio)
        XioGradiantXio.colors = [UIColor.systemPurple.cgColor, UIColor.systemIndigo.cgColor]
        XioGradiantXio.startPoint = CGPoint(x: 0, y: 0.5)
        XioGradiantXio.endPoint = CGPoint(x: 1, y: 0.5)
        
        XioExecuteRechargeXio.setBackgroundImage(UIImage.init(named: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMe7Xjaas/3qJAaCvZJPg65MDSOmobSN3aVObIMFu")), for: .normal)
        XioExecuteRechargeXio.addTarget(self, action: #selector(XioInvokePaymentXio), for: .touchUpInside)
        
        [XioCrownOrbitXio, XioTotalWealthTagXio, XioSubWealthTagXio, XioWealthStreamXio, XioExecuteRechargeXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioCloudRackXio.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            XioSkyBackdropXio.topAnchor.constraint(equalTo: view.topAnchor),
            XioSkyBackdropXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            XioSkyBackdropXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            XioSkyBackdropXio.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            XioRetreatTriggerXio.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            XioRetreatTriggerXio.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            XioCloudRackXio.topAnchor.constraint(equalTo: view.topAnchor, constant: 100 * XioHScaleXio),
            XioCloudRackXio.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            XioCloudRackXio.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            XioCloudRackXio.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            XioTotalWealthTagXio.topAnchor.constraint(equalTo: XioCloudRackXio.topAnchor, constant: 160 * XioHScaleXio),
            XioTotalWealthTagXio.centerXAnchor.constraint(equalTo: XioCloudRackXio.centerXAnchor),
            
            XioSubWealthTagXio.topAnchor.constraint(equalTo: XioTotalWealthTagXio.bottomAnchor, constant: 5),
            XioSubWealthTagXio.centerXAnchor.constraint(equalTo: XioCloudRackXio.centerXAnchor),
            
            XioWealthStreamXio.topAnchor.constraint(equalTo: XioSubWealthTagXio.bottomAnchor, constant: 20),
            XioWealthStreamXio.leadingAnchor.constraint(equalTo: XioCloudRackXio.leadingAnchor, constant: 20),
            XioWealthStreamXio.trailingAnchor.constraint(equalTo: XioCloudRackXio.trailingAnchor, constant: -20),
            XioWealthStreamXio.bottomAnchor.constraint(equalTo: XioExecuteRechargeXio.topAnchor, constant: -10),
            
            XioExecuteRechargeXio.bottomAnchor.constraint(equalTo: XioCloudRackXio.bottomAnchor, constant: -40 * XioHScaleXio),
            XioExecuteRechargeXio.centerXAnchor.constraint(equalTo: XioCloudRackXio.centerXAnchor),
            XioExecuteRechargeXio.widthAnchor.constraint(equalToConstant: 315 * XioWScaleXio),
            XioExecuteRechargeXio.heightAnchor.constraint(equalToConstant: 50 * XioHScaleXio)
        ])
    }
    
    @objc private func XioInvokePaymentXio() {
        let sxnioPackage = XioInventoryXio[XioSelectedIdxXio]
        
        // 显示 Loading
        sxnioShowLoading(true)
        
        // 发起内购请求
        if SKPaymentQueue.canMakePayments() {
            let sxnioProductID = sxnioPackage.XioAisiKeyXio
            let sxnioRequest = SKProductsRequest(productIdentifiers: [sxnioProductID])
            sxnioRequest.delegate = self
            sxnioRequest.start()
        } else {
            sxnioShowLoading(false)
            sxnioPresentAlert(sxnioTitle: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMQvW7BRGuyjfqAvJwws="), sxnioMsg: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMfrn2CmxSZEdSSfgoROnpaMRah17ciiTcPFiOEjyo/kHsG80h3hurYo5iIpJ/zXjItVQ0AAa"))
        }
    }
    
    @objc private func XioExitVaultXio() {
        navigationController?.popViewController(animated: true)
    }
}

extension XioTreasureVaultXio: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return XioInventoryXio.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let XioCellXio = tableView.dequeueReusableCell(withIdentifier: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMW+QPPDmYmocCRD3E5LUwDg/WcOLw2+/NXqdsCE2"), for: indexPath) as! XioWealthTokenCellXio
        XioCellXio.XioHydrateTokenXio(XioInventoryXio[indexPath.row], XioIsActiveXio: XioSelectedIdxXio == indexPath.row)
        return XioCellXio
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        XioSelectedIdxXio = indexPath.row
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65 * XioHScaleXio
    }
}

class XioWealthTokenCellXio: UITableViewCell {
    
    private let XioVesselXio = UIView()
    private let XioIconOrbitXio = UIImageView()
    private let XioVolumeTagXio = UILabel()
    private let XioCostTagXio = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        XioBuildCellStructureXio()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func XioBuildCellStructureXio() {
        backgroundColor = .clear
        selectionStyle = .none
        
        XioVesselXio.layer.cornerRadius = 10
        XioVesselXio.layer.borderWidth = 1
        
        XioIconOrbitXio.image = UIImage(named: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMeSxLn9kXoCJpm1XKDeTqPyi6tM="))
       
        XioCostTagXio.font = .systemFont(ofSize: 18, weight: .bold)
        
        [XioVesselXio, XioIconOrbitXio, XioVolumeTagXio, XioCostTagXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            XioVesselXio.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            XioVesselXio.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            XioVesselXio.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            XioVesselXio.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            XioIconOrbitXio.leadingAnchor.constraint(equalTo: XioVesselXio.leadingAnchor, constant: 15),
            XioIconOrbitXio.centerYAnchor.constraint(equalTo: XioVesselXio.centerYAnchor),
            XioIconOrbitXio.widthAnchor.constraint(equalToConstant: 20),
            XioIconOrbitXio.heightAnchor.constraint(equalToConstant: 20),
            
            XioVolumeTagXio.leadingAnchor.constraint(equalTo: XioIconOrbitXio.trailingAnchor, constant: 12),
            XioVolumeTagXio.centerYAnchor.constraint(equalTo: XioVesselXio.centerYAnchor),
            
            XioCostTagXio.trailingAnchor.constraint(equalTo: XioVesselXio.trailingAnchor, constant: -15),
            XioCostTagXio.centerYAnchor.constraint(equalTo: XioVesselXio.centerYAnchor)
        ])
    }
    
    func XioHydrateTokenXio(_ data: XioWealthPackageXio, XioIsActiveXio: Bool) {
        XioVolumeTagXio.text = data.XioDiamondCountXio
        XioCostTagXio.text = data.XioPriceLabelXio
        
        if XioIsActiveXio {
            XioVesselXio.backgroundColor = UIColor.systemPurple.withAlphaComponent(0.1)
            XioVesselXio.layer.borderColor = UIColor.systemPurple.cgColor
            XioVolumeTagXio.textColor = .systemPurple
            XioCostTagXio.textColor = .systemPurple
        } else {
            XioVesselXio.backgroundColor = .clear
            XioVesselXio.layer.borderColor = UIColor.systemPurple.withAlphaComponent(0.3).cgColor
            XioVolumeTagXio.textColor = .black
            XioCostTagXio.textColor = .systemIndigo
        }
    }
}


// 1. 首先让控制器遵守内购监听协议
extension XioTreasureVaultXio: SKPaymentTransactionObserver, SKProductsRequestDelegate {
    
    // --- 新增属性 ---
    // 模拟本地存储余额（实际项目中建议从 UserDefaults 或服务器获取）
    private var sxnioCurrentBalance: Int {
        get { XioGovernanceHubXio.XioPrincipalXio.XioCurrentReserveXio }
        set {
            
            XioTotalWealthTagXio.text = String(newValue)
        }
    }
    
    // 2. 在 viewDidLoad 中设置监听
    private func sxnioSetupIAPCore() {
        SKPaymentQueue.default().add(self)
        // 初始化显示余额
        if UserDefaults.standard.object(forKey: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMf/fYpiAbQpykPKzFEo/i8oNays8oIirptgQu4EndaDT7Q==")) == nil {
            sxnioCurrentBalance = XioGovernanceHubXio.XioPrincipalXio.XioCurrentReserveXio
        } else {
            XioTotalWealthTagXio.text = String(sxnioCurrentBalance)
        }
    }

  

    // 4. StoreKit Delegate: 收到产品信息
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        DispatchQueue.main.async {
            if let sxnioProduct = response.products.first {
                let sxnioPayment = SKPayment(product: sxnioProduct)
                SKPaymentQueue.default().add(sxnioPayment)
            } else {
                self.sxnioShowLoading(false)
                self.sxnioPresentAlert(sxnioTitle: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMXHF7HJ4EiDsbZqIyOBI"), sxnioMsg: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMb3HC0uePe16Ouhn1xNDy2k+IZJCs8TECwOpUzFiAyyEcnEerObk0Q=="))
            }
        }
    }

    // 5. StoreKit Delegate: 交易状态监听
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for sxnioTrans in transactions {
            switch sxnioTrans.transactionState {
            case .purchased:
                sxnioHandleSuccessPurchase(sxnioTrans)
            case .failed:
                sxnioHandleFailedPurchase(sxnioTrans)
            case .restored:
                SKPaymentQueue.default().finishTransaction(sxnioTrans)
            default: break
            }
        }
    }

    // --- 内部逻辑处理 ---

    private func sxnioHandleSuccessPurchase(_ sxnioTrans: SKPaymentTransaction) {
        SKPaymentQueue.default().finishTransaction(sxnioTrans)
        
        DispatchQueue.main.async {
            self.sxnioShowLoading(false)
            // 增加金币逻辑
            let sxnioAddedCount = Int(self.XioInventoryXio[self.XioSelectedIdxXio].XioDiamondCountXio) ?? 0
//            self.sxnioCurrentBalance += sxnioAddedCount
            XioGovernanceHubXio.XioPrincipalXio.XioInjectReserveXio(gain:   sxnioAddedCount)
            self.XioTotalWealthTagXio.text = String(self.sxnioCurrentBalance)
            self.sxnioPresentAlert(sxnioTitle: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMVJU3Ke/xCjeE5Ro0xKgcw=="), sxnioMsg: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMSdTP+us2nYAUKdUvniHIfQEXwjl27zYiAX2") + String(sxnioAddedCount) + XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMbj/BgL2uYdKIlqy8FiPjONK0Cku"))
        }
    }

    private func sxnioHandleFailedPurchase(_ sxnioTrans: SKPaymentTransaction) {
        SKPaymentQueue.default().finishTransaction(sxnioTrans)
        DispatchQueue.main.async {
            self.sxnioShowLoading(false)
            if let sxnioError = sxnioTrans.error as? SKError, sxnioError.code != .paymentCancelled {
                self.sxnioPresentAlert(sxnioTitle: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMXLYdLsoCbzJIcM7KYOEsh2a9J9TkJiA"), sxnioMsg: sxnioError.localizedDescription)
            }
        }
    }

    // --- UI 辅助组件 ---

    private func sxnioShowLoading(_ sxnioActive: Bool) {
        if sxnioActive {
            let sxnioIndicator = UIActivityIndicatorView(style: .large)
            sxnioIndicator.color = .systemPurple
            sxnioIndicator.tag = 999
            sxnioIndicator.center = view.center
            view.addSubview(sxnioIndicator)
            sxnioIndicator.startAnimating()
            view.isUserInteractionEnabled = false
        } else {
            view.viewWithTag(999)?.removeFromSuperview()
            view.isUserInteractionEnabled = true
        }
    }

    private func sxnioPresentAlert(sxnioTitle: String, sxnioMsg: String) {
        let sxnioAlert = UIAlertController(title: sxnioTitle, message: sxnioMsg, preferredStyle: .alert)
        sxnioAlert.addAction(UIAlertAction(title: XioRetroCipherCoreXio.XioOpenPhraseXio("xv1:WFBIMSK7zOJn6ZmUsAM="), style: .default))
        self.present(sxnioAlert, animated: true)
    }
    
    // 记得在析构时移除监听
   
}
