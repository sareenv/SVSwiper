
import UIKit
import SVSwiper

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let controller = SVSwiperController(backgroundColor: .white, details: [
            .init(title: "Maximise Profits", description: "Gain with our internal tools, we are here to support your company at every stage", image: #imageLiteral(resourceName: "2")),
            .init(title: "Invest in Stocks", description: "We provide great insights, on which stock to buy and sell at any moment of time", image: #imageLiteral(resourceName: "3")),
            .init(title: "Develop Connections" , description: "Conntect with community of experts in the field of stock market", image: #imageLiteral(resourceName: "2")),
            .init(title: "Develop Connections" , description: "Conntect with community of experts in the field of stock market", image: #imageLiteral(resourceName: "3"))
        ])
        controller.configureSlider(parentViewController: self)
    }
}

