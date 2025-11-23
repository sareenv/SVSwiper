# Changelog

All notable changes to the SVSwiper project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2.1.2] - 2025-11-23

### 🎨 Enhancements

#### Comprehensive UI Customization
- **Added** Full button customization options:
  - `buttonBackgroundColor: UIColor` - Customize button background color
  - `buttonTextColor: UIColor` - Customize button text color
  - `buttonFont: UIFont` - Customize button font
  - `buttonTitle: String` - Customize button title text
  - `buttonCornerRadius: CGFloat` - Customize button corner radius
- **Added** Page control customization:
  - `currentPageIndicatorColor: UIColor` - Customize active page indicator color
  - `pageIndicatorColor: UIColor` - Customize inactive page indicator colors
- **Added** Text color customization:
  - `titleColor: UIColor` - Customize title text color
  - `descriptionColor: UIColor` - Customize description text color

#### SVSliderCell Enhancements
- **Added** Public properties for text styling (font and color)
- **Updated** Labels to respect custom styling passed from controller
- **Maintained** Backward compatibility with default values

### 🔧 Improvements

- **Enhanced** API design with comprehensive initializer
- **Preserved** Backward compatibility via convenience initializer
- **Enabled** Full brand customization for design systems
- **Improved** Developer experience with more control over UI elements

### 💡 Use Cases

This release enables apps to fully match onboarding to their brand guidelines:

```swift
let controller = SVSwiperController(
    backgroundColor: AppColors.backgroundPrimary,
    details: content,
    titleFont: Typography.featured,
    descriptionFont: Typography.contentPrimary,
    titleColor: AppColors.textPrimary,
    descriptionColor: AppColors.textSecondary,
    buttonBackgroundColor: AppColors.accent,
    buttonTextColor: AppColors.textOnPrimary,
    buttonFont: Typography.buttonLarge,
    buttonTitle: "Let's Begin",
    buttonCornerRadius: 12,
    currentPageIndicatorColor: AppColors.primary,
    pageIndicatorColor: AppColors.textTertiary
)
```

### 📋 Benefits

1. **Full Brand Control** - Match onboarding to your design system
2. **Zero Breaking Changes** - Existing code works without modifications
3. **Better DX** - No need to fork/modify the library
4. **Consistency** - Single source of truth for all styling
5. **Professional** - Maintain consistent branding throughout

### 🔗 Related Issues

- Closes #8 - Feature Request: Enhanced UI Customization Options

---

## [2.1.1] - 2025-11-22

### � Improvements

#### iOS 14 Minimum Version
- **Changed** Minimum iOS deployment target from 13.0 to 14.0
- **Fixed** SwiftUI API compatibility issues (ignoresSafeArea, tabViewStyle, indexViewStyle)
- **Added** Build script (`build.sh`) for easy Swift Package Manager builds
- **Updated** Package.swift to reflect iOS 14.0 minimum requirement
- **Updated** Podspec to iOS 14.0 deployment target
- **Rationale**: SwiftUI components require iOS 14+ APIs for proper functionality

#### Developer Experience
- **Added** Simple build script for command-line builds
- **Improved** Build instructions for iOS targets
- **Improved** Swift Package Manager integration

### Migration Notes
- Projects targeting iOS 13 should remain on version 2.1.0
- No code changes required for apps already targeting iOS 14+
- All SwiftUI features now work without availability issues

## [2.1.0] - 2025-11-22

#### Minimum iOS Version
- **Changed** Minimum iOS deployment target from 11.0 to 13.0
- **Removed** iOS 11 and iOS 12 compatibility code
- **Removed** Unnecessary `@available(iOS 13.0, *)` checks as 13.0 is now the minimum
- **Updated** All project files, documentation, and examples to reflect iOS 13.0 minimum
- **Rationale**: iOS 13 brings significant improvements including full SwiftUI support, better system APIs, and allows for a cleaner, more modern codebase

#### Migration Notes
- Projects targeting iOS 11 or 12 should remain on version 2.1.0
- No code changes required for apps already targeting iOS 13+
- All SwiftUI features now work without availability checks

