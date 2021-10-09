//
//  SignUpVC.swift
//  29th-week1-assignment
//
//  Created by Noah on 2021/10/08.
//

import UIKit

class SignUpVC: UIViewController {

	@IBOutlet var nameTextField: UITextField!
	@IBOutlet var emailPhoneTextField: UITextField!
	@IBOutlet var pwTextField: UITextField!
	@IBOutlet var signUpButton: UIButton!

	override func viewDidLoad() {
		super.viewDidLoad()
		signUpButton.isEnabled = false

		/// 이벤트가 발생했을 때 target 오브젝트와 action 메서드를 이어줍니다.
		addActionToTextField()
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
			signUpButton.isEnabled = true
		} else {
			signUpButton.isEnabled = false
		}
	}

	@IBAction func showPwDidTap(_ sender: UIButton) {
		sender.isSelected.toggle()

		/// 버튼이 선택되었다면 비밀번호를 보여줍니다.
		if sender.isSelected {
			pwTextField.isSecureTextEntry = false
		}
		else {
			pwTextField.isSecureTextEntry = true
		}
	}

	@IBAction func signUpButtonDidTap(_ sender: Any) {
		/// 새로운 뷰 컨트롤러의 인스턴스를 생성합니다.
		guard let completeVC = self.storyboard?.instantiateViewController(withIdentifier: "CompleteVC") as? CompleteVC else { return }

		/// nameTextField의 text를 completeVC의 userName에 할당합니다.
		completeVC.userName = nameTextField.text
		/// modalPresentationStyle을 전체화면으로 합니다.
		completeVC.modalPresentationStyle = .fullScreen
		/// present 메소드를 이용하여 화면을 전환합니다.
		self.present(completeVC, animated: true)
	}
}
