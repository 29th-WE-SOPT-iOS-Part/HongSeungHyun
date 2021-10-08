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

		nameTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
		emailPhoneTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
		pwTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
	}

	func setLoginDescLabel() {
		loginDescLabel.text = "YouTube도 이동하며 계속하세요. 앱 및 Safari에서도 Google 서비스에 로그인됩니다."
		loginDescLabel.numberOfLines = 0
		loginDescLabel.textAlignment = .center
		loginDescLabel.sizeToFit()
	}

	@objc
	func textFieldDidChange(textField: UITextField) {
		let allTextFieldsHaveText = [nameTextField, emailPhoneTextField, pwTextField].allSatisfy { $0.text?.isEmpty == false }
		
		if allTextFieldsHaveText {
			signInButton.isEnabled = true
		} else {
			signInButton.isEnabled = false
		}
	}

	@IBAction func signInButtonDidTap(_ sender: Any) {
		guard let completeVC = self.storyboard?.instantiateViewController(withIdentifier: "CompleteVC") as? CompleteVC else { return }

		completeVC.userName = nameTextField.text
		completeVC.modalPresentationStyle = .fullScreen
		self.present(completeVC, animated: true)
	}

	@IBAction func signUpButtonDidTap(_ sender: Any) {
		guard let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") else { return }
		self.navigationController?.pushViewController(signUpVC, animated: true)
	}
}

