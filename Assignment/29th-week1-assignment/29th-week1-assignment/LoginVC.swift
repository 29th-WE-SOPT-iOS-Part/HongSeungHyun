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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setLoginDescLabel()
	}
	
	func setLoginDescLabel() {
		loginDescLabel.text = "YouTube도 이동하며 계속하세요. 앱 및 Safari에서도 Google 서비스에 로그인됩니다."
		loginDescLabel.numberOfLines = 0
		loginDescLabel.textAlignment = .center
		loginDescLabel.sizeToFit()
	}
	
	@IBAction func signInButtonDidTap(_ sender: Any) {
		guard let completeVC = self.storyboard?.instantiateViewController(withIdentifier: "CompleteVC") else { return }
		
		completeVC.modalPresentationStyle = .fullScreen
		self.present(completeVC, animated: true)
	}
	
	@IBAction func signUpButtonDidTap(_ sender: Any) {
		guard let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") else { return }
		self.navigationController?.pushViewController(signUpVC, animated: true)
	}
}

