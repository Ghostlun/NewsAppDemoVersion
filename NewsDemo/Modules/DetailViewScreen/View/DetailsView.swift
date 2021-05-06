//
//  DetailsView.swift
//  NewsAppDemo
//
//  Created by Yoonha Kim on 4/19/21.
//

import UIKit

class DetailsView: UIView {
 
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
    @IBOutlet private weak var publisherLabel: UILabel!
    @IBOutlet private weak var mainImage: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    var fontSize = 17
    private weak var delegate: DetailsViewModelDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainImage.makeRoundRectangleImageView(cornerRadius: 10)
    }
    
    func configure(viewModel: DetailsViewModelDelegate) {
        titleLabel.text = viewModel.title
        bodyLabel.text = viewModel.body
        publisherLabel.text = viewModel.publisher
        descriptionLabel.text = viewModel.description
        mainImage.downloadImage(with: viewModel.mainImageUrl)
    }
    
    @IBAction private func zoomInText() {
        fontSize += 3
        bodyLabel.font = self.bodyLabel.font.withSize(CGFloat(fontSize))
    }
    
    @IBAction private func zoomOutText() {
        fontSize -= 3
        bodyLabel.font = self.bodyLabel.font.withSize(CGFloat(fontSize))
    }
}
