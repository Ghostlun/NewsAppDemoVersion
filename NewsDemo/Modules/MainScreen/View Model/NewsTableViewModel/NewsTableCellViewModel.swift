//
//  NewsTableCellViewModel.swift
//  CollectionViewDemo
//
//  Created by Yoonha Kim on 4/17/21.
//

import UIKit

protocol NewsTableViewCellDelegate: AnyObject {
    var newsTitle: String { get }
    var newsPublishedAt: String { get }
    var newsThumbnailsUrl: String { get }
    var numbersOfComments: Int { get }
    var publishedTime: String { get }
}

class NewsTableCellViewModel: NewsTableViewCellDelegate {
    
    private var newsValue: Value
    
    init(news: Value) {
        self.newsValue = news
    }
    
    var newsTitle: String {
        newsValue.title
    }
    
    var newsPublishedAt: String {
        getSubString(sentence: newsValue.datePublished, fromIndex: 0, toIndex: 9)
    }
    
    var newsThumbnailsUrl: String {
        newsValue.image.url
    }
    
    var numbersOfComments: Int {
        newsValue.numbersOfComments
    }
    
    var publishedTime: String {
        getSubString(sentence: newsValue.datePublished, fromIndex: 11, toIndex: 15)
    }
}
extension NewsTableCellViewModel {
    func getSubString(sentence: String, fromIndex: Int, toIndex: Int) -> String {
    let start = sentence.index(sentence.startIndex, offsetBy: fromIndex)
    let end = sentence.index(sentence.startIndex, offsetBy: toIndex)
    let range = start...end
    return String(sentence[range])
    }
}
