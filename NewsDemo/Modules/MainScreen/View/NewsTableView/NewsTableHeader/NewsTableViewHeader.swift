//
//  NewsTableViewHeader.swift
//  CollectionViewDemo
//
//  Created by Yoonha Kim on 4/12/21.
//

import UIKit

protocol NewsTableViewHeaderDelegates: AnyObject {
    func refresh()
}

class NewsTableViewHeader: UITableViewHeaderFooterView, CellReusable {

    @IBOutlet private weak var newsHeaderTitleLabel: UILabel!
    @IBOutlet private weak var showMoreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        showMoreButton.makeRoundRectangle()
        self.backgroundColor = .white
        self.layer.backgroundColor = UIColor.white.cgColor
        self.showMoreButton.addPadding()
    }
    
    weak var delegate: NewsTableViewHeaderDelegates?
    
    func setTitle(keyword: String) {
        newsHeaderTitleLabel.text = "\(keyword) news"
    }
}
