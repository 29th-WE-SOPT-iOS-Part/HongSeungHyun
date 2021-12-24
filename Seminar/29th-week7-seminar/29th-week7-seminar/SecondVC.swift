//
//  SecondVC.swift
//  29th-week7-seminar
//
//  Created by Noah on 2021/12/24.
//

import UIKit

class SecondVC: UIViewController {
	
	static let identifier = "SecondVC"
	var receivedText = ""

	@IBOutlet weak var textField: UITextField?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		textField?.text = receivedText
    }
    
	@IBAction func touchUpToSendData(_ sender: Any) {
		let presentingVC = presentingViewController as? FirstVC
		presentingVC?.textField?.text = textField?.text
		dismiss(animated: true)
	}
}
