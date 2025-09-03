import Foundation
import Ignite


struct Header: HTML {

    var body: some HTML {
        Grid{
            Spacer()
            Card(imageName: "/images/trainwreck.jpg"){
                Group{
                    Text("N Scale Modeller")
                        .style(.fontSize,"3.0em").style(.marginBottom,"-15px")
                        .foregroundStyle("#ED6150")
                        .fontWeight(.bold)
                    Text{
                        Link("'experiments in n scale'", target: "/")
                            .style(.textDecoration,"none").style(.color,"#000000").style(.paddingLeft, "20px")
                    }.font(.title3)
                     .fontWeight(.thin)
                }
            }
            .contentPosition(.overlay(alignment: .bottomLeading))
            .frame(width: 1000)
            Spacer()
        }.padding()
    }
}


struct MainLayout: Layout {
    @Environment(\.articles) var content
    
    let tags: [(String,String)] = [("Turnout Control","turnout-control"),
                                   ("Arduino","arduino"),
                                   ("Linear Stepper Motors","linear-stepper-motors"),
                                   ("Turnouts","turnouts"),
                                   ("Muscle Wire","muscle-wire"),
                                   ("DCC Command Station","d-c-c-command-station"),
                                   ("Software","software"),
                                   ("Uncategorized","uncategorized"),
                                   ("DCC","d-c-c"),
                                   ("All tags","")]
    
    let archives: [(String,any StaticPage)] = [("2019",_2019()),("2018",_2018()),("2017",_2017()),("2015",_2015())]
   // let archives = [2019,2018,2017,2015]


    var body: some Document {
        Body {
            let articles = content.all.sorted(by: { $0.date > $1.date })
            
            Header()
            
            Grid(alignment: .top){
                content
                    .width(8)
                
                /// Sidebar
                Section{
                    Card{
                        List{
                            Link("Home", target: "/").plainLink()
                            Link("Arduino DCC Links", target: Links()).plainLink()
                            Link("Software Downloads", target: Downloads()).plainLink()
                            Link("About", target: About()).plainLink()
                            Link("Disclaimer", target: Disclaimer()).plainLink()
                        }.style(.listStyle, "none").margin(.bottom, .none)
                    }header: {
                        "Pages"
                    }.margin(.bottom)
                    Card{
                        let topArticles = articles.filter{ $0.metadata["top_post"] != nil }.prefix(5)
                        List {
                            ForEach(topArticles) { content in
                                ListItem{
                                    Link(content).plainLink()
                                }
                            }
                        }.style(.listStyle, "none").margin(.bottom, .none)
                    }header: {
                        "Top Posts"
                    }.margin(.bottom)
                    Card{
                        List {
                            ForEach(articles.prefix(5)){ content in
                                ListItem{
                                    Link(content).plainLink()
                                }
                            }
                        }.style(.listStyle, "none").margin(.bottom, .none)
                    }header: {
                        "Recent Posts"
                    }.margin(.bottom)
                    Card{
                        List {
                            ForEach(tags){ (tag, target) in
                                ListItem{
                                    Link(tag, target: "/tags/" + target).plainLink()
                                }
                            }
                        }.style(.listStyle, "none").margin(.bottom, .none)
                    }header: {
                        "Tags"
                    }.margin(.bottom)
                    Card{
                        List {
                            ForEach(archives){ (year, target) in
                                ListItem{
                                    Link(year, target: target).plainLink()
                                 //   Link("\(year)", target: Archives(year: year)).plainLink()
                                }
                            }
                        }.style(.listStyle, "none").margin(.bottom, .none)
                    }header: {
                        "Archive"
                    }
                }.position(.stickyTop)
                .padding(.bottom, 20)
            }
            WebsiteFooter()
        }
    }
}
