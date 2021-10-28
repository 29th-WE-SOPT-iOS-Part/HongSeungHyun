//
//  PartDataModel.swift
//  29th-week3-seminar
//
//  Created by Noah on 2021/10/29.
//

import UIKit

struct PartData {
	var imageName: String
	var partName: String
	
	func makeImage() -> UIImage? {
		return UIImage(named: imageName)
	}
}
