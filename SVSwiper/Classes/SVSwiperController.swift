//
//  SVSwiperController.swift
//  Pods
//
//  Created by Vinayak Sareen on 14/08/2019.
//

import UIKit

public class SVSwiperController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    
    fileprivate let cellId = "cellId"
    
    public var delegate: SVSwiperDelegate?{
        didSet{
            selectedIndex = 0
            headerCell.backgroundColor = delegate?.barColor()
            menuBarSize = delegate?.sizeForTitleBar()
            collectionView?.reloadData()
        }
    }
    
    var viewControllers: [UIViewController]?{
        didSet{
            collectionView?.reloadData()
        }
    }
    
    
    // Elements
    let headerCell: UIView = {
        let view = UIView()
        return view
    }()
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 9.0, *) {
            collectionViewSettings()
            addStackView()
        }
        headerCellSetup()
        setupLineBar()
    }
    
    
    var generatedLabels: [UIView]?
    
    var selectedIndex: Int? = 0{
        didSet{
            setupLineBar()
        }
    }
    
    
    fileprivate func setupLineBar(){
        guard let generatedLabels = generatedLabels as? [UILabel] else { return }
        guard let selectedIndex = selectedIndex else { return }
        for label in generatedLabels{
            if (label != generatedLabels[selectedIndex]){
                label.font = UIFont.systemFont(ofSize: 20)
                label.textColor = labelColor
            }
        }
        generatedLabels[selectedIndex].font = UIFont.boldSystemFont(ofSize: 22)
        generatedLabels[selectedIndex].textColor = titleLabelColor
    }
    
    var menuBarSize: CGSize?
    
    fileprivate func headerCellSetup(){
        view.addSubview(headerCell)

        if #available(iOS 9.0, *) {
            headerCell.svAnchor(topAnchor: view.topAnchor, bottomAnchor: view.bottomAnchor, leadingAnchor: view.leadingAnchor, trailingAnchor: view.trailingAnchor)
            headerCell.widthAnchor.constraint(equalToConstant: menuBarSize?.width ?? view?.frame.width ?? 0).isActive = true
            headerCell.heightAnchor.constraint(equalToConstant: menuBarSize?.height ?? 0).isActive = true // change this
        }
    }
    
    
    
    fileprivate func generateLabels(titles: [String], color: UIColor) -> [UIView]{
        var labels: [UILabel] = [UILabel]()
        for title in titles{
            let label = UILabel()
            label.text = title
            label.textColor = labelColor
            labels.append(label)
        }
        return labels
    }
    
    var labelColor: UIColor?
    var titleLabelColor: UIColor?
    
    
    @available(iOS 9.0, *)
    fileprivate func addStackView(){
        guard let titles = delegate?.titles() else { return }
        let labelColor = delegate?.textColor() ?? UIColor.black
        let titleLabelColor = delegate?.titleTextColor?() ?? UIColor.white
        self.titleLabelColor = titleLabelColor
        self.labelColor = labelColor
        generatedLabels = generateLabels(titles: titles, color: labelColor)
        guard let generatedLabels = generatedLabels else { return }
        let stackView = UIStackView(arrangedSubviews: generatedLabels)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 0, left: 7, bottom: 0, right: 7)
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.axis = .horizontal
        self.headerCell.addSubview(stackView)
        stackView.svFillSuperView()
    }
    
    
    @available(iOS 9.0, *)
    fileprivate func collectionViewSettings(){
        guard let collectionView = collectionView else { return }
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else { return }
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        collectionView.register(SVSwiperCustomCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        layout.sectionHeadersPinToVisibleBounds = true
        layout.scrollDirection = .horizontal
        layout.sectionHeadersPinToVisibleBounds = true
     
    }
    
    override public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let value = viewControllers?.count ?? 0
        return value
    }
    
    
    
    override public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SVSwiperCustomCell
    
        if let viewControllers = viewControllers{
            cell.viewController = viewControllers[indexPath.item]
        }
        
        return cell
    }
    
    override public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard let collectionView = collectionView else { return }
        let visibleIndex = Int(targetContentOffset.pointee.x / collectionView.frame.width)
        selectedIndex = visibleIndex
    }
    
    
    
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: self.view.frame.width, height: self.view.frame.height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public init(viewControllers: [UIViewController]) {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        self.viewControllers = viewControllers
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

