import Foundation
import Ignite


var archiveYear: Int = 2018

@MainActor
func articlesFilteredByYear(articles: ArticleLoader, year: Int) ->[Article]{
    let articles = articles.all.filter{
        let date: Date = $0.metadata["date"] as! Date
        let components = Calendar.current.dateComponents([.year], from: date)
        
        return components.year == year
    }
    return articles.sorted(by: { $0.date > $1.date })
}

/// This doesn't work - use _2019(), _2018() etc. for now
struct Archives: StaticPage{
    @Environment(\.articles) var posts
    
    var title = "Articles from Archive"
    var year: Int
    
    init(){
        self.year = archiveYear
    }
    
    var body: some HTML {
        let articles = articlesFilteredByYear(articles: posts, year: year)
            
        Section{
            Text(title)
                .font(.title3)
            List{
                ForEach(articles){ article in
                    ArticlePreview(article: article)
                }
            }.margin(.leading, -32)
        }
    }
}



struct About: StaticPage {
    @Environment(\.decode) var decode
    
    var title = "Software, Electronics and Railways"
    
    var body: some HTML {
        let page = decode.data(forResource:"about.md")!
        let str = String(decoding: page, as: UTF8.self)
        
        Section{
            Text(title)
                .font(.title3)
            Text(markdown: str)
        }
    }
}


struct Disclaimer: StaticPage {
    @Environment(\.decode) var decode
    var title = "Disclaimer"
    
    var body: some HTML {
        let page = decode.data(forResource:"disclaimer.md")!
        let str = String(decoding: page, as: UTF8.self)
        
        Section{
            Text(title)
                .font(.title3)
            Text(markdown: str)
        }
    }
}


struct Downloads: StaticPage {
    @Environment(\.decode) var decode
    var title = "Downloads"
    
    var body: some HTML {
        let page = decode.data(forResource:"downloads.md")!
        let str = String(decoding: page, as: UTF8.self)
        
        Section{
            Text(title)
                .font(.title3)
            Text(markdown: str)
        }
    }
}


struct Links: StaticPage {
    @Environment(\.decode) var decode
    var title = "Links"
    
    var body: some HTML {
        let page = decode.data(forResource:"links.md")!
        let str = String(decoding: page, as: UTF8.self)
        
        Section{
            Text(title)
                .font(.title3)
            Text(markdown: str)
        }
    }
}


struct Tags: TagPage {
    var body: some HTML {
        Text("Articles tagged '\(tag.name)'")
            .font(.title3)

        List{
            ForEach(tag.articles){ article in
                ArticlePreview(article: article)
            }
        }.margin(.leading, -32)
    }
}

