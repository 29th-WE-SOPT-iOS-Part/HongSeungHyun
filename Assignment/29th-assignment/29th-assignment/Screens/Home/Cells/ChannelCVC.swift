//
//  ChannelCVC.swift
//  29th-assignment
//
//  Created by Noah on 2021/10/29.
//

import UIKit

class ChannelCVC: UICollectionViewCell {
	
	var manager = HomeManager.shared
	
	@IBOutlet weak var channelImage: UIImageView!
	@IBOutlet weak var channelTitle: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
}

extension ChannelCVC: CellProtocol {
	
	static let identifier = "ChannelCVC"
	
	func getCellConfigureAt(_ index: Int) {
		channelImage.image = manager.getChannelImage(index)
		channelTitle.text = manager.getChannelTitle(index)
	}
}
