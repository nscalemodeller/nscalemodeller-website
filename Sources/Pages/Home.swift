import Foundation
import Ignite


struct Home: StaticPage {
    @Environment(\.articles) var content
    var title = "N Scale Modeller"

    var body: some HTML {
        let articles = content.all.sorted(by: { $0.date > $1.date }).prefix(5)
        
        List{
            ForEach(articles){ article in
                ArticlePreview(article: article)
            }
        }.margin(.leading, -32)
    }
}
