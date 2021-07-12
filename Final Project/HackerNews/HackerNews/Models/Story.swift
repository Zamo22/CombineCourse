//
//  Story.swift
//  HackerNews
//
//  Created by Zaheer Moola on 2021/07/12.
//

import Foundation

struct Story: Codable, Identifiable {
    let id: Int
    let title: String
    let url: String
}
