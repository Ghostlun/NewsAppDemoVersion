//
//  NewsWebSearchResult.swift
//  CollectionViewDemo
//
//  Created by Yoonha Kim on 4/12/21.
//

import Foundation

struct NewsWebSearchResult: Decodable {
    var type: String
    var didUMean: String
    var value: [Value]
    
    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case didUMean, value
    }
}

struct Value: Decodable {
    var id: String
    var title: String
    var url: String
    var description: String
    var body: String
    var keywords: String
    var language: String
    var isSafe: Bool
    var datePublished: String
    var provider: Provider
    var image: Image
    var numbersOfComments: Int {
        Int.random(in: 100..<399)
    }
}

struct Provider: Decodable {
    var name: String
}

struct Image: Decodable {
    var url: String
    var thumbnail: String
}
