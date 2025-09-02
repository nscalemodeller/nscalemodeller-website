import Foundation
import Ignite
import RegexBuilder


struct ArticlePreview: HTML{
    var title: String = ""
    let article: Article
    
    var body: some HTML {
        let preview = previewContent(content: article.text)
        let date: Date = article.metadata["date"] as! Date
        let dateString = date.formatted(Date.FormatStyle().month().year())
        
        Card(imageName: article.image){
            Text(preview)
                .margin(.bottom, .none)
            Text{
                Link("more", target: article.path)
            }.horizontalAlignment(.trailing)
            .margin(.bottom, .none)
        } header: {
            Link(article).font(.title4)
                .style(.textDecoration, "none")
                .style(.color, "#888")
            Text(dateString + " - " + (article.subtitle ?? ""))
                .style(.color, "#aaa")
                .fontWeight(.thin)
                .margin(.bottom, .none)
        } footer: {
            CardTags(article: article)
        }.margin(.bottom)
    }
}


/// Get all the text from the post up to the "<!--more-->" marker
func previewContent(content: String) ->(String){

    let result = Capture{
        OneOrMore(
            CharacterClass(.any)
        )
    }

    let match = Regex{
        Optionally{
            result
        }
        "<!--more-->"
    }

    if let match = content.firstMatch(of: match) {
        let (_, preview) = match.output
        return (String(preview ?? ""))
    }

    return ("")
}

