//
//  KeywordCVC.swift
//  29th-week7-seminar
//
//  Created by Noah on 2021/12/24.
//

import UIKit

protocol KeywordCellDelegate: AnyObject {
	func keywordCellSelected(cell: KeywordCVC)
	func keywordCellUnselected(cell: KeywordCVC, unselectedName: String)
}

class KeywordCVC: UICollectionViewCell {
	
	static let identifier = "KeywordCVC"
	var keyword = ""
	var selectedKeyword = false
	weak var keywordDelegate: KeywordCellDelegate?
	
	@IBOutlet weak var keywordButton: UIButton?
	
	override func awakeFromNib() {
        super.awakeFromNib()
    }
	
	@IBAction func touchUpToSelect(_ sender: UIButton) {
		if selectedKeyword {
			keywordDelegate?.keywordCellUnselected(cell: self,
												   unselectedName: keyword)
			keywordButton?.backgroundColor = .clear
		} else {
			keywordDelegate?.keywordCellSelected(cell: self)
			keywordButton?.backgroundColor = .yellow
		}
		
		selectedKeyword.toggle()
	}
	
	func setKeyword(text: String) {
		keyword = text
		keywordButton?.setTitle(keyword, for: .normal)
	}
}
