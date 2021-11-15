//
//  ViewController.swift
//  29th-assignment
//
//  Created by Noah on 2021/10/06.
//

import UIKit

class LoginVC: UIViewController {

	@IBOutlet var loginDescLabel: UILabel!
	@IBOutlet var nameTextField: UITextField!
	@IBOutlet var emailPhoneTextField: UITextField!
	@IBOutlet var pwTextField: UITextField!
	@IBOutlet var signInButton: UIButton! {
		didSet {
			signInButton.isEnabled = false
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		setLoginDescLabel()
		/// 이벤트가 발생했을 때 target 오브젝트와 action 메서드를 이어줍니다.
		addActionToTextField()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		setTextFieldClear()
	}

	func setLoginDescLabel() {
		loginDescLabel.text = "YouTube도 이동하며 계속하세요.\n앱 및 Safari에서도 Google 서비스에 로그인됩니다."
		loginDescLabel.numberOfLines = 0
		loginDescLabel.textAlignment = .center
		loginDescLabel.sizeToFit()
	}

	func setTextFieldClear() {
		[nameTextField, emailPhoneTextField, pwTextField].forEach {
			$0.text = ""
		}
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
		signInButton.isEnabled = allTextFieldsHaveText
	}

	@IBAction func signInButtonDidTap(_ sender: Any) {
		requestLogin()
	}

	@IBAction func signUpButtonDidTap(_ sender: Any) {
		/// 새로운 뷰 컨트롤러의 인스턴스를 생성합니다.
		guard let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") else { return }
		/// 내비게이션 컨트롤러를 사용하여 화면을 전환합니다.
		self.navigationController?.pushViewController(signUpVC, animated: true)
	}

	// MARK: Unwind Segue를 사용하여 로그인 화면으로 돌아옵니다.

	@IBAction func otherAccountLoginButtonDidTap(_ sender: UIStoryboardSegue) { }
}

extension LoginVC {
	func requestLogin() {
		if let userEmail = emailPhoneTextField.text,
		   let userPw = pwTextField.text {
			UserSignService.shared.requestSignService(userEmail: userEmail, userPw: userPw, requestType: APIConstants.RequestType.login) { responseData in
				switch responseData {
				case .success(let response):
					self.loginSuccessAction(response)
				case .failure(.requestErr(let error)):
					self.loginFailureAction(error)
				case .failure(let error):
					NSLog(error.localizedDescription)
				}
			}
		}
	}
	
	func loginSuccessAction(_ response: AuthResponse) {
		self.makeAlert(title: APIConstants.RequestType.login.rawValue, message: response.message, okAction: { [weak self] _ in
			guard let completeVC = self?.storyboard?.instantiateViewController(withIdentifier: "CompleteVC") as? CompleteVC else { return }
			completeVC.userName = self?.nameTextField.text
			completeVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
			self?.present(completeVC, animated: true)
		})
	}
	
	func loginFailureAction(_ error: AuthResponse) {
		self.makeAlert(title: APIConstants.RequestType.login.rawValue, message: error.message)
	}
}

