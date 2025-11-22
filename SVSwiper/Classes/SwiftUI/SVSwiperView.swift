//
//  SVSwiperView.swift
//  SVSwiper
//
//  Created by Vinayak Sareen
//

import SwiftUI

/// A SwiftUI wrapper for the SVSwiper onboarding experience
/// - Note: This provides a declarative SwiftUI interface for the onboarding flow
@available(iOS 13.0, *)
public struct SVSwiperView: View {
    
    // MARK: - Properties
    
    private let backgroundColor: Color
    private let details: [SVContent]
    private let titleFont: Font
    private let descriptionFont: Font
    private let onComplete: () -> Void
    
    @State private var currentPage: Int = 0
    @State private var isCompleted: Bool = false
    
    // MARK: - Initialization
    
    /// Creates a new SwiftUI onboarding view
    /// - Parameters:
    ///   - backgroundColor: The background color for all screens
    ///   - details: Array of SVContent items representing each onboarding screen
    ///   - titleFont: Font for titles (default: bold system font size 24)
    ///   - descriptionFont: Font for descriptions (default: system font size 16)
    ///   - onComplete: Closure called when onboarding is completed
    public init(
        backgroundColor: Color = .white,
        details: [SVContent],
        titleFont: Font = .system(size: 24, weight: .bold),
        descriptionFont: Font = .system(size: 16),
        onComplete: @escaping () -> Void
    ) {
        self.backgroundColor = backgroundColor
        self.details = details
        self.titleFont = titleFont
        self.descriptionFont = descriptionFont
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
                        Text("Get Started")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.purple)
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
        SVSwiperView(
            backgroundColor: .white,
            details: [
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
            ],
            onComplete: {
                print("Onboarding completed!")
            }
        )
    }
}
