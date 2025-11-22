//
//  SwiperDelegate.swift
//  SVSwiper
//
//  Created by Vinayak Sareen on 14/08/2019.
//

import Foundation
import UIKit

/// Delegate protocol for coordinating SVSwiper lifecycle events
/// - Important: This protocol is deprecated. Use SVSwiperCoordinatorDelegate instead
@available(*, deprecated, message: "Use SVSwiperCoordinatorDelegate for modern delegate methods")
public protocol SVSwiperDelegate: AnyObject {
    /// Called when content should be generated randomly (legacy, unused)
    func generateRadomContent() -> [Any]
    
    /// Called with the size of the slider (legacy, unused)
    func sizeForSlider(slideSize: CGSize)
    
    /// Called to determine if paging is enabled for the slider (legacy, unused)
    func isPagerEnabledForSlider(isPagerEnabled: Bool)
}

// MARK: - Modern Coordinator Delegate

/// Modern coordinator delegate for controlling onboarding flow presentation and dismissal
/// - Note: Implement this delegate for full control over navigation flow
public protocol SVSwiperCoordinatorDelegate: AnyObject {
    /// Called when the user completes the onboarding flow by tapping "Get Started"
    /// - Parameter controller: The swiper controller that completed
    func swiperDidComplete(_ controller: SVSwiperController)
    
    /// Called to determine if the onboarding should be shown
    /// - Parameter controller: The swiper controller requesting to show
    /// - Returns: true if onboarding should be presented, false otherwise
    func swiperShouldShow(_ controller: SVSwiperController) -> Bool
    
    /// Called when the user scrolls to a new page
    /// - Parameters:
    ///   - controller: The swiper controller
    ///   - page: The new page index (zero-based)
    func swiper(_ controller: SVSwiperController, didScrollToPage page: Int)
}

// MARK: - Optional Methods

public extension SVSwiperCoordinatorDelegate {
    /// Default implementation for optional scroll callback
    func swiper(_ controller: SVSwiperController, didScrollToPage page: Int) {
        // Optional - implement in conforming types if needed
    }
}
