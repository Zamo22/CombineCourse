//
//  StoryListView.swift
//  HackerNews
//
//  Created by Zaheer Moola on 2021/07/12.
//

import SwiftUI

struct StoryListView: View {
    @ObservedObject private var viewModel = StoryListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.stories, id: \.id) { storyVm in
                NavigationLink(destination: StoryDetailView(storyId: storyVm.id)) {
                    Text("\(storyVm.title)")
                }

            }
            .navigationBarTitle("Hacker news")
            .navigationBarColor(.orange, textColor: .white)
        }
    }
}

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}
