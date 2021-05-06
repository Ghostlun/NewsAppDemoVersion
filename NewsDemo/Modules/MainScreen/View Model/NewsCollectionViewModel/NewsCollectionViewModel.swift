//
//  NewsCollectionViewModel.swift
//  CollectionViewDemo
//
//  Created by Yoonha Kim on 4/17/21.
//

import UIKit

protocol NewsCollectionViewModelDelegate: AnyObject {
    func reloadData()
    func didStartFetching()
    func didFinishFetching()
}

class NewsCollectionViewModel {
    
    private var dataSourceRecents: News {
        didSet {
            self.delegate?.reloadData()
        }
    }
    
    weak var delegate: NewsCollectionViewModelDelegate?
    private var newsElements: NewsElements?
    
    var newsTitle: String {
        newsElements?.title ?? ""
    }
    
    var newsImage: String {
        newsElements?.imageUrl ?? ""
    }
    
    init(delegate: NewsCollectionViewModelDelegate) {
        self.delegate = delegate
        self.dataSourceRecents = []
    }
    
    init(view: NewsElements) {
        self.newsElements = view
        self.dataSourceRecents = []
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        self.dataSourceRecents.count
    }
    
    func news(at index: Int) -> NewsElements {
        self.dataSourceRecents[index]
    }
    
    func fetchNews(_ urlFrom: String, completion: @escaping (String?) -> Void) {
        self.delegate?.didStartFetching()
        NetworkManager.manager.fetch(url: urlFrom) { [weak self](result: Result<News, AppError>) in
            guard let self = self else { return }
            switch result {
            case .success(let newsData):
                self.dataSourceRecents = newsData
                completion("success")
                
            case .failure(let error):
                print(error)
            }
        }
        self.delegate?.didFinishFetching()
    }
}
