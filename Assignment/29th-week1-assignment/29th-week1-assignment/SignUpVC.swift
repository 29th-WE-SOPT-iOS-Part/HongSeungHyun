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

        // Do any additional setup after loading the view.
    }
    
	@IBAction func showPwDidTap(_ sender: UIButton) {
		sender.isSelected.toggle()
	}
	
	@IBAction func signInButtonDidTap(_ sender: Any) {
		guard let completeVC = self.storyboard?.instantiateViewController(withIdentifier: "CompleteVC") else { return }
		
		completeVC.modalPresentationStyle = .fullScreen
		self.present(completeVC, animated: true)
	}
}
