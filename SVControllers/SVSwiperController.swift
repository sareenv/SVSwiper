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
        pageControl.numberOfPages = 3
        pageControl.currentPageIndicatorTintColor = .systemRed
        pageControl.pageIndicatorTintColor = .systemGray
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    fileprivate let sliderCellid = "sliderCellid"
    private var backgroundColor: UIColor?
    private var details: [SVContent]?
    private var titleFont: UIFont?
    private var descriptionFont: UIFont?
    
    public init(backgroundColor: UIColor, details: [SVContent], titleFont: UIFont = UIFont.boldSystemFont(ofSize: 14), descriptionFont: UIFont = UIFont.systemFont(ofSize: 12)) {
        self.backgroundColor = backgroundColor
        self.details = details
        self.titleFont = titleFont
        self.descriptionFont = descriptionFont
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
    }
    
    fileprivate func setupPageControl() {
        self.collectionView?.addSubview(pageControl)
        pageControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        pageControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -16).isActive = true
    }
    
    private func collectionViewSettings() {
        self.collectionView?.isPagingEnabled = true
        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: sliderCellid)
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
//        getStartedButton.isHidden = (currentPage == 3) ? false : true
        pageControl.currentPage = currentPage
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return details?.count ?? 0
    }
    
    public override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = self.collectionView?.dequeueReusableCell(withReuseIdentifier: sliderCellid, for: indexPath)
        cell?.backgroundColor = (indexPath.item % 2 == 0) ? .white: .blue
        return cell ?? UICollectionViewCell(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

