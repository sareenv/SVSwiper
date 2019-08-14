//
//  ViewController.swift
//  SVSwiper
//
//  Created by buggyman026@gmail.com on 08/14/2019.
//  Copyright (c) 2019 buggyman026@gmail.com. All rights reserved.
//

import UIKit
import SVSwiper

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setupSVSwiperController()
    }
    
    
    fileprivate func setupSVSwiperController(){
        let viewControllers = [FirstController(), SecondController(), ThirdController()]
        let controller = SVSwiperController(viewControllers: viewControllers)
        controller.delegate = self
        self.addChildViewController(controller)
        guard let cview = controller.view else { return }
        view.addSubview(cview)
        cview.svFillSuperView()
    }
    
}

extension ViewController: SVSwiperDelegate{

    func sizeForTitleBar() -> CGSize {
        return .init(width: self.view.frame.width, height: 69)
    }

    func titles() -> [String] {
        return ["Home", "Subscribers", "Favourite"]
    }
    
    func barColor() -> UIColor {
        return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func textColor() -> UIColor {
        return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    func titleTextColor() -> UIColor {
        return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }
    
}





