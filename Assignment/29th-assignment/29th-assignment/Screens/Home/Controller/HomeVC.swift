//
//  HomeVC.swift
//  29th-assignment
//
//  Created by Noah on 2021/10/22.
//

import UIKit

class HomeVC: UIViewController {

	var manager = HomeManager.shared
	
	@IBOutlet weak var mainFeed: UITableView! {
		didSet {
			mainFeed.delegate = self
			mainFeed.dataSource = self
			registerTableViewXib()
		}
	}
	
	@IBOutlet weak var channelList: UICollectionView! {
		didSet {
			channelList.delegate = self
			channelList.dataSource = self
			registerCollectionViewXib(CVC: ChannelCVC(), view: self.channelList)
		}
	}
	
	@IBOutlet weak var tagList: UICollectionView! {
		didSet {
			tagList.delegate = self
			tagList.dataSource = self
			registerCollectionViewXib(CVC: TagCVC(), view: self.tagList)
		}
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	func registerTableViewXib() {
		let xibName = UINib(nibName: ThumbnailTVC.identifier, bundle: nil)
		mainFeed.register(xibName, forCellReuseIdentifier: ThumbnailTVC.identifier)
	}
	
	func registerCollectionViewXib<Cell, View>(CVC: Cell, view: View) where Cell: UICollectionViewCell, Cell: CellProtocol, View: UICollectionView {
		let nibName = UINib(nibName: Cell.identifier, bundle: nil)
		view.register(nibName, forCellWithReuseIdentifier: Cell.identifier)
	}
}
