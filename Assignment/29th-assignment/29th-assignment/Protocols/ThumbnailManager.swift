//
//  ThumbnailManager.swift
//  29th-assignment
//
//  Created by Noah on 2021/10/31.
//
import UIKit

protocol ThumbnailManager {
	mutating func getThumbnailImage(_ index: Int) -> UIImage
	mutating func getProfileImage(_ index: Int) -> UIImage
	mutating func getThumbnailTitle(_ index: Int) -> String
	mutating func getThumbnailAuthor(_ index: Int) -> String
	mutating func getThumbnailViews(_ index: Int) -> String
	mutating func getThumbnailCreatedDate(_ index: Int) -> String
	mutating func makeImage(imageName: String) -> UIImage
}
