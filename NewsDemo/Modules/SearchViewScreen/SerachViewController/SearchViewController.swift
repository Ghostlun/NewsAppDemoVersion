//
//  SearchViewController.swift
//  CollectionViewDemo
//
//  Created by Yoonha Kim on 4/14/21.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet private weak var detailsOptionView: DetailsOptionView!
    @IBOutlet private weak var searchBar: UISearchBar! {
        didSet {
            searchBar.delegate = self
        }
    }
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            self.tableView.register(UINib(nibName: NewsTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: NewsTableViewCell.reuseIdentifier)
            self.tableView.register(UINib(nibName: NewsTableViewHeader.reuseIdentifier, bundle: nil), forHeaderFooterViewReuseIdentifier: NewsTableViewHeader.reuseIdentifier)
        }
    }
    
    @IBOutlet private var autoCompleteTableView: UITableView! {
        didSet {
            autoCompleteTableView.dataSource = self
            autoCompleteTableView.delegate = self
        }
    }
    
    var detailsViewVisible = false
    lazy var mainTableViewModel = MainViewModel(delegate: self)
    var newsSearchViewModel: NewsSearchViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsOptionView.isHidden = true
        tableView.isHidden = true
        activityIndicator.isHidden = true
        self.searchBar.showsBookmarkButton = true
        self.searchBar.setImage(UIImage(named: "square.grid.2x2"), for: .bookmark, state: .normal)
    }
}

extension SearchViewController: UISearchBarDelegate, MainViewModelDelegate {
    
    func didStartFetching() {
        self.activityIndicator.startAnimating()
    }
    
    func didFinishFetching() {
        self.activityIndicator.stopAnimating()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        if detailsViewVisible == false {
            detailsOptionView.isHidden = false
            detailsViewVisible = true
            tableView.isHidden = true
            activityIndicator.isHidden = true
        } else {
            detailsOptionView.isHidden = true
            detailsViewVisible = false
            tableView.isHidden = true
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.activityIndicator.startAnimating()
        guard let keyword = searchBar.text else { return }
        var searchModel = detailsOptionView.getDataFromDetailsOptionView()
        searchModel.keyword = keyword
        self.newsSearchViewModel = NewsSearchViewModel(searchModel)
        if newsSearchViewModel?.checkTheDate() == true {
            self.mainTableViewModel.fetchNews(newsSearchViewModel?.fullUrlAddress ?? "") { _ in
            }
        } else { self.showAlert(title: "Please Check Date", message: "Published date should be before than published to") { _, _ in } }
        tableView.isHidden = false
        self.searchBar.endEditing(true)
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainTableViewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let news = mainTableViewModel.news(at: indexPath.row)
        guard let cell = tableView.dequeueReusableCell( withIdentifier: NewsTableViewCell.reuseIdentifier,
                                                        for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
        cell.configure(data: news)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: NewsTableViewHeader.reuseIdentifier ) as? NewsTableViewHeader else { return UIView() }
        headerCell.setTitle(keyword: newsSearchViewModel?.keyword ?? "")
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
        let detailData = mainTableViewModel.newsFullData(at: indexPath.row)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let detailViewController = storyboard.instantiateViewController(identifier: "DetailNewsViewController") as? DetailNewsViewController {
            detailViewController.newsData = detailData
            navigationController?.pushViewController(detailViewController, animated: true)
        } else {
            print("Can't find storyboard")
        }
    }
}
extension SearchViewController: AlertProtocol {}
