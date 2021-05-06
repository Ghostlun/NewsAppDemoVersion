//
//  MainScreenViewModel.swift
//  NewsAppDemo
//
//  Created by Yoonha Kim on 4/20/21.
//

import Foundation

protocol MainViewModelDelegate: AnyObject {
    func reloadData()
    func didStartFetching()
    func didFinishFetching()
}

class MainViewModel {
    
    private var dataSourceNewsSearch: [NewsTableViewCellDelegate] {
        didSet {
            self.delegate?.reloadData()
        }
    }
    
    private var dataSourceRecents: News {
        didSet {
            self.delegate?.reloadData()
        }
    }
    
    private var newsValueData: [Value]?
    
    weak var delegate: MainViewModelDelegate?
    
    init(delegate: MainViewModelDelegate) {
        self.delegate = delegate
        self.dataSourceNewsSearch = []
        self.dataSourceRecents = []
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        self.dataSourceNewsSearch.count
    }
    
    func news(at index: Int) -> NewsTableViewCellDelegate {
        self.dataSourceNewsSearch[index]
    }
    
    func newsFullData(at index: Int) -> Value {
        guard let newsValue = self.newsValueData?[index] else { fatalError("message") }
        return newsValue
    }
    
    func fetchNews(_ urlFrom: String, completion: @escaping (String) -> Void) {
        self.delegate?.didStartFetching()
        NetworkManager.manager.fetch(url: urlFrom) { [weak self](result: Result<NewsWebSearchResult, AppError>) in
            guard let self = self else { return }
            switch result {
            case .success(let newsData):
                self.dataSourceNewsSearch = newsData.value.compactMap { NewsTableCellViewModel(news: $0) }
                completion("Success")
                self.newsValueData = newsData.value
                self.delegate?.didFinishFetching()
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
