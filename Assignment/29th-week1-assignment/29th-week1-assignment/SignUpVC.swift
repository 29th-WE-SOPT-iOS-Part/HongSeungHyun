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
	
	override func viewDidLoad() {
        super.viewDidLoad()
    }
    
	@IBAction func showPwDidTap(_ sender: UIButton) {
		sender.isSelected.toggle()
	}
	
	@IBAction func signInButtonDidTap(_ sender: Any) {
		guard let completeVC = self.storyboard?.instantiateViewController(withIdentifier: "CompleteVC") as? CompleteVC else { return }
		
		completeVC.userName = nameTextField.text
		completeVC.modalPresentationStyle = .fullScreen
		self.present(completeVC, animated: true)
	}
}
