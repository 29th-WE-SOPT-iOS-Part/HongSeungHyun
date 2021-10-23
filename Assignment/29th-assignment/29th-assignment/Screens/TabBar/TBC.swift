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

	// MARK: - TabBar 아이템 만드는 함수

	func createTabBarItem<T>(storyboardName: String, viewController: T, title: String, tabBarImages: [String]) -> T? where T: UIViewController {
		let SB = UIStoryboard(name: storyboardName, bundle: nil)
		guard var tab = SB.instantiateViewController(withIdentifier: "\(T.self)") as? T else { return nil }
		setTabBarItem(tab: &tab, title: title, unSelectedImage: tabBarImages[0], selectedImage: tabBarImages[1])

		return tab
	}

	// MARK: - TabBar 아이템 속성 세팅 해주는 함수

	func setTabBarItem<T>(tab: inout T, title: String, unSelectedImage: String, selectedImage: String) where T: UIViewController {
		tab.title = title
		tab.tabBarItem.image = UIImage(named: unSelectedImage)
		tab.tabBarItem.selectedImage = UIImage(named: selectedImage)
	}

	// MARK: - TabBar 세팅하는 함수

	func setTabBar() {
		/// tab bar images
		let homeIcon = ["homeIcon", "homeIconFill"]
		let shortsIcon = ["shortsIcon", "shortsIconFill"]
		let plueCircleIcon = ["plueCircleIcon", "plueCircleIcon"]
		let subscriptionsIcon = ["subscriptionsIcon", "subscriptionsIconFill"]
		let libraryIcon = ["LibraryIcon", "LibraryIconFill"]
		
		/// create tab bar item
		guard let homeTab = createTabBarItem(storyboardName: "Home", viewController: HomeVC(), title: "Home", tabBarImages: homeIcon),
			let shortsTab = createTabBarItem(storyboardName: "Shorts", viewController: ShortsVC(), title: "Shorts", tabBarImages: shortsIcon),
			let addTab = createTabBarItem(storyboardName: "Add", viewController: AddVC(), title: "추가", tabBarImages: plueCircleIcon),
			let subscriptionsTab = createTabBarItem(storyboardName: "Subscriptions", viewController: SubscriptionsVC(), title: "구독", tabBarImages: subscriptionsIcon),
			let libraryTab = createTabBarItem(storyboardName: "Library", viewController: LibraryVC(), title: "보관함", tabBarImages: libraryIcon)
			else { return }

		let tabBarItems = [homeTab, shortsTab, addTab, subscriptionsTab, libraryTab]
		setUpViewControllers(viewControllers: tabBarItems)
	}

	// MARK: - TabBar의  view controllers를 세팅하는 함수

	func setUpViewControllers(viewControllers: [UIViewController]) {
		setViewControllers(viewControllers, animated: true)
	}

}
