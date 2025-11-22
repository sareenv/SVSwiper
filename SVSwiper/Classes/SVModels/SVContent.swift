//
//  SVContent.swift
//  SVSwiper
//
//  Created by Vinayak Sareen on 14/08/2019.
//

import UIKit

/// A model representing a single onboarding screen content with title, description, and optional image.
/// - Note: Use this struct to create content for each slide in the onboarding flow.
public struct SVContent {
    /// The title text displayed on the onboarding screen
    public let title: String
    
    /// The description text displayed below the title
    public let description: String
    
    /// Optional image displayed above the title
    public let image: UIImage?
    
    /// Creates a new onboarding content item
    /// - Parameters:
    ///   - title: The title text for the screen
    ///   - description: The description text for the screen
    ///   - image: Optional image to display. Defaults to nil.
    public init(title: String, description: String, image: UIImage? = nil) {
        self.title = title
        self.description = description
        self.image = image
    }
}

// MARK: - Backward Compatibility

/// Provides backward compatibility with the old class-based API
@available(*, deprecated, message: "Use SVContent struct properties directly (title, description, image)")
public extension SVContent {
    /// Legacy property name for title
    var svTitle: String { title }
    
    /// Legacy property name for description
    var svDescription: String { description }
    
    /// Legacy property name for image
    var svImage: UIImage? { image }
}
