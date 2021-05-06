//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by Yoonha Kim on 4/7/21.
//  Design: https://dribbble.com/shots/7229348-Newspaper

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet private var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    
    @IBOutlet private var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            self.tableView.register(UINib(nibName: NewsTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: NewsTableViewCell.reuseIdentifier)
            self.tableView.register(UINib(nibName: NewsTableViewHeader.reuseIdentifier, bundle: nil), forHeaderFooterViewReuseIdentifier: NewsTableViewHeader.reuseIdentifier)
        }
    }
    
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!

    lazy var mainTableViewModel = MainViewModel(delegate: self)
    var collectionViewModel: NewsCollectionViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Google News"
        self.collectionViewModel = NewsCollectionViewModel(delegate: self)
        self.activityIndicator.startAnimating()
        fetchData()
    }
    
    func fetchData() {
        
        let group = DispatchGroup()
        let recentUrl = "https://test.spaceflightnewsapi.net/api/v2/articles?_limit=10"
        group.enter()
        self.mainTableViewModel.fetchNews(NewsSearchUrl.defaultUrl) { _ in
            group.leave()
        }
        group.enter()
        self.collectionViewModel?.fetchNews(recentUrl) { _ in
            group.leave()
        }
        
        group.notify(queue: DispatchQueue.main) {
            self.tableView.reloadData()
            self.collectionView.reloadData()
            self.activityIndicator.stopAnimating()
        }
    }
}

extension MainViewController: MainViewModelDelegate, NewsCollectionViewModelDelegate {
    
    func didStartFetching() {
        print("Start fetching")
    }
    
    func didFinishFetching() {
        print("finish fetching")
    }
    
    func reloadData() {
        self.tableView.reloadData()
        self.collectionView.reloadData()
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.collectionViewModel?.numberOfRowsInSection(section: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sendData = self.collectionViewModel?.news(at: indexPath.row) else { fatalError("no cell") }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.reuseIdentifier,
                                                            for: indexPath) as? NewsCollectionViewCell else { return UICollectionViewCell() }
        let collectionViewModel = NewsCollectionViewModel(view: sendData)
        cell.configure(data: collectionViewModel)
        return cell
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.mainTableViewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sendData = self.mainTableViewModel.news(at: indexPath.row)
        guard let cell = tableView.dequeueReusableCell( withIdentifier: NewsTableViewCell.reuseIdentifier,
                                                        for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
        cell.configure(data: sendData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: NewsTableViewHeader.reuseIdentifier ) as? NewsTableViewHeader else { return UIView() }
        headerCell.setTitle(keyword: NewsSearchUrl.defaultKeyword)
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailData = self.mainTableViewModel.newsFullData(at: indexPath.row)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let detailViewController = storyboard.instantiateViewController(identifier: "DetailNewsViewController") as? DetailNewsViewController {
            detailViewController.newsData = detailData
            navigationController?.pushViewController(detailViewController, animated: true)
        } else {
            print("Can't find storyboard")
        }
    }
}
