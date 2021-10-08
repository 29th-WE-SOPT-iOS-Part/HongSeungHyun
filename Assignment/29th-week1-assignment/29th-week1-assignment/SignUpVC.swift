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
		
		[nameTextField, emailPhoneTextField, pwTextField].forEach {
			$0?.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
		}
    }
	
	@objc
	func textFieldDidChange(textField: UITextField) {
		let allTextFieldsHaveText = [nameTextField, emailPhoneTextField, pwTextField].allSatisfy { $0.text?.isEmpty == false }
		
		if allTextFieldsHaveText {
			signUpButton.isEnabled = true
		} else {
			signUpButton.isEnabled = false
		}
	}
    
	@IBAction func showPwDidTap(_ sender: UIButton) {
		sender.isSelected.toggle()
		
		if sender.isSelected {
			pwTextField.isSecureTextEntry = false
		}
		else {
			pwTextField.isSecureTextEntry = true
		}
	}
	
	@IBAction func signUpButtonDidTap(_ sender: Any) {
		guard let completeVC = self.storyboard?.instantiateViewController(withIdentifier: "CompleteVC") as? CompleteVC else { return }
		
		completeVC.userName = nameTextField.text
		completeVC.modalPresentationStyle = .fullScreen
		self.present(completeVC, animated: true)
	}
}
