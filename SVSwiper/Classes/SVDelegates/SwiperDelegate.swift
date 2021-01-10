//
//  SwiperDelegate.swift
//  Pods
//
//  Created by Vinayak Sareen on 14/08/2019.
//

import Foundation

@objc public protocol SVSwiperDelegate {
    @objc optional func generateRadomContent() -> [SVContent]
    @objc optional func sizeForSlider(slideSize: CGSize)
    func isPagerEnabledForSlider(isPagerEnabled: Bool)
}
