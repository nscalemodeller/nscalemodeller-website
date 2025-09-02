import Foundation
import Ignite


struct _2019: StaticPage{
    @Environment(\.articles) var posts
    
    var title = "Articles from 2019"
    
    var body: some HTML {
        let articles = articlesFilteredByYear(articles: posts, year: 2019)
            
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


struct _2018: StaticPage{
    @Environment(\.articles) var posts
    
    var title = "Articles from 2018"
    
    var body: some HTML {
        let articles = articlesFilteredByYear(articles: posts, year: 2018)
            
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


struct _2017: StaticPage{
    @Environment(\.articles) var posts
    
    var title = "Articles from 2017"
    
    var body: some HTML {
        let articles = articlesFilteredByYear(articles: posts, year: 2017)
            
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


struct _2015: StaticPage{
    @Environment(\.articles) var posts
    
    var title = "Articles from 2015"
    
    var body: some HTML {
        let articles = articlesFilteredByYear(articles: posts, year: 2015)
        
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
