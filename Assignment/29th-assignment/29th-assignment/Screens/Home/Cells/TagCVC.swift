//
//  TagCVC.swift
//  29th-assignment
//
//  Created by Noah on 2021/10/31.
//

import UIKit

class TagCVC: UICollectionViewCell {
	
	@IBOutlet weak var tagLabel: UILabel!
	
	var manager = HomeManager.shared
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
}

extension TagCVC: CellProtocol {
	
	static let identifier = "TagCVC"
	
	func getCellConfigureAt(_ index: Int) {
		tagLabel.text = manager.getTagTitle(index)
	}
}
