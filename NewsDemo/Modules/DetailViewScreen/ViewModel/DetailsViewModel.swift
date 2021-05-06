//
//  DetailsViewModel.swift
//  NewsAppDemo
//
//  Created by Yoonha Kim on 4/20/21.
//

import UIKit
protocol DetailsViewModelDelegate: AnyObject {
    func fontSizeUp()
    func fontSizeDown()
    
    var title: String { get }
    var body: String { get }
    var mainImageUrl: String { get }
    var url: String { get }
    var publisher: String { get }
    var newsID: String { get }
    var recipient: String { get }
    var subject: String { get }
    var description: String { get }
}

class DetailsViewModel: DetailsViewModelDelegate {

    private var detailsInformation: Value?
    
    init(data: Value?) {
        self.detailsInformation = data
    }
    
    var shareSheetViewController: UIActivityViewController {
        let controller = UIActivityViewController(activityItems: [detailsInformation?.url ?? ""], applicationActivities: nil)
        return controller
    }
    
    var title: String {
         detailsInformation?.title ?? ""
    }
    var body: String {
         detailsInformation?.body ?? ""
    }
    
    var publisher: String {
      "Publisher by : \(detailsInformation?.provider.name ?? "")"
    }
    var mainImageUrl: String {
         detailsInformation?.image.url ?? ""
    }
    
    var url: String {
        detailsInformation?.url ?? ""
    }
    
    var newsID: String {
       "New Id: \(detailsInformation?.id ?? "")"
    }
    
    var description: String {
        detailsInformation?.description ?? ""
    }
    
    var fontSize: Int = 17
    
    func fontSizeUp() {
        fontSize += 3
    }
    
    func fontSizeDown() {
        fontSize -= 3
    }
    
    var recipient: String {
         "newsReport.gmail.com"
    }
    
    var subject: String {
        "Report Article"
    }
}
