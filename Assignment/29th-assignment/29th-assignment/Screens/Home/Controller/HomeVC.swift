//
//  HomeVC.swift
//  29th-assignment
//
//  Created by Noah on 2021/10/22.
//

import UIKit

class HomeVC: UIViewController {

	var manager = HomeManager.shared
	
	@IBOutlet weak var tableView: UITableView! {
		didSet {
			tableView.delegate = self
			tableView.dataSource = self
			registerTableViewXib()
		}
	}
	
	@IBOutlet weak var collectionView: UICollectionView! {
		didSet {
			collectionView.delegate = self
			collectionView.dataSource = self
			registerCollectionViewXib()
		}
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	func registerTableViewXib() {
		let xibName = UINib(nibName: ThumbnailTVC.identifier, bundle: nil)
		tableView.register(xibName, forCellReuseIdentifier: ThumbnailTVC.identifier)
	}
	
	func registerCollectionViewXib() {
		let xibName = UINib(nibName: ChannelCVC.identifier, bundle: nil)
		collectionView.register(xibName, forCellWithReuseIdentifier: ChannelCVC.identifier)
	}
}