## [2.1.0] - 2025-11-22

### 🎉 Major Additions

#### SwiftUI Support
- **Added** Native SwiftUI `SVSwiperView` component for iOS 13+
- **Added** SwiftUI result builder (`@SVContentBuilder`) for declarative content construction
- **Added** Multiple initialization options for SwiftUI views (array-based and result builder)
- **Added** Full customization support in SwiftUI (colors, fonts, button text)
- **Added** SwiftUI-native completion callbacks with proper state management
- **Added** SwiftUI preview providers for development convenience

#### Modern Coordinator Pattern
- **Added** `SVSwiperCoordinatorDelegate` protocol for modern navigation control
- **Added** Coordinator pattern examples demonstrating separation of concerns
- **Added** Optional `didScrollToPage` delegate method for tracking user progress
- **Added** `swiperShouldShow` delegate method for conditional onboarding display
- **Added** Better memory management with weak delegate references

#### Privacy & Compliance
- **Added** `PrivacyInfo.xcprivacy` manifest file for App Store compliance
- **Added** Documentation for NSPrivacyAccessedAPITypes (UserDefaults usage)
- **Added** Declared UserDefaults access reason (CA92.1 - user preferences)
- **Added** Full compliance with iOS 17+ privacy requirements

### 📚 Documentation & Examples

#### New Example Files
- **Added** `SwiftUIExampleView.swift` - Comprehensive SwiftUI integration examples
- **Added** `ModernUIKitExample.swift` - Modern coordinator pattern examples
- **Added** `LegacyUIKitExample.swift` - Backward compatibility examples with migration notes
- **Added** `Example/README.md` - Detailed examples documentation with usage patterns

#### Enhanced Documentation
- **Updated** Main README with SwiftUI examples and modern patterns
- **Added** Migration guide from v2.0 to v2.1
- **Added** API documentation for all new components
- **Added** Troubleshooting section in examples
- **Added** Code examples for common use cases
- **Added** Tips and best practices section

### 🐛 Bug Fixes

#### Critical Fixes
- **Fixed** Protocol definition issues with `@objc optional` methods
- **Fixed** `SVSwiperCoordinatorDelegate` now properly marked as `@objc` protocol
- **Fixed** Removed incorrect `removeFromParent()` call on root view controller
- **Fixed** Legacy `SVSwiperDelegate` protocol compatibility with Swift structs
- **Fixed** Build errors when compiling for iOS simulator
- **Fixed** Memory leaks in legacy window manipulation code

#### Compatibility Fixes
- **Fixed** Swift Package Manager build issues on macOS
- **Fixed** Module import errors in Xcode 15+
- **Fixed** Compatibility with iOS 11.0 deployment target
- **Fixed** Thread safety issues with coordinator delegates

### 🔧 Improvements

#### Code Quality
- **Improved** Type safety throughout the codebase
- **Improved** Protocol design for better Swift interoperability
- **Improved** Memory management with proper weak references
- **Improved** Error handling and edge case management
- **Improved** Code organization and file structure

#### API Design
- **Improved** Delegate pattern design for modern iOS architectures
- **Improved** Method naming for better Swift API guidelines compliance
- **Improved** Parameter ordering for consistency
- **Improved** Default parameter values for common use cases

#### Developer Experience
- **Improved** Code completion and inline documentation
- **Improved** Xcode integration with better error messages
- **Improved** Example project organization
- **Improved** Build times with optimized compilation

### 📝 Deprecations

- **Deprecated** `configureSlider(parentViewController:isNavigationSupported:)` method
  - Use `coordinatorDelegate` property with `SVSwiperCoordinatorDelegate` instead
  - Legacy method still available for backward compatibility
- **Deprecated** Legacy `SVSwiperDelegate` protocol
  - Use `SVSwiperCoordinatorDelegate` for new implementations
  - Old delegate maintained for existing code

### ⚠️ Breaking Changes

**Note:** These changes maintain backward compatibility with fallback support

- `SVContent` properties now use cleaner names:
  - `svTitle` → `title` (old name still works via deprecated property)
  - `svDescription` → `description` (old name still works via deprecated property)
  - `svImage` → `image` (old name still works via deprecated property)

