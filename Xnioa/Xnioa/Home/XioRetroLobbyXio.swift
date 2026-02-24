//
//  XioRetroLobbyXio.swift
//  Xnioa
//
//  Created by mumu on 2026/2/24.
//

import UIKit

class XioRetroLobbyXio: UIViewController, UISearchBarDelegate {
    private var XioMockDataXio: [String] = []
    private var XioGalleryHeightAnchorXio: NSLayoutConstraint?
    
    private let XioRootScrollXio = UIScrollView()
    private let XioContentBoxXio = UIView()
    
    private let XioPulseSearchXio = UISearchBar()
    private let XioNightCaptionXio = UILabel()
    private let XioVintageBannerXio = UIButton()
    private let XioStyleBannerXio = UIButton()
    
    private let XioPartyCaptionXio = UILabel()
    private let XioFilterOrbitXio = UIStackView()
    
//    private let XioFeedStackXio = UIStackView()
    private var XioGalleryFlowXio: UICollectionView!
    
    
    private let XioWScaleXio = UIScreen.main.bounds.width / 375
    private let XioHScaleXio = UIScreen.main.bounds.height / 812
    private func XioInitialDataLoadXio() {
        // Initial fake data for the default category
        XioMockDataXio = Array(repeating: "Vibe_Item", count: 10)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        XioInitialDataLoadXio()
        XioConstructStructureXio()
        XioDesignStyleXio()
//        XioInjectMockCardsXio()
        XioRegisterSensorsXio()
        
    }

