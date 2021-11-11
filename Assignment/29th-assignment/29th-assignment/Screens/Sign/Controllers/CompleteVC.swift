//
//  completeVC.swift
//  29th-assignment
//
//  Created by Noah on 2021/10/08.
//

import UIKit

class CompleteVC: UIViewController {

	@IBOutlet var greetingMessage: UILabel!
	var userName: String?

	override func viewDidLoad() {
		super.viewDidLoad()
		setGreetingMessage()
	}

	/// userName 옵셔널 언래핑 + 빈문자열 여부 확인
	func setUserName() -> String {
		if let user = userName, user.count > 0 {
			return user
		} else {
			return "회원"
		}
	}

	/// 환영 메시지 설정
	func setGreetingMessage() {
		let user = setUserName()
		greetingMessage.text = """
			\(user)님
			환영합니다!
			"""
		greetingMessage.numberOfLines = 0
		greetingMessage.textAlignment = .center
		greetingMessage.sizeToFit()
	}

	// MARK: 확인 버튼을 누르면 TabBar로 연결된 화면을 present합니다.
	
	@IBAction func checkButtonDidTap(_ sender: Any) {
		let tabBarSB = UIStoryboard(name: "TabBar", bundle: nil)
		guard let tabBarVC = tabBarSB.instantiateViewController(identifier: "TBC") as? TBC else { return }

		tabBarVC.modalPresentationStyle = .fullScreen
		self.present(tabBarVC, animated: true, completion: nil)
	}
}
