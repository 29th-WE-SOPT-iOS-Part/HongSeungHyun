//
//  ViewController.swift
//  29th-week4-seminar
//
//  Created by Noah on 2021/11/11.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var userTestLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}


	@IBAction func touchUpToLogin(_ sender: Any) {
		requestLogin()
	}
	
	func simpleAlert(title: String, message: String) {
		let alert = UIAlertController(title: title,
									  message: message,
									  preferredStyle: .alert)
		let okAction = UIAlertAction(title: "확인", style: .default)
		alert.addAction(okAction)
		present(alert, animated: true)
	}
}

extension ViewController {
	func requestLogin() {
		UserSignService.shared.login(email: emailTextField.text ?? "",
									 password: passwordTextField.text ?? "") { responseData in
			switch responseData {
				case .success(let loginResponse):
					guard let response = loginResponse as? LoginResponseData else { return }
					if let userData = response.data {
						self.simpleAlert(title: response.message,
										 message: "\(userData.name)님 환영합니다!")
						self.getUserData(userId: userData.id)
					}
				case .requestErr(let msg):
					NSLog("requestERR \(msg)")
				case .pathErr:
					NSLog("pathErr")
				case .serverErr:
					NSLog("serverErr")
				case .networkFail:
					print("networkFail")
			}
		}
	}
	
	func getUserData(userId: Int) {
		UserSignService.shared.readUserData(userId: userId) { responseData in
			switch responseData {
				case .success(let loginResponse):
					guard let response = loginResponse as? LoginResponseData else { return }
					if let userData = response.data {
						self.userTestLabel.text = userData.name
					}
				case .requestErr(let msg):
					NSLog("requestErr \(msg)")
				case .pathErr:
					NSLog("pathErr")
				case .serverErr:
					NSLog("serverErr")
				case .networkFail:
					NSLog("networkFail")
			}
		}
	}
}
