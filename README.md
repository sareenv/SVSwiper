# SVSwiper Onboarding iOS Library
<img src="./assets/poster.png">

SVSwiper library uses core UIKit components and provides custom onBoarding screens with many customisation options. SVSwiper provides various delegate methods to customise the navigation according the needs of application. Any contributions towards this library are welcome. 

[![Version](https://img.shields.io/cocoapods/v/SVSwiper.svg?style=flat)](https://cocoapods.org/pods/SVSwiper)
[![Swift Version](https://img.shields.io/badge/Swift-5.3+-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/platform-iOS%2011.0+-blue.svg)](https://developer.apple.com/ios/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

## Features

✨ **Easy Integration** - Simple API with just a few lines of code
🎨 **Customizable** - Customize colors, fonts, and content
📱 **Modern Design** - Beautiful horizontal scrolling onboarding screens
🔒 **Type Safe** - Fully written in Swift with value types
🧪 **Tested** - Comprehensive unit test coverage
🎯 **Delegate Pattern** - Modern coordinator delegate for better control

## Requirements

- iOS 11.0+
- Swift 5.3+
- Xcode 12.0+

## Installation

### Swift Package Manager (Recommended)

SVSwiper is available through [Swift Package Manager](https://swift.org/package-manager/).

To add SVSwiper as a dependency to your Xcode project, select File > Swift Packages > Add Package Dependency and enter the repository URL:

```
https://github.com/sareenv/SVSwiper.git
```

Alternatively, you can add it to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/sareenv/SVSwiper.git", from: "2.1.0")
]
```

Then add `SVSwiper` to your target dependencies:

```swift
targets: [
    .target(
        name: "YourTarget",
        dependencies: ["SVSwiper"]
    )
]
```

### CocoaPods

SVSwiper is also available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'SVSwiper'
```

## Usage

### Basic Setup (Modern Approach - Recommended)

The modern approach uses a coordinator delegate pattern for better control over navigation:

```swift
import UIKit
import SVSwiper

class AppCoordinator: SVSwiperCoordinatorDelegate {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let onboardingController = createOnboardingController()
        
        if onboardingController.shouldShowOnboarding() {
            window.rootViewController = onboardingController
        } else {
            showMainApp()
        }
        
        window.makeKeyAndVisible()
    }
    
    private func createOnboardingController() -> SVSwiperController {
        let data: [SVContent] = [
            SVContent(
                title: "Maximise Profits",
                description: "Gain with our internal tools, we are here to support your company at every stage",
                image: UIImage(named: "onboarding1")
            ),
            SVContent(
                title: "Invest in Stocks",
                description: "We provide great insights, on which stock to buy and sell at any moment of time",
                image: UIImage(named: "onboarding2")
            ),
            SVContent(
                title: "Develop Connections",
                description: "Connect with community of experts in the field of stock market",
                image: UIImage(named: "onboarding3")
            )
        ]
        
        let controller = SVSwiperController(
            backgroundColor: .white,
            details: data,
            titleFont: .boldSystemFont(ofSize: 24),
            descriptionFont: .systemFont(ofSize: 16)
        )
        
        controller.coordinatorDelegate = self
        return controller
    }
    
    // MARK: - SVSwiperCoordinatorDelegate
    
    func swiperDidComplete(_ controller: SVSwiperController) {
        showMainApp()
    }
    
    func swiperShouldShow(_ controller: SVSwiperController) -> Bool {
        return controller.shouldShowOnboarding()
    }
    
    func swiper(_ controller: SVSwiperController, didScrollToPage page: Int) {
        print("User scrolled to page: \(page)")
    }
    
    private func showMainApp() {
        let mainViewController = MainViewController()
        window.rootViewController = UINavigationController(rootViewController: mainViewController)
    }
}
```

### In SceneDelegate or AppDelegate

```swift
// In SceneDelegate (iOS 13+)
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: windowScene)
    self.window = window
    
    let coordinator = AppCoordinator(window: window)
    coordinator.start()
}

// Or in AppDelegate (iOS 11-12)
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let window = UIWindow(frame: UIScreen.main.bounds)
    self.window = window
    
    let coordinator = AppCoordinator(window: window)
    coordinator.start()
    
    return true
}
```

### Legacy Approach (Deprecated)

The library still supports the legacy approach for backward compatibility:

```swift
import UIKit
import SVSwiper

class ViewController: UIViewController {
    
    private let data: [SVContent] = [
        SVContent(title: "Maximise Profits", description: "Gain with our internal tools", image: UIImage(named: "onboarding1")),
        SVContent(title: "Invest in Stocks", description: "We provide great insights", image: UIImage(named: "onboarding2")),
        SVContent(title: "Develop Connections", description: "Connect with community of experts", image: UIImage(named: "onboarding3"))
    ]
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupSVSwiper()
    }
    
    private func setupSVSwiper() {
        let controller = SVSwiperController(
            backgroundColor: .white,
            details: data,
            descriptionFont: .systemFont(ofSize: 13)
        )
        let parentController = MainViewController()
        controller.configureSlider(parentViewController: parentController, isNavigationSupported: true)
    }
}
```

## Customization

### SVContent

Create content for each onboarding screen:

```swift
let content = SVContent(
    title: "Your Title",
    description: "Your description text",
    image: UIImage(named: "yourImage") // Optional
)
```

### SVSwiperController

Customize the appearance:

```swift
let controller = SVSwiperController(
    backgroundColor: .systemBackground,  // Background color
    details: contentArray,                // Array of SVContent
    titleFont: .boldSystemFont(ofSize: 24),  // Title font
    descriptionFont: .systemFont(ofSize: 16)  // Description font
)
```

## Testing

To reset the onboarding status (useful for testing):

```swift
let controller = SVSwiperController(backgroundColor: .white, details: data)
controller.resetOnboardingStatus()
```

To check if onboarding should be shown:

```swift
if controller.shouldShowOnboarding() {
    // Show onboarding
} else {
    // Show main app
}
```

## Migration Guide (v2.0 → v2.1)

### Breaking Changes

1. **SVContent is now a struct** (was a class)
   - This improves thread safety and follows Swift best practices
   - No code changes required unless you were subclassing (not recommended)

2. **Property names updated**
   - `svTitle` → `title`
   - `svDescription` → `description`
   - `svImage` → `image`
   - Old property names still work but are deprecated

### Recommended Updates

1. **Use coordinator delegate pattern** instead of `configureSlider`:

```swift
// Old (still works, but deprecated)
controller.configureSlider(parentViewController: mainVC, isNavigationSupported: true)

// New (recommended)
controller.coordinatorDelegate = self
// Implement SVSwiperCoordinatorDelegate
```

2. **Update property access**:

```swift
// Old
let content = SVContent(title: "Title", description: "Desc")
print(content.svTitle)

// New
let content = SVContent(title: "Title", description: "Desc")
print(content.title)
```

## API Documentation

### SVSwiperController

#### Properties
- `coordinatorDelegate: SVSwiperCoordinatorDelegate?` - Delegate for lifecycle events

#### Methods
- `shouldShowOnboarding() -> Bool` - Check if onboarding should be shown
- `markOnboardingCompleted()` - Mark onboarding as completed
- `resetOnboardingStatus()` - Reset completion status (for testing)
- `configureSlider(parentViewController:isNavigationSupported:)` - Legacy configuration method (deprecated)

### SVSwiperCoordinatorDelegate

#### Required Methods
- `swiperDidComplete(_ controller: SVSwiperController)` - Called when onboarding completes
- `swiperShouldShow(_ controller: SVSwiperController) -> Bool` - Determine if onboarding should show

#### Optional Methods
- `swiper(_ controller: SVSwiperController, didScrollToPage page: Int)` - Called on page changes

### SVContent

#### Properties
- `title: String` - The title text
- `description: String` - The description text
- `image: UIImage?` - Optional image

## Example Project

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Author

Vinayak Sareen is the author for this repository. If you have any suggestion / recommendations please feel free to contact me at contact@sareenv.com

## License

SVSwiper is available under the MIT license. See the LICENSE file for more info.

Copyright (c) 2019 Vinayak Sareen <contact@sareenv.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
