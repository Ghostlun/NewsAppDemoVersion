//
//  NewsTableViewCell.swift
//  CollectionViewDemo
//
//  Created by Yoonha Kim on 4/12/21.
//

import UIKit

class NewsTableViewCell: UITableViewCell, CellReusable {
    
    @IBOutlet private weak var newsThumbnailsImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var publishedAtLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var commentsLabel: UILabel!
    @IBOutlet private weak var categoryButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        newsThumbnailsImageView.makeRoundRectangleImageView(cornerRadius: 10)
        categoryButton.makeRoundRectangle(cornerRadius: 10)
        categoryButton.addPaddingWith(topInset: 3, leftInset: 3, bottomInset: 3, rightInset: 3)
    }
    
    func configure(data: NewsTableViewCellDelegate) {
        newsThumbnailsImageView.downloadImage(with: data.newsThumbnailsUrl)
        titleLabel.text = data.newsTitle
        publishedAtLabel.text = data.newsPublishedAt
        timeLabel.text = data.publishedTime
        commentsLabel.text = "\(data.numbersOfComments)"
    }
}
