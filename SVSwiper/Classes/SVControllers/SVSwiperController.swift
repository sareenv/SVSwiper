//
//  SVSwiperController.swift
//  Pods
//
//  Created by Vinayak Sareen on 14/08/2019.
//

import UIKit

public class SVSwiperController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = details?.count ?? 0
        pageControl.currentPageIndicatorTintColor = .systemPurple
        pageControl.pageIndicatorTintColor = .systemGray
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    lazy var welcomeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get Started", for: .normal)
        button.backgroundColor = .systemPurple
        button.setTitleColor(.white, for: .normal)
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    fileprivate let sliderCellid = "sliderCellid"
    private var backgroundColor: UIColor?
    private var details: [SVContent]?
    private var titleFont: UIFont?
    private var descriptionFont: UIFont?
    private var titles: [String]?
    private var descriptions: [String]?
    private var images: [UIImage]?
    
    
    public init(backgroundColor: UIColor, details: [SVContent], titleFont: UIFont = UIFont.boldSystemFont(ofSize: 14), descriptionFont: UIFont = UIFont.systemFont(ofSize: 12)) {
        self.backgroundColor = backgroundColor
        self.details = details
        self.titleFont = titleFont
        self.descriptionFont = descriptionFont
        self.titles = details.compactMap { (detail) in return detail.svTitle }
        self.descriptions = details.compactMap { (detail) in return detail.svDescription }
        self.images = details.compactMap({ (detail) in return detail.svImage })
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        showButton(frontParentController: UIViewController())
    }
    
    var parentController: UIViewController? = nil
    var isNavigationSupported: Bool? = nil
    
    @objc func setupWelcomeScreen() {
        UserDefaults.standard.set(true, forKey: "isOpenedBefore")
        if let parentController = parentController {
            self.configureSlider(parentViewController: parentController, isNavigationSupported: isNavigationSupported)
        }
    }
    
    fileprivate func showButton(frontParentController: UIViewController) {
        if let collectionView = self.collectionView  {
            collectionView.addSubview(welcomeButton)
            welcomeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
            welcomeButton.svAnchor(topAnchor: nil, bottomAnchor: self.view.bottomAnchor, leadingAnchor: self.view.leadingAnchor, trailingAnchor: self.view.trailingAnchor, padding: .init(top: 0, left: 10, bottom: -60, right: -10))
            welcomeButton.addTarget(self, action: #selector(setupWelcomeScreen), for: .touchUpInside)
        }
        
    }
    
    public func configureSlider(parentViewController: UIViewController, isNavigationSupported: Bool?) {
        if(self.parentController == nil) { self.parentController = parentViewController }
        self.isNavigationSupported = isNavigationSupported
        let openedFlag = UserDefaults.standard.bool(forKey: "isOpenedBefore")
        if (openedFlag == false) {
            UIApplication.shared.windows.first?.rootViewController = self
            UIApplication.shared.windows.first?.makeKeyAndVisible()
            return
        } else {
            UIApplication.shared.windows.first?.rootViewController?.removeFromParentViewController()
            if let isNavigationSupported = isNavigationSupported {
                if(isNavigationSupported == true) {
                    UIApplication.shared.windows.first?.rootViewController =
                    UINavigationController(rootViewController: parentViewController)
                    UIApplication.shared.windows.first?.makeKeyAndVisible()
                    return
                }
            } else {
                UIApplication.shared.windows.first?.rootViewController =
                parentViewController
                UIApplication.shared.windows.first?.makeKeyAndVisible()
            }
        }
    }
    
    fileprivate func setupPageControl() {
        self.collectionView?.addSubview(pageControl)
        pageControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        pageControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -16).isActive = true
    }
    
    private func collectionViewSettings() {
        self.collectionView?.isPagingEnabled = true
        self.collectionView?.register(SVSliderCell.self, forCellWithReuseIdentifier: sliderCellid)
        self.collectionView?.showsHorizontalScrollIndicator = false
        self.collectionView?.backgroundColor = self.backgroundColor
        setupPageControl()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSettings()
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        return size
    }
    
    public override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2
        let currentPage = Int(offSet + horizontalCenter) / Int(width)
        pageControl.currentPage = currentPage
        if let count = details?.count {
            let countIndex = count - 1
            if(currentPage == countIndex) {
                welcomeButton.isHidden = false
                welcomeButton.isUserInteractionEnabled = true
            } else {
                welcomeButton.isHidden = true
                welcomeButton.isUserInteractionEnabled = false
            }
        }
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return details?.count ?? 0
    }
    
    public override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = self.collectionView?.dequeueReusableCell(withReuseIdentifier: sliderCellid, for: indexPath) as? SVSliderCell
        cell?.backgroundColor = self.backgroundColor
        cell?.contentTitle = self.titles?[indexPath.item]
        cell?.contentDescription = self.descriptions?[indexPath.item]
        cell?.sliderImage = self.images?[indexPath.item]
        return cell ?? UICollectionViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


