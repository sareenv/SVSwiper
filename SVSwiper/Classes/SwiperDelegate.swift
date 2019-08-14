//
//  SwiperDelegate.swift
//  Pods
//
//  Created by Vinayak Sareen on 14/08/2019.
//

import Foundation

@objc public protocol SVSwiperDelegate {
    func titles() -> [String]
    func barColor() -> UIColor
    func textColor() -> UIColor
    func sizeForTitleBar() -> CGSize
    @objc optional func titleTextColor() -> UIColor
}
