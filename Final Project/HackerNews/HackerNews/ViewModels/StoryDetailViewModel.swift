//
//  StoryDetailViewModel.swift
//  HackerNews
//
//  Created by Zaheer Moola on 2021/07/12.
//

import Combine

class StoryDetailViewModel: ObservableObject {
    private var cancellable: AnyCancellable?

    @Published private var story: Story?

    func fetchStoryDetails(storyId: Int) {
        cancellable = Webservice().getStory(byId: storyId)
            .sink(receiveCompletion: {_ in }, receiveValue: { story in
                self.story = story
            })
    }
}

// MARK: Accessors
extension StoryDetailViewModel {
    var title: String {
        story?.title ?? "N/A"
    }

    var url: String {
        story?.url ?? "N/A"
    }
}
