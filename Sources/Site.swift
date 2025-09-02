import Foundation
import Ignite

@main
struct IgniteWebsite {
    static func main() async {
        var site = NScaleModeller()

        do {
            try await site.publish()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct NScaleModeller: Site {
    var name = "N Scale Modeller"
    var titleSuffix = ""
    var url = URL(static: "https://www.nscalemodeller.com")
    var builtInIconsEnabled = true

    var author = "Peter Zegelin"

    var homePage = Home()
    var tagPage = Tags()
    var layout = MainLayout()
    
    var lightTheme: (any Theme)? = nil
    
    var staticPages: [any StaticPage]{
        About()
        Disclaimer()
        Downloads()
        Links()
        _2019()
        _2018()
        _2017()
        _2015()
    }
    
    var articlePages: [any ArticlePage]{
        Post()
    }
}
