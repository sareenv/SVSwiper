# SVSwiper

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setupSVSwiperController()
    }
    
    
    fileprivate func setupSVSwiperController(){
        let viewControllers = [FirstController(), SecondController(), ThirdController()]
        let controller = SVSwiperController(viewControllers: viewControllers)
        controller.delegate = self
        self.addChildViewController(controller)
        guard let cview = controller.view else { return }
        view.addSubview(cview)
        cview.svFillSuperView()
    }
    
}

extension ViewController: SVSwiperDelegate{

    func sizeForTitleBar() -> CGSize {
        return .init(width: self.view.frame.width, height: 69)
    }

    func titles() -> [String] {
        return ["Home", "Subscribers", "Favourite"]
    }
    
    func barColor() -> UIColor {
        return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func textColor() -> UIColor {
        return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    func titleTextColor() -> UIColor {
        return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }
    
}

```



## Author

Vinayak is the author for this repository, If you have any suggestion / recommendations please feel free. sareenv026@outlook.com is my email. 

## License


Copyright (c) 2019 Vinayak <sareenv026@outlook.com>

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

