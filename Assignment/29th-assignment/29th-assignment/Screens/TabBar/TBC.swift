//
//  TBC.swift
//  29th-assignment
//
//  Created by Noah on 2021/10/22.
//

import UIKit

class TBC: UITabBarController {

	override func viewDidLoad() {
		super.viewDidLoad()
		setTabBar()
	}
	
	func setTabBar() {
		/// HomeTab
		let homeSB = UIStoryboard(name: "Home", bundle: nil)
		guard let homeTab = homeSB.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC else { return }
		homeTab.title = "홈"
		homeTab.tabBarItem.image = UIImage(named: "homeIcon")
		homeTab.tabBarItem.selectedImage = UIImage(named: "homeIconFill")

		/// ShortsTab
		let shortsSB = UIStoryboard(name: "Shorts", bundle: nil)
		guard let shortsTab = shortsSB.instantiateViewController(withIdentifier: "ShortsVC") as? ShortsVC else { return }
		shortsTab.title = "Shorts"
		shortsTab.tabBarItem.image = UIImage(named: "shortsIcon")
		shortsTab.tabBarItem.selectedImage = UIImage(named: "shortsIconFill")

		let addSB = UIStoryboard(name: "Add", bundle: nil)
		guard let addTab = addSB.instantiateViewController(withIdentifier: "AddVC") as? AddVC else { return }
		addTab.title = "추가"
		addTab.tabBarItem.image = UIImage(named: "plueCircleIcon")
		addTab.tabBarItem.selectedImage = UIImage(named: "plueCircleIcon")

		let subscriptionsSB = UIStoryboard(name: "Subscriptions", bundle: nil)
		guard let subscriptionsTab = subscriptionsSB.instantiateViewController(withIdentifier: "SubscriptionsVC") as? SubscriptionsVC else { return }
		subscriptionsTab.title = "구독"
		subscriptionsTab.tabBarItem.image = UIImage(named: "subscriptionsIcon")
		subscriptionsTab.tabBarItem.selectedImage = UIImage(named: "subscriptionsIconFill")

		let librarySB = UIStoryboard(name: "Library", bundle: nil)
		guard let libraryTab = librarySB.instantiateViewController(withIdentifier: "LibraryVC") as? LibraryVC else { return }
		libraryTab.title = "보관함"
		libraryTab.tabBarItem.image = UIImage(named: "LibraryIcon")
		libraryTab.tabBarItem.selectedImage = UIImage(named: "LibraryIconFill")

		setViewControllers([homeTab, shortsTab, addTab, subscriptionsTab, libraryTab], animated: false)
	}

}
