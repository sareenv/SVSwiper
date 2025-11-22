//
//  SVSwiperView.swift
//  SVSwiper
//
//  Created by Vinayak Sareen
//

import SwiftUI

/// A result builder for constructing SVContent arrays declaratively
@available(iOS 13.0, *)
@resultBuilder
public struct SVContentBuilder {
    public static func buildBlock(_ components: SVContent...) -> [SVContent] {
        components
    }
    
    public static func buildArray(_ components: [[SVContent]]) -> [SVContent] {
        components.flatMap { $0 }
    }
    
    public static func buildOptional(_ component: [SVContent]?) -> [SVContent] {
        component ?? []
    }
    
    public static func buildEither(first component: [SVContent]) -> [SVContent] {
        component
    }
    
    public static func buildEither(second component: [SVContent]) -> [SVContent] {
        component
    }
}

/// A SwiftUI wrapper for the SVSwiper onboarding experience
/// - Note: This provides a declarative SwiftUI interface for the onboarding flow
@available(iOS 13.0, *)
public struct SVSwiperView: View {
    
    // MARK: - Properties
    
    private let backgroundColor: Color
    private let details: [SVContent]
    private let titleFont: Font
    private let descriptionFont: Font
    private let buttonColor: Color
    private let buttonTitle: String
    private let onComplete: () -> Void
    
    @State private var currentPage: Int = 0
    @State private var isCompleted: Bool = false
    
    // MARK: - Initialization
    
    /// Creates a new SwiftUI onboarding view with array of content
    /// - Parameters:
    ///   - details: Array of SVContent items representing each onboarding screen
    ///   - backgroundColor: The background color for all screens (default: white)
    ///   - titleFont: Font for titles (default: bold system font size 24)
    ///   - descriptionFont: Font for descriptions (default: system font size 16)
    ///   - buttonColor: Color for the completion button (default: purple)
    ///   - buttonTitle: Title for the completion button (default: "Get Started")
    ///   - onComplete: Closure called when onboarding is completed
    public init(
        _ details: [SVContent],
        backgroundColor: Color = .white,
        titleFont: Font = .system(size: 24, weight: .bold),
        descriptionFont: Font = .system(size: 16),
        buttonColor: Color = Color(red: 0.5, green: 0.0, blue: 0.5),
        buttonTitle: String = "Get Started",
        onComplete: @escaping () -> Void = {}
    ) {
        self.backgroundColor = backgroundColor
        self.details = details
        self.titleFont = titleFont
        self.descriptionFont = descriptionFont
        self.buttonColor = buttonColor
        self.buttonTitle = buttonTitle
        self.onComplete = onComplete
    }
    
    /// Creates a new SwiftUI onboarding view using result builder
    /// - Parameters:
    ///   - backgroundColor: The background color for all screens (default: white)
    ///   - titleFont: Font for titles (default: bold system font size 24)
    ///   - descriptionFont: Font for descriptions (default: system font size 16)
    ///   - buttonColor: Color for the completion button (default: purple)
    ///   - buttonTitle: Title for the completion button (default: "Get Started")
    ///   - onComplete: Closure called when onboarding is completed
    ///   - content: Result builder closure for constructing content
    public init(
        backgroundColor: Color = .white,
        titleFont: Font = .system(size: 24, weight: .bold),
        descriptionFont: Font = .system(size: 16),
        buttonColor: Color = Color(red: 0.5, green: 0.0, blue: 0.5),
        buttonTitle: String = "Get Started",
        onComplete: @escaping () -> Void = {},
        @SVContentBuilder content: () -> [SVContent]
    ) {
        self.backgroundColor = backgroundColor
        self.details = content()
        self.titleFont = titleFont
        self.descriptionFont = descriptionFont
        self.buttonColor = buttonColor
        self.buttonTitle = buttonTitle
        self.onComplete = onComplete
    }
    
    // MARK: - Body
    
    public var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            VStack {
                // Content TabView
                TabView(selection: $currentPage) {
                    ForEach(details.indices, id: \.self) { index in
                        SVContentView(
                            content: details[index],
                            titleFont: titleFont,
                            descriptionFont: descriptionFont
                        )
                        .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                
                // Get Started Button (shown on last page)
                if currentPage == details.count - 1 {
                    Button(action: handleComplete) {
                        Text(buttonTitle)
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(buttonColor)
                            .cornerRadius(5)
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 60)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
        }
    }
    
    // MARK: - Actions
    
    private func handleComplete() {
        // Mark as completed in UserDefaults
        UserDefaults.standard.set(true, forKey: "isOpenedBefore")
        isCompleted = true
        onComplete()
    }
}

// MARK: - Content View

/// Individual content view for each onboarding screen
@available(iOS 13.0, *)
struct SVContentView: View {
    let content: SVContent
    let titleFont: Font
    let descriptionFont: Font
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            
            // Image
            if let image = content.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
            }
            
            // Title
            Text(content.title)
                .font(titleFont)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            // Description
            Text(content.description)
                .font(descriptionFont)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            Spacer()
        }
    }
}

// MARK: - Preview

@available(iOS 13.0, *)
struct SVSwiperView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // Simple array syntax
            SVSwiperView([
                SVContent(
                    title: "Welcome",
                    description: "Get started with our amazing app",
                    image: nil
                ),
                SVContent(
                    title: "Discover",
                    description: "Explore all the features we have to offer",
                    image: nil
                ),
                SVContent(
                    title: "Get Started",
                    description: "You're all set! Let's begin",
                    image: nil
                )
            ])
            .previewDisplayName("Array Syntax")
            
            // Result builder syntax
            SVSwiperView {
                SVContent(
                    title: "Welcome",
                    description: "Get started with our amazing app",
                    image: nil
                )
                SVContent(
                    title: "Discover",
                    description: "Explore all the features we have to offer",
                    image: nil
                )
                SVContent(
                    title: "Get Started",
                    description: "You're all set! Let's begin",
                    image: nil
                )
            }
            .previewDisplayName("Result Builder Syntax")
        }
    }
}
