//
//  ChannelManger.swift
//  29th-assignment
//
//  Created by Noah on 2021/10/31.
//

import UIKit

protocol ChannelManager {
	mutating func getChannelImage(_ index: Int) -> UIImage
	mutating func getChannelTitle(_ index: Int) -> String
}
