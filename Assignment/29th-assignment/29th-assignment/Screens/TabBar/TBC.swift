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

	func createTabBarItem<T>(storyboardName: String, viewController: T, title: String, tabBarImages: [String]) -> T? where T: UIViewController {
		let SB = UIStoryboard(name: storyboardName, bundle: nil)
		guard var tab = SB.instantiateViewController(withIdentifier: "\(T.self)") as? T else { return nil }
		setTabBarItem(tab: &tab, title: title, unSelectedImage: tabBarImages[0], selectedImage: tabBarImages[1])
		
		return tab
	}

	func setTabBarItem<T>(tab: inout T, title: String, unSelectedImage: String, selectedImage: String) where T: UIViewController {
		tab.title = title
		tab.tabBarItem.image = UIImage(named: unSelectedImage)
		tab.tabBarItem.selectedImage = UIImage(named: selectedImage)
	}

	func setTabBar() {
		/// HomeTab
		guard let homeTab = createTabBarItem(storyboardName: "Home", viewController: HomeVC(), title: "Home", tabBarImages: ["homeIcon", "homeIconFill"]) else { return }

		/// ShortsTab
		guard let shortsTab = createTabBarItem(storyboardName: "Shorts", viewController: ShortsVC(), title: "Shorts", tabBarImages: ["shortsIcon", "shortsIconFill"]) else { return }

		/// AddTab
		guard let addTab = createTabBarItem(storyboardName: "Add", viewController: AddVC(), title: "추가", tabBarImages: ["plueCircleIcon", "plueCircleIconFill"]) else { return }
		
		/// SubscriptionTab
		guard let subscriptionsTab = createTabBarItem(storyboardName: "Subscriptions", viewController: SubscriptionsVC(), title: "구독", tabBarImages: ["subscriptionsIcon", "subscriptionsIconFill"]) else { return }

		/// LibraryTab
		guard let libraryTab = createTabBarItem(storyboardName: "Library", viewController: LibraryVC(), title: "보관함", tabBarImages: ["LibraryIcon", "LibraryIconFill"]) else { return }

		let tabBarItems = [homeTab, shortsTab, addTab, subscriptionsTab, libraryTab]
		setUpViewControllers(viewControllers: tabBarItems)
	}

	func setUpViewControllers(viewControllers: [UIViewController]) {
		setViewControllers(viewControllers, animated: true)
	}

}
