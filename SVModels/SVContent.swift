
import Foundation

public class SVContent: NSObject {
    public var svTitle: String?
    public var svDescription: String?
    
    public init(title: String, description: String) {
        self.svTitle = title
        self.svDescription = description
    }
    
}
