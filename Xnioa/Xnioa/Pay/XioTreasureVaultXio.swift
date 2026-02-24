//
//  XioTreasureVaultXio.swift
//  Xnioa
//
//  Created by mumu on 2026/2/24.
//

import UIKit

struct XioWealthPackageXio {
    let XioDiamondCountXio: String
    let XioPriceLabelXio: String
}

class XioTreasureVaultXio: UIViewController {
    
    private let XioSkyBackdropXio = UIView()
    private let XioRetreatTriggerXio = UIButton()
    
    private let XioCloudRackXio = UIImageView.init(image: UIImage.init(named: "XioSkyBackdropXiog"))
    private let XioCrownOrbitXio = UIImageView()
    private let XioTotalWealthTagXio = UILabel()
    private let XioSubWealthTagXio = UILabel()
    
    private let XioWealthStreamXio = UITableView()
    private let XioExecuteRechargeXio = UIButton()
    
    private var XioSelectedIdxXio: Int = 0
    private let XioWScaleXio = UIScreen.main.bounds.width / 375
    private let XioHScaleXio = UIScreen.main.bounds.height / 812
    
    private let XioInventoryXio: [XioWealthPackageXio] = [
        XioWealthPackageXio(XioDiamondCountXio: "400", XioPriceLabelXio: "$0.99"),
        XioWealthPackageXio(XioDiamondCountXio: "800", XioPriceLabelXio: "$1.99"),
        XioWealthPackageXio(XioDiamondCountXio: "1900", XioPriceLabelXio: "$3.99"),
        XioWealthPackageXio(XioDiamondCountXio: "2450", XioPriceLabelXio: "$4.99"),
        XioWealthPackageXio(XioDiamondCountXio: "3950", XioPriceLabelXio: "$6.99"),
        XioWealthPackageXio(XioDiamondCountXio: "4900", XioPriceLabelXio: "$9.99")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        XioInitializeStageXio()
        XioAssembleComponentsXio()
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
        XioWealthStreamXio.register(XioWealthTokenCellXio.self, forCellReuseIdentifier: "XioWealthTokenCellXio")
    }
    
    private func XioAssembleComponentsXio() {
        [XioSkyBackdropXio, XioRetreatTriggerXio, XioCloudRackXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        XioRetreatTriggerXio.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        XioRetreatTriggerXio.tintColor = .white
        XioRetreatTriggerXio.addTarget(self, action: #selector(XioExitVaultXio), for: .touchUpInside)
        
        XioTotalWealthTagXio.text = "400"
        XioTotalWealthTagXio.font = .systemFont(ofSize: 32, weight: .bold)
        XioTotalWealthTagXio.textColor = .black
        
        XioSubWealthTagXio.text = "My gold coins"
        XioSubWealthTagXio.font = UIFont(name: "Inter-Medium", size: 20)
        XioSubWealthTagXio.textColor = UIColor(red: 0.07, green: 0.08, blue: 0.09, alpha: 0.5000)
        
        let XioGradiantXio = CAGradientLayer()
        XioGradiantXio.frame = CGRect(x: 0, y: 0, width: 335 * XioWScaleXio, height: 50 * XioHScaleXio)
        XioGradiantXio.colors = [UIColor.systemPurple.cgColor, UIColor.systemIndigo.cgColor]
        XioGradiantXio.startPoint = CGPoint(x: 0, y: 0.5)
        XioGradiantXio.endPoint = CGPoint(x: 1, y: 0.5)
        
        XioExecuteRechargeXio.setBackgroundImage(UIImage.init(named: "XioExecuteRechargeXio"), for: .normal)
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
        let XioLoadViewXio = UIActivityIndicatorView(style: .large)
        XioLoadViewXio.center = view.center
        view.addSubview(XioLoadViewXio)
        XioLoadViewXio.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XioLoadViewXio.stopAnimating()
            let XioNotifyXio = UIAlertController(title: "Processing", message: "Connecting to secure gateway...", preferredStyle: .alert)
            XioNotifyXio.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(XioNotifyXio, animated: true)
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
        let XioCellXio = tableView.dequeueReusableCell(withIdentifier: "XioWealthTokenCellXio", for: indexPath) as! XioWealthTokenCellXio
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
        
        XioIconOrbitXio.image = UIImage(named: "RechargeXio")
       
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
