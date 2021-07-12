//
//  StoryListViewModel.swift
//  HackerNews
//
//  Created by Zaheer Moola on 2021/07/12.
//

import Combine

class StoryListViewModel: ObservableObject {
    @Published var stories = [StoryViewModel]()
    private var cancellable: AnyCancellable?

    init() {
        fetchTopStories()
    }

    private func fetchTopStories() {
        cancellable = Webservice().getAllTopStories().map { stories in
            stories.map { StoryViewModel(story: $0) }
        }
        .sink(receiveCompletion: { _ in}, receiveValue: { stories in
            self.stories = stories
        })
    }
}

struct StoryViewModel {
    let story: Story

    var id: Int {
        story.id
    }

    var title: String {
        story.title
    }

    var url: String {
        story.url
    }
}
