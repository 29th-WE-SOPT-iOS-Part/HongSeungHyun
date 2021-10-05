//
//  FirstViewController.swift
//  29th-week1-seminar
//
//  Created by Noah on 2021/10/05.
//

import UIKit

class FirstViewController: UIViewController {

	@IBOutlet weak var dataTextField: UITextField!
	
	override func viewDidLoad() {
        super.viewDidLoad()
    }
    
	@IBAction func touchUpToSendData(_ sender: Any) {
		guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else { return }
		
		nextVC.message = dataTextField.text
		nextVC.modalPresentationStyle = .fullScreen
		self.present(nextVC, animated: true, completion: nil)
	}

}
