//
//  AppContentModel.swift
//  29th-week3-seminar
//
//  Created by Noah on 2021/10/29.
//

import UIKit

struct AppContentData {
	let appName: String
	let description: String
	let appIconName: String
	
	func makeImage() -> UIImage? {
		return UIImage(named: appIconName)
	}
}
