//
//  UIViewController+.swift
//  29th-assignment
//
//  Created by Noah on 2021/11/15.
//

import UIKit

extension UIViewController {
	func makeAlert(title: String, message: String, okAction: ((UIAlertAction) -> Void)? = nil, completion: (() -> Void)? = nil) {
		let generator = UIImpactFeedbackGenerator(style: .medium)
		generator.impactOccurred()
		
		let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
		
		let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
		alertViewController.addAction(okAction)
		
		self.present(alertViewController, animated: true, completion: completion)
	}
}
