import Foundation
import Ignite


/// Places article tags in the footer of Cards
struct CardTags: HTML{
    var article: Article
    
    var body: some HTML {
        if let tagLinks = article.tagLinks(){
            Section {
                ForEach(tagLinks) { link in
                    link
                }
            } .style(.marginTop, "-5px")
        }
    }
}
