//
//  HomeVC+TableView.swift
//  29th-assignment
//
//  Created by Noah on 2021/10/29.
//

import UIKit

extension HomeVC: UITableViewDelegate {
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 306
	}
}

extension HomeVC: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return manager.thumbnails.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: ThumbnailTVC.identifier) as? ThumbnailTVC else { return UITableViewCell() }
		
		cell.getCellConfigureAt(indexPath.row)
		cell.delegate = self
		
		return cell
	}
}

extension HomeVC: PresentView {
	func present(viewController: UIViewController) {
		self.present(viewController, animated: true)
	}
}
