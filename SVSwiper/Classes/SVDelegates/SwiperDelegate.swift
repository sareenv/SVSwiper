//
//  SwiperDelegate.swift
//  Pods
//
//  Created by Vinayak Sareen on 14/08/2019.
//

import Foundation

@objc public protocol SVSwiperDelegate: AnyObject {
    @objc optional func generateRadomContent() -> [SVContent]
    @objc optional func sizeForSlider(slideSize: CGSize)
    @objc optional func isPagerEnabledForSlider(isPagerEnabled: Bool)
    @objc optional func backgroundColorForSwiper() -> UIColor
}
