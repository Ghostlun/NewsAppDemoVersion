//
//  AgreementController.swift
//  NewsAppDemo
//
//  Created by Yoonha Kim on 4/22/21.
//

import UIKit

class AgreementController: UIViewController {
    
    @IBOutlet private var agreementView: UIView!
    lazy var mailHandler = ContactFunctionHandler(presenting: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func sendMail() {
        let mail = mailHandler.sendMailWith(recipient: ["newsReport.gmail.com"], messageBody: "", subject: "Report Article")
        present(mail, animated: true, completion: nil)
    }
    
    @IBAction private func messageCustomerService() {
        let message = mailHandler.message(recipients: "334-306-0847")
        present(message, animated: true, completion: nil)
    }
}
