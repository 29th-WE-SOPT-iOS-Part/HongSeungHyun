//
//  SecondViewController.swift
//  29th-week1-seminar
//
//  Created by Noah on 2021/10/05.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
	@IBAction func touchUpToGoBack(_ sender: Any) {
		self.navigationController?.popViewController(animated: true)
	}
}
