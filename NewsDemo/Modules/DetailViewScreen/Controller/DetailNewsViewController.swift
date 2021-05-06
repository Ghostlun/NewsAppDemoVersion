//
//  DetailNewsViewController.swift
//  CollectionViewDemo
//
//  Created by Yoonha Kim on 4/14/21.
//

import DropDown
import UIKit

class DetailNewsViewController: UIViewController {
        
    @IBOutlet private weak var detailsInformationView: DetailsView!
    
    let menu: DropDown = {
        let menu = DropDown()
        menu.dataSource = ["Report", "Share"]
        let images = ["exclamationmark.triangle", "square.and.arrow.up"]
        menu.cellNib = UINib(nibName: "DropDownCell", bundle: nil)
        menu.customCellConfiguration = { index, _, cell in
            guard let cell = cell as? OptionCell else {
                return
            }
            cell.dropDownImageView.image = UIImage(systemName: images[index])
        }
        return menu
    }()
 
    var newsData: Value?
    lazy var mailViewModel = ContactFunctionHandler(presenting: self)
    lazy var detailsViewModel = DetailsViewModel(data: newsData)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsInformationView.configure(viewModel: detailsViewModel)
        
        guard let topView = detailsInformationView else { return }
        menu.anchorView = topView
        menu.selectionAction = { index, _ in
            switch index {
            case 0:
                self.reportNewsArticle()
                
            case 1:
                self.showActivity()

            default:
                break
            }
        }
    }
    
    @IBAction private func didTapTopItem() {
        menu.show()
    }
    
    private func showActivity() {
        let view = detailsViewModel.shareSheetViewController
        self.present(view, animated: true, completion: nil)
    }
    
    private func reportNewsArticle() {
        let mail = mailViewModel.sendMailWith(recipient: [detailsViewModel.recipient], messageBody: detailsViewModel.newsID, subject: detailsViewModel.subject)
        self.present(mail, animated: true, completion: nil)
    }
}
