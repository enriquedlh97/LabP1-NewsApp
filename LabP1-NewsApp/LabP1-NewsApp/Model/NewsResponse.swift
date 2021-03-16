//
//  NewsResponse.swift
//  LabP1-NewsApp
//
//

import Foundation

struct NewsResponse: Codable {
    let articles: [Article]
}


struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title, articleDescription: String?
    let image: String?
    let date: Date?
    
    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}


// Creates dummy data for article
extension Article {
    
    static var dummyData: Article {
        .init(author: "Joseph Wulfson",
              url: "https://www.foxnews.com/media/new-york-magazine-jonathan-chait-gina-carano-disney-hollywood-blacklist",
              source: "Fox News",
              title: "Disney's Gina Carano firing denounced as 'Hollywod Blacklist' against conservatives - Fox News",
              articleDescription: "Conservative actress Gina Carano found rare support among liberals in the mainstream media following her firing from \"The Mandalorian\" over social media posts and being dropped by her agency UTA.",
              image: "https://static.foxnews.com/foxnews.com/content/uploads/2021/02/Gina-Carano.jpg",
              date: Date())
    }
    
}
