//
//  HomeVC+CollectionView.swift
//  29th-assignment
//
//  Created by Noah on 2021/10/29.
//

import UIKit

extension HomeVC: UICollectionViewDelegate {

}

extension HomeVC: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		switch collectionView {
			case channelList:
				return manager.channels.count
			case tagList:
				return manager.tags.count
			default:
				return .zero
		}
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		switch collectionView {
			case channelList:
				guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChannelCVC.identifier, for: indexPath) as? ChannelCVC else { return UICollectionViewCell() }
				cell.getCellConfigureAt(indexPath.row)
				return cell
			case tagList:
				guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCVC.identifier, for: indexPath) as? TagCVC else { return UICollectionViewCell() }
				cell.getCellConfigureAt(indexPath.row)
				return cell
			default:
				return UICollectionViewCell()
		}
		
	}
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		switch collectionView {
			case channelList:
				return CGSize(width: 72, height: 104)
			case tagList:
				return CGSize(width: manager.tags[indexPath.item].title.size(withAttributes: nil).width + 24, height: 32)
			default:
				return CGSize(width: 0, height: 0)
		}
		
	
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		switch collectionView {
			case channelList:
				return UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 7)
			case tagList:
				return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
			default:
				return .zero
		}
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		switch collectionView {
			case channelList:
				return 0
			case tagList:
				return 9
			default:
				return .zero
		}
	}

}
