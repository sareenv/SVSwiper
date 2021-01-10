
import UIKit
import SVSwiper

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let controller = SVSwiperController(backgroundColor: .white, details: [
            .init(title: "Maximise Profits", description: "Gain with our internal tools"),
            .init(title: "Invest in Stocks", description: "We provide great insights"),
            .init(title: "Develop Connections", description: "Conntect with community of experts in the field of stock market"),
        ])
        controller.configureSlider(parentViewController: self)
    }
}

