import Foundation
import Ignite

/// Removes underline from links and sets the color to #aaa

extension HTML {
    func plainLink() -> some HTML {
        self.style(.textDecoration,"none").style(.color,"#aaa")
    }
}


extension InlineElement {
    func plainLink() -> some InlineElement {
        self.style(.textDecoration,"none").style(.color,"#aaa")
    }
}
