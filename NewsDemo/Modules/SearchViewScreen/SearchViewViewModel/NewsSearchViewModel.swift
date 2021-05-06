//
//  NewsSearchViewModel.swift
//  CollectionViewDemo
//
//  Created by Yoonha Kim on 4/18/21.
//

import UIKit

class NewsSearchViewModel {
   
    var newsSearchModel: SearchModel?
    
    var fullUrlAddress: String {
        guard let unwrappedNewsSearchModel = newsSearchModel else { fatalError("failed unwrapped") }
        var newsSearchUrl = NewsSearchUrl(searchModel: unwrappedNewsSearchModel)
        newsSearchUrl.keyword = newsSearchUrl.keyword.lowercased()
        return NewsSearchUrl.getUrl(newsSearchUrl)()
    }
    
    var keyword: String {
         newsSearchModel?.keyword ?? ""
    }
    
    init(_ newsSearchModel: SearchModel) {
        self.newsSearchModel = newsSearchModel
    }
    func checkTheDate() -> Bool {
        if newsSearchModel?.publishedFrom.compare(newsSearchModel?.publishedTo ?? "") == .orderedDescending {
            return false
        }
        return true
    }
}
