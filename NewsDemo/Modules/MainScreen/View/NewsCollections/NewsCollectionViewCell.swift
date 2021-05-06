//
//  NewsCollectionViewCell.swift
//  CollectionViewDemo
//
//  Created by Yoonha Kim on 4/8/21.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell, CellReusable {
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.makeRoundRectangle()
    }
    
    func configure(data: NewsCollectionViewModel) {
        titleLabel.text = data.newsTitle
        imageView.downloadImage(with: data.newsImage)
    }
}
