//
//  AgreementView.swift
//  NewsAppDemo
//
//  Created by Yoonha Kim on 4/22/21.
//

import UIKit

class AgreementView: UIView {
    
    @IBOutlet private var agreementTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        agreementTextView.text = FileHandler.manager.readFile(filename: "TermsAndService", type: "txt")
    }
    
    @IBAction private func callCustomerService() {
        let callHandler = CallHandler()
        callHandler.call(number: "334-306-0847")
    }
}
