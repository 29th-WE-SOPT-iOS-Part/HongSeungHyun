//
//  ThumbnailTVC.swift
//  29th-assignment
//
//  Created by Noah on 2021/10/29.
//

import UIKit

class ThumbnailTVC: UITableViewCell {
	
	var manager =  HomeManager.shared
	
	@IBOutlet weak var thumbnailImage: UIImageView!
	@IBOutlet weak var profileImage: UIImageView!
	@IBOutlet weak var thumbnailTitle: UILabel!
	@IBOutlet weak var infoLabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}
}

extension ThumbnailTVC: CellProtocol {
	
	static let identifier = "ThumbnailTVC"
	
	func getCellConfigureAt(_ index: Int) {
		thumbnailImage.image = manager.getThumbnailImage(index)
		thumbnailTitle.text = manager.getThumbnailTitle(index)
		let author = manager.getThumbnailAuthor(index)
		let views = manager.getThumbnailViews(index)
		let created = manager.getThumbnailCreatedDate(index)
		infoLabel.text = "\(author) ・ 조회수 \(views) ・ \(created)"
	}
}
