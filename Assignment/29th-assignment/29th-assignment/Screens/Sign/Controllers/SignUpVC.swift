//
//  SignUpVC.swift
//  29th-assignment
//
//  Created by Noah on 2021/10/08.
//

import UIKit

class SignUpVC: UIViewController {

	@IBOutlet var nameTextField: UITextField!
	@IBOutlet var emailPhoneTextField: UITextField!
	@IBOutlet var pwTextField: UITextField!
	@IBOutlet var signUpButton: UIButton! {
		didSet {
			signUpButton.isEnabled = false
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
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
		/// 텍스트필드의 값이 모두 채워져있다면 버튼 활성화
		signUpButton.isEnabled = allTextFieldsHaveText
	}

	@IBAction func showPwDidTap(_ sender: UIButton) {
		sender.isSelected.toggle()
		/// 버튼이 선택되었다면 비밀번호를 보여줍니다.
		pwTextField.isSecureTextEntry.toggle()
	}

	@IBAction func signUpButtonDidTap(_ sender: Any) {
		requestSignUP()
	}
}

extension SignUpVC {
	func requestSignUP() {
		if let userEmail = emailPhoneTextField.text,
		   let userName = nameTextField.text,
		   let userPw = pwTextField.text {
			UserSignService.shared.requestSignService(userEmail: userEmail, userPw: userPw, userName: userName, requestType: APIConstants.RequestType.signUp) { responseData in
				switch responseData {
				case .success(let response):
					self.signUpSuccessAction(response)
				case .failure(.requestErr(let error)):
					self.signUpFailureAction(error)
				case .failure(let error):
					NSLog(error.localizedDescription)
				}
			}
			
		}
	}
	
	func signUpSuccessAction(_ response: AuthResponse) {
		self.makeAlert(title: APIConstants.RequestType.signUp.rawValue, message: response.message, okAction: { [weak self] _ in
			guard let completeVC = self?.storyboard?.instantiateViewController(withIdentifier: "CompleteVC") as? CompleteVC else { return }
			completeVC.userName = self?.nameTextField.text
			completeVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
			self?.present(completeVC, animated: true)
		})
	}
	
	func signUpFailureAction(_ error: AuthResponse) {
		self.makeAlert(title: APIConstants.RequestType.signUp.rawValue, message: error.message)
	}
}
