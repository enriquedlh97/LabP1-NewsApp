//
//  FeedView.swift
//  LabP1-NewsApp
//
//

import SwiftUI
import Combine

struct FeedView: View {
    
    // Use system to open links
    @Environment(\.openURL) var openURL
    @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    
    var body: some View {
        NavigationView {
        Group {
            
            // Observe states and display appropiate value
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error,
                          handler: viewModel.getArticles)
            case .success(let articles):
                
                    List(articles) { item in
                        ArticleView(article: item)
                            .onTapGesture {
                                load(url: item.url)
                            }
                    }
                    .navigationTitle(Text("News"))
                
            }
        }
            
        }.onAppear(perform: viewModel.getArticles) // Automatically calls for articles fucntion
    
    }
    
    func load(url: String?) {
        
        guard let link = url,
              let url = URL(string: link) else { return }
        
        openURL(url)
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
