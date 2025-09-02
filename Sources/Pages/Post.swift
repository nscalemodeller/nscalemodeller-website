import Foundation
import Ignite


struct Post: ArticlePage{
    @Environment(\.articles) var posts
           
    var body: some HTML {
        let text = replaceImageData(content: article.text)
        let date: Date = article.date
        let dateString = date.formatted(Date.FormatStyle().month().year())
        
        let articles = posts.all.sorted(by: { $0.date < $1.date })
        let index = articles.firstIndex(where: {$0.path == article.path })!
        
        let previousPost = index > 0 ? articles[index - 1] : nil
        let nextPost = index < articles.count - 1 ? articles[index + 1] : nil
        
        Section{
            if let previousPost{
                Link("Previous Post", target: previousPost.path).plainLink()
            }
            if let nextPost{
                Link("Next Post", target: nextPost.path).plainLink()
            }
        }.class("d-flex justify-content-between align-items-center p-2")
                
        Card{
            Text(article.title)
                .font(.title2)
                .style(.textDecoration, "none")
            Text(article.subtitle ?? "")
                .font(.title6)
            Text(dateString)
            Text(text)
        }footer:{
            CardTags(article: article)
        }.margin(.bottom)
    }
}


/// Finds all occurances of [img: (height), ***.jpg, ***.jpg] so we can style them all the same
func replaceImageData(content: String) ->String{
    let search = try! Regex("\\[img:(.*?)\\]")
    
    let str = content.replacing(search, with: { match in
        let subStrings = match.output[1].substring!.split(separator: ",")
        
        var newString = "<div class=\"text-center\">"
        let size = String(subStrings[0])
        
        (1..<subStrings.count).forEach{
            let image = String(subStrings[$0]).trimmingCharacters(in: NSCharacterSet.whitespaces)
            newString += "<a href=\"\(image)\"><img src=\"\(image)\" height=\"\(size)\""
            newString += " style=\"margin: 0px 0px 10px 5px; padding: 2px; border: 1px solid grey;\"/></a>"
        }
        newString += "</div>"
        
        return newString
    })
    
    return str
}
