//
//  Webservice.swift
//  HackerNews
//
//  Created by Zaheer Moola on 2021/07/12.
//

import Foundation
import Combine

class Webservice {

    func getAllTopStories() -> AnyPublisher<[Story], Error> {
        guard let url = URL(string: "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty") else {
            fatalError("Url not valid")
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: [Int].self, decoder: JSONDecoder())
            .flatMap { storyIds in
                return self.mergeStories(ids: storyIds)
            }.scan([]) { stories, story -> [Story] in
                return stories + [story]
            }
            .eraseToAnyPublisher()
    }

    func getStory(byId id: Int) -> AnyPublisher<Story, Error> {
        guard let url = URL(string: "https://hacker-news.firebaseio.com/v0/item/\(id).json?print=pretty")
        else { fatalError("Dude stop with these invalid urls")}
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: Story.self, decoder: JSONDecoder())
            .catch{_ in Empty<Story, Error>()}
            .eraseToAnyPublisher()
    }

    private func mergeStories(ids storyIds: [Int]) -> AnyPublisher<Story, Error> {
        let storyIds = Array(storyIds.prefix(50))
        let initialPublisher = getStory(byId: storyIds[0])
        let remainder = Array(storyIds.dropFirst())

        return remainder.reduce(initialPublisher) { combined, id in
            return combined.merge(with: getStory(byId: id))
                .eraseToAnyPublisher()
        }
    }
}
