//
//  DropDownCell.swift
//  NewsAppDemo
//
//  Created by Yoonha Kim on 4/29/21.
//
import DropDown
import UIKit

class OptionCell: DropDownCell {
    
    @IBOutlet weak var dropDownImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
