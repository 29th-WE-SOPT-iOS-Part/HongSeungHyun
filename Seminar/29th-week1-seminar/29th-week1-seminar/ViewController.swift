//
//  ViewController.swift
//  29th-week1-seminar
//
//  Created by Noah on 2021/10/05.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var testLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}

	@IBAction func touchUpToChangeLabel(_ sender: Any) {
		testLabel.text = "WE SOPT 1차 세미나"
		testLabel.sizeToFit()
	}
	
	@IBAction func touchUpToGoSecondView(_ sender: Any) {
		guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") else { return }
		
		self.navigationController?.pushViewController(nextVC, animated: true)
	}
}

