//
//  FirstVC.swift
//  29th-week7-seminar
//
//  Created by Noah on 2021/12/24.
//

import UIKit

class FirstVC: UIViewController {

	static let identifier = "FirstVC"
	
	@IBOutlet weak var textField: UITextField?
	
	override func viewDidLoad() {
        super.viewDidLoad()
    }
    
	@IBAction func touchUpToSendData(_ sender: Any) {
		guard let nextVC = storyboard?.instantiateViewController(withIdentifier: SecondVC.identifier) as? SecondVC else { return }
		nextVC.receivedText = textField?.text ?? ""
		present(nextVC, animated: true)
	}
}
