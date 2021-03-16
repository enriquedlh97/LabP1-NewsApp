//
//  ArticleView.swift
//  LabP1-NewsApp
//
//

import SwiftUI
import URLImage

struct ArticleView: View {
    
    let article: Article
    
    var body: some View {
        HStack {
            
            if let imgUrl = article.image,
               let url = URL(string: imgUrl) {
                
                URLImage(url: url,
                         options: URLImageOptions(
                            identifier: article.id.uuidString,
                            cachePolicy:
                                .returnCacheElseLoad(cacheDelay: nil, downloadDelay: 0.25)
                         ),
                         failuer: { error, _ in
                            Image(systemName: "photo.fill")
                                .foregroundColor(.white)
                                .background(Color.gray)
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                         },
                         content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                         })
                // Build asynchronous image object
            } else {
                
            }
            
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData)
    }
}