    private func XioConstructStructureXio() {
        let XioLayoutXio = UICollectionViewFlowLayout()
               
        XioLayoutXio.scrollDirection = .vertical
        XioLayoutXio.minimumLineSpacing = 15 * XioHScaleXio
        
        XioGalleryFlowXio = UICollectionView(frame: .zero, collectionViewLayout: XioLayoutXio)
        XioGalleryFlowXio.backgroundColor = .clear
        XioGalleryFlowXio.delegate = self
        XioGalleryFlowXio.dataSource = self
        XioGalleryFlowXio.register(XioPartyCellXio.self, forCellWithReuseIdentifier: "XioPartyCellXio")

        
        view.backgroundColor = UIColor(white: 0.08, alpha: 1.0)
        navigationController?.isNavigationBarHidden = true
        
        view.addSubview(XioRootScrollXio)
        XioRootScrollXio.addSubview(XioContentBoxXio)
        XioRootScrollXio.translatesAutoresizingMaskIntoConstraints = false
        XioContentBoxXio.translatesAutoresizingMaskIntoConstraints = false
        
        [XioPulseSearchXio, XioNightCaptionXio, XioVintageBannerXio,
         XioStyleBannerXio, XioPartyCaptionXio, XioFilterOrbitXio, XioGalleryFlowXio].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            XioContentBoxXio.addSubview($0)
        }
        let XioTotalHeightXio = (200 * XioHScaleXio + 15 * XioHScaleXio) * CGFloat(XioMockDataXio.count)
        NSLayoutConstraint.activate([
            XioRootScrollXio.topAnchor.constraint(equalTo: view.topAnchor),
                        XioRootScrollXio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                        XioRootScrollXio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                        XioRootScrollXio.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                        
                        XioContentBoxXio.topAnchor.constraint(equalTo: XioRootScrollXio.topAnchor),
                        XioContentBoxXio.leadingAnchor.constraint(equalTo: XioRootScrollXio.leadingAnchor),
                        XioContentBoxXio.trailingAnchor.constraint(equalTo: XioRootScrollXio.trailingAnchor),
                        XioContentBoxXio.bottomAnchor.constraint(equalTo: XioRootScrollXio.bottomAnchor),
                        XioContentBoxXio.widthAnchor.constraint(equalTo: XioRootScrollXio.widthAnchor),

                        // 搜索栏约束
                        XioPulseSearchXio.topAnchor.constraint(equalTo: XioContentBoxXio.topAnchor, constant: 20 * XioHScaleXio),
                        XioPulseSearchXio.leadingAnchor.constraint(equalTo: XioContentBoxXio.leadingAnchor, constant: 15 * XioWScaleXio),
                        XioPulseSearchXio.trailingAnchor.constraint(equalTo: XioContentBoxXio.trailingAnchor, constant: -15 * XioWScaleXio),
                        XioPulseSearchXio.heightAnchor.constraint(equalToConstant: 50 * XioHScaleXio),

            XioNightCaptionXio.topAnchor.constraint(equalTo: XioPulseSearchXio.bottomAnchor, constant: 25 * XioHScaleXio),
            XioNightCaptionXio.leadingAnchor.constraint(equalTo: XioPulseSearchXio.leadingAnchor),

            XioVintageBannerXio.topAnchor.constraint(equalTo: XioNightCaptionXio.bottomAnchor, constant: 15 * XioHScaleXio),
            XioVintageBannerXio.leadingAnchor.constraint(equalTo: XioPulseSearchXio.leadingAnchor),
            XioVintageBannerXio.widthAnchor.constraint(equalTo: XioContentBoxXio.widthAnchor, multiplier: 0.44),
            XioVintageBannerXio.heightAnchor.constraint(equalToConstant: 100 * XioHScaleXio),

            XioStyleBannerXio.topAnchor.constraint(equalTo: XioVintageBannerXio.topAnchor),
            XioStyleBannerXio.trailingAnchor.constraint(equalTo: XioPulseSearchXio.trailingAnchor),
            XioStyleBannerXio.widthAnchor.constraint(equalTo: XioVintageBannerXio.widthAnchor),
            XioStyleBannerXio.heightAnchor.constraint(equalTo: XioVintageBannerXio.heightAnchor),

            XioPartyCaptionXio.topAnchor.constraint(equalTo: XioVintageBannerXio.bottomAnchor, constant: 30 * XioHScaleXio),
            XioPartyCaptionXio.leadingAnchor.constraint(equalTo: XioPulseSearchXio.leadingAnchor),

            XioFilterOrbitXio.topAnchor.constraint(equalTo: XioPartyCaptionXio.bottomAnchor, constant: 15 * XioHScaleXio),
            XioFilterOrbitXio.leadingAnchor.constraint(equalTo: XioPulseSearchXio.leadingAnchor),
            XioFilterOrbitXio.trailingAnchor.constraint(equalTo: XioPulseSearchXio.trailingAnchor),
            XioFilterOrbitXio.heightAnchor.constraint(equalToConstant: 35 * XioHScaleXio),

            XioGalleryFlowXio.topAnchor.constraint(equalTo: XioFilterOrbitXio.bottomAnchor, constant: 15),
                        XioGalleryFlowXio.leadingAnchor.constraint(equalTo: XioContentBoxXio.leadingAnchor),
                        XioGalleryFlowXio.trailingAnchor.constraint(equalTo: XioContentBoxXio.trailingAnchor),
                        
                        // 关键修正 2: 禁止 CollectionView 自身滚动，让它完全撑开
                        // 计算高度：(Cell高度 + 间距) * 数量
                       
                        XioGalleryFlowXio.heightAnchor.constraint(equalToConstant: XioTotalHeightXio),
                        
                        // 关键修正 3: ContentBox 的底部必须连接到最后一个控件
                        XioGalleryFlowXio.bottomAnchor.constraint(equalTo: XioContentBoxXio.bottomAnchor, constant: -20)
        ])
        XioGalleryFlowXio.isScrollEnabled = false
    }

    private func XioDesignStyleXio() {
    
        XioPulseSearchXio.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search for anything", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        XioPulseSearchXio.barTintColor = .clear
        XioPulseSearchXio.searchTextField.backgroundColor = UIColor(white: 0.15, alpha: 1.0)
        XioPulseSearchXio.searchTextField.textColor = .white
        XioPulseSearchXio.searchTextField.tintColor = .white
        XioPulseSearchXio.delegate = self
        
        XioNightCaptionXio.text = "For the Night"
        XioNightCaptionXio.font = .systemFont(ofSize: 18, weight: .bold)
        XioNightCaptionXio.textColor = .lightGray
        
        XioVintageBannerXio.setBackgroundImage(UIImage.init(named: "XioNightCaptionXio"), for: .normal)
        
        XioStyleBannerXio.setBackgroundImage(UIImage.init(named: "XioPartyCaptionXio"), for: .normal)
        
        XioPartyCaptionXio.text = "Retro Party"
        XioPartyCaptionXio.font = .systemFont(ofSize: 20, weight: .bold)
        XioPartyCaptionXio.textColor = .white
        
        XioFilterOrbitXio.axis = .horizontal
        XioFilterOrbitXio.spacing = 10
        XioFilterOrbitXio.distribution = .fillProportionally
        
        let categories = ["For you", "Trending", "Fairy tale", "Age"]

        categories.enumerated().forEach { index, title in
            let XioChipXio = UIButton()
            XioChipXio.setTitle(title, for: .normal)
            XioChipXio.titleLabel?.font = .systemFont(ofSize: 14)
            XioChipXio.layer.cornerRadius = 6
            XioChipXio.tag = index // 设置索引，方便后续逻辑
            
            // 初始化颜色状态
            updateButtonStyle(XioChipXio, isSelected: title == "For you")
            
            // 添加点击事件
            XioChipXio.addTarget(self, action: #selector(filterButtonTapped(_:)), for: .touchUpInside)
            
            XioFilterOrbitXio.addArrangedSubview(XioChipXio)
        }
        
       
    }
    // 统一管理按钮样式的函数
    func updateButtonStyle(_ button: UIButton, isSelected: Bool) {
        if isSelected {
            button.backgroundColor = UIColor(red: 0.7, green: 0.9, blue: 0.6, alpha: 1.0)
            button.setTitleColor(.black, for: .normal)
        } else {
            button.backgroundColor = UIColor(white: 0.15, alpha: 1.0)
            button.setTitleColor(.white, for: .normal)
        }
    }

    @objc func filterButtonTapped(_ sender: UIButton) {
        // 1. 遍历 StackView 中所有的按钮，重置为未选中状态
        XioFilterOrbitXio.arrangedSubviews.compactMap { $0 as? UIButton }.forEach { button in
            updateButtonStyle(button, isSelected: false)
        }
        
        // 2. 设置当前点击的按钮为选中状态
        updateButtonStyle(sender, isSelected: true)
        
        // 3. 刷新底部数据
        let selectedCategory = sender.title(for: .normal) ?? ""
        refreshBottomData(for: selectedCategory)
    }

    func refreshBottomData(for category: String) {
        print("当前选中的分类是：\(category)，正在刷新数据...")
        XioGalleryFlowXio.reloadData()
                
               
        // 更新高度约束
        let XioNewHeightXio = (200 * XioHScaleXio + 15 * XioHScaleXio) * CGFloat(XioMockDataXio.count)
        XioGalleryHeightAnchorXio?.constant = XioNewHeightXio
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }


    private func XioRegisterSensorsXio() {
        NotificationCenter.default.addObserver(self, selector: #selector(XioShiftForKeyboardXio), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(XioShiftForKeyboardXio), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }

        
    @objc private func XioShiftForKeyboardXio(notification: Notification) {
        guard let XioValueXio = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let XioHeightXio = XioValueXio.cgRectValue.height
        let XioDurationXio = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0.3
        
        UIView.animate(withDuration: XioDurationXio) {
            self.XioRootScrollXio.contentInset.bottom = notification.name == UIResponder.keyboardWillShowNotification ? XioHeightXio : 0
        }
    }
}
extension XioRetroLobbyXio: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return XioMockDataXio.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let XioCellXio = collectionView.dequeueReusableCell(withReuseIdentifier: "XioPartyCellXio", for: indexPath) as! XioPartyCellXio
        return XioCellXio
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 30, height: 200 * XioHScaleXio)
    }
}


