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

	@IBAction func checkButtonDidTap(_ sender: Any) {
		/// 이전 화면의 뷰 컨트롤러 인스턴스에 대한 참조를 이용해 화면을 내린다.
		self.presentingViewController?.dismiss(animated: true)
	}
}
