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

		/// ShortsTab
		let shortsSB = UIStoryboard(name: "Shorts", bundle: nil)
		guard let shortsTab = shortsSB.instantiateViewController(withIdentifier: "ShortsVC") as? ShortsVC else { return }

		let addSB = UIStoryboard(name: "Add", bundle: nil)
		guard let addTab = addSB.instantiateViewController(withIdentifier: "AddVC") as? AddVC else { return }

		let subscriptionsSB = UIStoryboard(name: "Subscriptions", bundle: nil)
		guard let subscriptionsTab = subscriptionsSB.instantiateViewController(withIdentifier: "SubscriptionsVC") as? SubscriptionsVC else { return }

		let librarySB = UIStoryboard(name: "Library", bundle: nil)
		guard let libraryTab = librarySB.instantiateViewController(withIdentifier: "LibraryVC") as? LibraryVC else { return }

		setViewControllers([homeTab, shortsTab, addTab, subscriptionsTab, libraryTab], animated: false)
	}

}
