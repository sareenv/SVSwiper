//
//  SVSwiperCustomCell.swift
//  Pods
//
//  Created by Vinayak Sareen on 14/08/2019.
//

import UIKit

class SVSwiperCustomCell: UICollectionViewCell{
    
    var viewController: UIViewController?{
        didSet{
            setupViewControllers()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewControllers()
    }
    
    
    fileprivate func setupViewControllers(){
        guard let viewController = viewController else { return }
        guard let childView = viewController.view else { return }
        self.addSubview(childView)
        if #available(iOS 9.0, *) {
            childView.svFillSuperView(top: 5)
        }
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

