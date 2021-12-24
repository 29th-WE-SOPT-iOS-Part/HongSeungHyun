//
//  DetailContentVC.swift
//  29th-assignment
//
//  Created by Noah on 2021/12/24.
//

import UIKit

class DetailContentVC: UIViewController {

	@IBOutlet private weak var contentImage: UIImageView?
	@IBOutlet private weak var contentTitle: UILabel?
	@IBOutlet private weak var contentInfo: UILabel?
	
	lazy var contentData = DetailContent()
	
	override func viewDidLoad() {
        super.viewDidLoad()
		setUI()
    }
	
	@IBAction func dismissBtnDidTap(_ sender: Any) {
		dismiss(animated: true)
	}
}

extension DetailContentVC {
	static let identifier = "DetailContentVC"
	
	private func setUI() {
		contentImage?.image = contentData.contentImage
		contentTitle?.text = contentData.contentTitle
		contentInfo?.text = contentData.contentInfo
	}
}
