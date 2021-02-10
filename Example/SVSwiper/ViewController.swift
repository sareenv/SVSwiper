
import UIKit
import SVSwiper

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let controller = SVSwiperController(backgroundColor: .white, details: [
            .init(title: "Maximise Profits", description: "Gain with our internal tools", image: #imageLiteral(resourceName: "2")),
            .init(title: "Invest in Stocks", description: "We provide great insights", image: #imageLiteral(resourceName: "3")),
            .init(title: "Develop Connections" , description: "Conntect with community of experts in the field of stock market", image: #imageLiteral(resourceName: "2")),
            .init(title: "Develop Connections" , description: "Conntect with community of experts in the field of stock market", image: #imageLiteral(resourceName: "1"))
        ])
        controller.configureSlider(parentViewController: self)
    }
}

