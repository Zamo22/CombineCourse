//
//  StoryDetailView.swift
//  HackerNews
//
//  Created by Zaheer Moola on 2021/07/12.
//

import SwiftUI

struct StoryDetailView: View {
    @ObservedObject private var storyDetailViewModel: StoryDetailViewModel
    private let storyId: Int

    init(storyId: Int) {
        self.storyDetailViewModel = StoryDetailViewModel()
        self.storyId = storyId
    }

    var body: some View {
        NavigationView {
            VStack {
                Text(storyDetailViewModel.title)
                Webview(url: storyDetailViewModel.url)
            }.onAppear {
                storyDetailViewModel.fetchStoryDetails(storyId: storyId)
            }
            .navigationBarColor(.orange, textColor: .white)
        }

    }
}

struct StoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoryDetailView(storyId: 8863)
    }
}
