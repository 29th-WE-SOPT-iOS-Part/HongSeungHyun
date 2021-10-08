//
//  completeVC.swift
//  29th-week1-assignment
//
//  Created by Noah on 2021/10/08.
//

import UIKit

class completeVC: UIViewController {

	@IBOutlet var greetingMessage: UILabel!
	var userName: String?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		setGreetingMessage()
    }
    
	func setGreetingMessage() {
		if let user = userName {
			greetingMessage.text = """
			\(user)님
			환영합니다!
			"""
			greetingMessage.numberOfLines = 0
			greetingMessage.textAlignment = .center
			greetingMessage.sizeToFit()
		}
	}
	
	@IBAction func checkButtonDidTap(_ sender: Any) {
	}
}
