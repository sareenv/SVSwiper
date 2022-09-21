# SVSwiper Onboarding iOS Library
<img src="./assets/poster.png">
SVSwiper library uses core UIKit components and provides custom onBoarding screens with many customisation options. SVSwiper provides various delegate methods to customise the navigation according the needs of application. Any contributions towards this library are welcome. 

[![Version](https://img.shields.io/cocoapods/v/SVSwiper.svg?style=flat)](https://cocoapods.org/pods/SVSwiper)


## Installation

SVSwiper is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SVSwiper'
```


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```
import UIKit
import SVSwiper

class ViewController: UIViewController {
    
    private let data: [SVContent] = [
        .init(title: "Maximise Profits", description: "Gain with our internal tools, we are here to support your company at every stage", image: #imageLiteral(resourceName: "2")),
        .init(title: "Invest in Stocks", description: "We provide great insights, on which stock to buy and sell at any moment of time", image: #imageLiteral(resourceName: "3")),
        .init(title: "Develop Connections" , description: "Conntect with community of experts in the field of stock market", image: #imageLiteral(resourceName: "2")),
        .init(title: "Develop Connections" , description: "Conntect with community of experts in the field of stock market", image: #imageLiteral(resourceName: "3")) ]
        
    fileprivate func setupSVSwiper() {
        let controller = SVSwiperController(backgroundColor: .white, details: data, descriptionFont: .systemFont(ofSize: 13))
        let parentController: UIViewController = FirstController()
        controller.configureSlider(parentViewController: parentController, isNavigationSupported: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupSVSwiper()
    }
}

```

## Author
Vinayak Sareen is the author for this repository, If you have any suggestion / recommendations please feel free to contact me at contact@sareenv.com

## License
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
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

