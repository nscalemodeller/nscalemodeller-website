import Foundation
import Ignite

struct WebsiteFooter: HTML {
    
    var body: some HTML {
        Section{
            Text("© 2015 - <span id='currentYear'></span> NScaleModeller.com |&nbsp;")
            /// JavaScript to dynamically update the date
            Script(code: "document.getElementById('currentYear').textContent = new Date().getFullYear();")
            Text {
                "Created in Swift with "
                Link("Ignite", target: URL(static: "https://github.com/twostraws/Ignite"))
            }
            Text {
                "&nbsp;| Source Code for this site is at "
                Link("GitHub ", target: URL(static: "https://github.com/nscalemodeller/webite-project"))
            }
        }.class("d-flex justify-content-center")  /// 'bootstrap' - place side by side
        .margin(.small)
        .style(.fontSize, "0.8em")
    }
}
