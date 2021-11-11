//
//  UIView+.swift
//  29th-assignment
//
//  Created by Noah on 2021/11/01.
//

import UIKit

extension UIView {
	@IBInspectable var borderWidth: CGFloat {
		get {
			return layer.borderWidth
		}
		set {
			layer.borderWidth = newValue
		}
	}

	@IBInspectable var cornerRadius: CGFloat {
		get {
			return layer.cornerRadius
		}
		set {
			layer.cornerRadius = newValue
		}
	}
	
	@IBInspectable var borderColor: UIColor? {
		get {
			guard let color = layer.borderColor else { return nil }
			return UIColor(cgColor: color)
		}
		set {
			guard let uiColor = newValue else { return }
			layer.borderColor = uiColor.cgColor
		}
	}
}

