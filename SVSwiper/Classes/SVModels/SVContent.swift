
import Foundation

public class SVContent: NSObject {
    public var svTitle: String?
    public var svDescription: String?
    public var svImage: UIImage?
    
    public init(title: String, description: String, image: UIImage? = nil) {
        self.svTitle = title
        self.svDescription = description
        if let image = image {
            self.svImage = image
        }
    }
}
