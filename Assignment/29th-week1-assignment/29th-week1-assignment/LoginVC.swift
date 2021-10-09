//
//  ViewController.swift
//  29th-week1-assignment
//
//  Created by Noah on 2021/10/06.
//

import UIKit

class LoginVC: UIViewController {

	@IBOutlet var loginDescLabel: UILabel!
	@IBOutlet var nameTextField: UITextField!
	@IBOutlet var emailPhoneTextField: UITextField!
	@IBOutlet var pwTextField: UITextField!
	@IBOutlet var signInButton: UIButton!

	override func viewDidLoad() {
		super.viewDidLoad()
		setLoginDescLabel()
		signInButton.isEnabled = false

		/// 이벤트가 발생했을 때 target 오브젝트와 action 메서드를 이어줍니다.
		addActionToTextField()
	}

	func setLoginDescLabel() {
		loginDescLabel.text = "YouTube도 이동하며 계속하세요. 앱 및 Safari에서도 Google 서비스에 로그인됩니다."
		loginDescLabel.numberOfLines = 0
		loginDescLabel.textAlignment = .center
		loginDescLabel.sizeToFit()
	}

	func addActionToTextField() {
		[nameTextField, emailPhoneTextField, pwTextField].forEach {
			$0?.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
		}
	}

	@objc
	func textFieldDidChange(textField: UITextField) {
		/// 모든 텍스트필드의 값이 비어 있지않다면 true가 됩니다.
		let allTextFieldsHaveText = [nameTextField, emailPhoneTextField, pwTextField].allSatisfy { $0.hasText }

		if allTextFieldsHaveText {
			signInButton.isEnabled = true
		} else {
			signInButton.isEnabled = false
		}
	}

	@IBAction func signInButtonDidTap(_ sender: Any) {
		/// 새로운 뷰 컨트롤러의 인스턴스를 생성합니다.
		guard let completeVC = self.storyboard?.instantiateViewController(withIdentifier: "CompleteVC") as? CompleteVC else { return }

		/// nameTextField의 text를 completeVC의 userName에 할당합니다.
		completeVC.userName = nameTextField.text
		/// modalPresentationStyle을 전체화면으로 합니다.
		completeVC.modalPresentationStyle = .fullScreen
		/// present 메소드를 이용하여 화면을 전환합니다.
		self.present(completeVC, animated: true)
	}

	@IBAction func signUpButtonDidTap(_ sender: Any) {
		/// 새로운 뷰 컨트롤러의 인스턴스를 생성합니다.
		guard let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") else { return }
		/// 내비게이션 컨트롤러를 사용하여 화면을 전환합니다.
		self.navigationController?.pushViewController(signUpVC, animated: true)
	}
}

