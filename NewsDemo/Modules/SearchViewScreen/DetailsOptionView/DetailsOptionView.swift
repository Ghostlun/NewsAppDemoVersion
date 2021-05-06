//
//  DetailsOptionView.swift
//  CollectionViewDemo
//
//  Created by Yoonha Kim on 4/18/21.
//

import UIKit

class DetailsOptionView: UIView {
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var numbersItemField: UITextField!
    @IBOutlet private weak var publishedFromDatePicker: UIDatePicker! {
        didSet {
            publishedFromDatePicker.maximumDate = Calendar.current.date(byAdding: .year, value: 1, to: Date())
        }
    }
    @IBOutlet private weak var publishToDateDatePicker: UIDatePicker! {
        didSet {
            publishToDateDatePicker.maximumDate = Calendar.current.date(byAdding: .year, value: 1, to: Date())
        }
    }
    
    func getDataFromDetailsOptionView() -> SearchModel {
        let numbersOfItemsIn = Int(numbersItemField.text ?? "") ?? 5
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let publishedFromIn = formatter.string(from: publishedFromDatePicker.date)
        let publishedToIn = formatter.string(from: publishToDateDatePicker.date)
        let searchModel = SearchModel(detailsViewVisible: false, numbersOfItems: numbersOfItemsIn, publishedFrom: publishedFromIn, publishedTo: publishedToIn, keyword: "")
        return searchModel
    }
}
