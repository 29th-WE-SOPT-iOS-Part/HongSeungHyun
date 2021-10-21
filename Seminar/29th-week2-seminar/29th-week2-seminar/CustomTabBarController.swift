//
//  CustomTabBarController.swift
//  29th-week2-seminar
//
//  Created by Noah on 2021/10/21.
//

import UIKit

class CustomTabBarController: UITabBarController {

	override func viewDidLoad() {
		super.viewDidLoad()
		setTabBar()
	}

	func setTabBar() {
		/// 현재 CustomTabBarController가 있는 storyboard에서
		/// guard let 구문을 통해 안전하게 OrangeVC, PurpleVC 이름을 가진 UIViewController instance를 생성합니다.
		guard let orangeVC = self.storyboard?.instantiateViewController(withIdentifier: "OrangeVC"),
			  let purpleVC = self.storyboard?.instantiateViewController(withIdentifier: "PurpleVC")
		else { return }

		/// 생성한 인스턴스 orangeVC, purpleVC의 탭바 아이템의 title, image, selected되었을 때 image를 설정합니다.
		orangeVC.tabBarItem.title = "Home"
		orangeVC.tabBarItem.image = UIImage(systemName: "house")
		orangeVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
		purpleVC.tabBarItem.title = "Profile"
		purpleVC.tabBarItem.image = UIImage(systemName: "person")
		purpleVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")

		/// UITabBarController의 인스턴스 메소드인 setViewControllers를 사용해 파라미터로
		/// view controller 배열을 전달하며 Tabbar의 view controllers를 구성합니다.
		setViewControllers([orangeVC, purpleVC], animated: true)
	}
}
