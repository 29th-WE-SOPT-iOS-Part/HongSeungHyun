//
//  ThumbnailTVC.swift
//  29th-assignment
//
//  Created by Noah on 2021/10/29.
//

import UIKit

class ThumbnailTVC: UITableViewCell {
	
	var manager =  HomeManager.shared
	weak var delegate: PresentView?
	
	@IBOutlet weak var thumbnailImage: UIImageView?
	@IBOutlet weak var profileImage: UIImageView?
	@IBOutlet weak var thumbnailTitle: UILabel?
	@IBOutlet weak var infoLabel: UILabel?
	
	override func awakeFromNib() {
		super.awakeFromNib()
		initTapGestureForImageView()
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}
}

extension ThumbnailTVC: CellProtocol {
	
	static let identifier = "ThumbnailTVC"
	
	func getCellConfigureAt(_ index: Int) {
		thumbnailImage?.image = manager.getThumbnailImage(index)
		thumbnailTitle?.text = manager.getThumbnailTitle(index)
		let author = manager.getThumbnailAuthor(index)
		let views = manager.getThumbnailViews(index)
		let created = manager.getThumbnailCreatedDate(index)
		infoLabel?.text = "\(author) ・ 조회수 \(views) ・ \(created)"
	}
}

extension ThumbnailTVC {
	private func initTapGestureForImageView() {
		let tapRecognizer = UITapGestureRecognizer(target: self,
												   action: #selector(self.profileImageDidTap))
		thumbnailImage?.addGestureRecognizer(tapRecognizer)
		thumbnailImage?.isUserInteractionEnabled = true
	}
	
	@objc func profileImageDidTap() {
		let detailContentSB = UIStoryboard(name: "DetailContent", bundle: nil)
		guard let detailContentVC = detailContentSB.instantiateViewController(withIdentifier: DetailContentVC.identifier) as? DetailContentVC
		else { return }
		detailContentVC.modalPresentationStyle = .fullScreen
		
		let detailContentData = DetailContent(contentImage: thumbnailImage?.image,
											  contentTitle: thumbnailTitle?.text,
											  contentInfo: infoLabel?.text)
		detailContentVC.contentData = detailContentData
		delegate?.present(viewController: detailContentVC)
	}
}
