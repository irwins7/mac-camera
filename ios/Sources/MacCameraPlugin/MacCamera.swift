import Foundation

@objc public class MacCamera: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