### 🏗️ Infrastructure

- **Added** Comprehensive unit tests for new components
- **Added** SwiftUI preview support for development
- **Added** Improved build configurations
- **Added** Better documentation generation support
- **Updated** Package.swift with proper iOS version constraints
- **Updated** Project structure for better maintainability

---

## [2.0.1] - Previous Release

### Fixed
- Minor bug fixes and stability improvements
- Documentation updates
- CocoaPods integration improvements

### Changed
- Updated Swift version compatibility
- Improved error handling

---

## [2.0.0] - Previous Major Release

### Added
- Swift 5.0+ support
- Modern Swift API design
- Value types (structs) for content models
- Improved type safety

### Changed
- Converted `SVContent` from class to struct
- Updated minimum iOS version to 11.0
- Modernized codebase with Swift best practices

### Removed
- Support for iOS 10 and earlier
- Deprecated Objective-C compatibility layer

---

## [1.x.x] - Legacy Releases

Previous versions focused on basic onboarding functionality with UIKit support.

---

## Migration Guides

### Migrating to 2.1.2

#### Using Enhanced Customization

Version 2.1.2 introduces comprehensive UI customization options. You can now fully match the onboarding experience to your brand:

```swift
// Simple usage (backward compatible)
let controller = SVSwiperController(
    backgroundColor: .white,
    details: data
)

// Full customization (new in 2.1.2)
let controller = SVSwiperController(
    backgroundColor: AppColors.backgroundPrimary,
    details: data,
    titleFont: Typography.featured,
    descriptionFont: Typography.contentPrimary,
    titleColor: AppColors.textPrimary,
    descriptionColor: AppColors.textSecondary,
    buttonBackgroundColor: AppColors.accent,
    buttonTextColor: AppColors.textOnPrimary,
    buttonFont: Typography.buttonLarge,
    buttonTitle: "Let's Begin",
    buttonCornerRadius: 12,
    currentPageIndicatorColor: AppColors.primary,
    pageIndicatorColor: AppColors.textTertiary
)
```

### Migrating to 2.1.0

#### From Legacy Window Manipulation
```swift
// Before (v2.0.x)
let controller = SVSwiperController(backgroundColor: .white, details: data)
let parentController = MainViewController()
controller.configureSlider(parentViewController: parentController, isNavigationSupported: true)

// After (v2.1.0)
let controller = SVSwiperController(backgroundColor: .white, details: data)
controller.coordinatorDelegate = self
present(controller, animated: true)

// Implement delegate
extension YourViewController: SVSwiperCoordinatorDelegate {
    func swiperDidComplete(_ controller: SVSwiperController) {
        controller.dismiss(animated: true)
    }
    
    func swiperShouldShow(_ controller: SVSwiperController) -> Bool {
        return controller.shouldShowOnboarding()
    }
}
```

#### Adopting SwiftUI (New in 2.1.0)
```swift
// Simple array syntax
SVSwiperView(contents) {
    showOnboarding = false
}

// Or result builder syntax
SVSwiperView {
    SVContent(title: "Welcome", description: "Get started", image: nil)
    SVContent(title: "Explore", description: "Discover features", image: nil)
} onComplete: {
    showOnboarding = false
}
```

### Benefits of Upgrading

1. **Better Architecture**: Modern coordinator pattern for cleaner separation of concerns
2. **SwiftUI Support**: Native SwiftUI integration with result builders
3. **Privacy Compliance**: Built-in privacy manifest for App Store requirements
4. **Type Safety**: Improved protocols and delegate patterns
5. **Memory Management**: Proper weak references and lifecycle management
6. **Developer Experience**: Better documentation, examples, and error messages
7. **Full Customization**: Complete control over UI styling (v2.1.2+)

---

## Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

## Support

For issues, questions, or suggestions:
- Open an issue on [GitHub](https://github.com/sareenv/SVSwiper/issues)
- Email: contact@sareenv.com

---

## License

SVSwiper is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

---

**Note**: This changelog is maintained starting from version 2.1.0. Earlier version history is available in git commit logs.
