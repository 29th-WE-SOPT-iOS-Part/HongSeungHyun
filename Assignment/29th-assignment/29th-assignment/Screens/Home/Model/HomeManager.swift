//
//  HomeManager.swift
//  29th-assignment
//
//  Created by Noah on 2021/10/29.
//

import UIKit

struct HomeManager {
	
	static let shared = HomeManager()
	
	lazy var thumbnails = [
		Thumbnail(thumbNailImage: makeImage(imageName: "wesoptiOSPart"), profileImage: makeImage(imageName: "wesoptProfile"), title: "1차 iOS세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", author: "WE SOPT", views: "100만회", createdDate: "3주전"),
		Thumbnail(thumbNailImage: makeImage(imageName: "wesoptiOSPart"), profileImage: makeImage(imageName: "wesoptProfile"), title: "2차 iOS세미나 : AutoLayout, StackView, TabBarController", author: "WE SOPT", views: "100만회", createdDate: "3주전"),
		Thumbnail(thumbNailImage: makeImage(imageName: "wesoptiOSPart"), profileImage: makeImage(imageName: "wesoptProfile"), title: "3차 iOS세미나 : ScrollView, Delegatae Pattern, TableView, CollectionView", author: "WE SOPT", views: "100만회", createdDate: "3주전"),
		Thumbnail(thumbNailImage: makeImage(imageName: "wesoptiOSPart"), profileImage: makeImage(imageName: "wesoptProfile"), title: "4차 iOS세미나 : Cocoapods & Networking, REST API", author: "WE SOPT", views: "100만회", createdDate: "3주전"),
		Thumbnail(thumbNailImage: makeImage(imageName: "wesoptiOSPart"), profileImage: makeImage(imageName: "wesoptProfile"), title: "5차 iOS세미나 : 디자인 합동 세미나", author: "WE SOPT", views: "100만회", createdDate: "3주전"),
		Thumbnail(thumbNailImage: makeImage(imageName: "wesoptiOSPart"), profileImage: makeImage(imageName: "wesoptProfile"), title: "6차 iOS세미나 : 서버 합동 세미나", author: "WE SOPT", views: "100만회", createdDate: "3주전"),
		Thumbnail(thumbNailImage: makeImage(imageName: "wesoptiOSPart"), profileImage: makeImage(imageName: "wesoptProfile"), title: "7차 iOS세미나 : Animation과 제스쳐, 데이터 전달 심화", author: "WE SOPT", views: "100만회", createdDate: "3주전"),
		Thumbnail(thumbNailImage: makeImage(imageName: "wesoptiOSPart"), profileImage: makeImage(imageName: "wesoptProfile"), title: "8차 iOS세미나 : 협업 시 도움이 되는 팁과 라이브러리 사용", author: "WE SOPT", views: "100만회", createdDate: "3주전")
	]
	
	
	lazy var channels = [
		Channel(image: makeImage(imageName: "ggamju1"), title: "iOSPart"),
		Channel(image: makeImage(imageName: "ggamju2"), title: "AndroidPart"),
		Channel(image: makeImage(imageName: "ggamju3"), title: "ServerPart"),
		Channel(image: makeImage(imageName: "ggamju4"), title: "WebPart"),
		Channel(image: makeImage(imageName: "ggamju5"), title: "DesignPart"),
		Channel(image: makeImage(imageName: "ggamju6"), title: "PlanPart"),
		Channel(image: makeImage(imageName: "ggamju7"), title: "WE SOPT"),
		Channel(image: makeImage(imageName: "ggamju8"), title: "29th SOPT"),
		
	]
}

extension HomeManager: ThumbnailManager {
	mutating func getThumbnailImage(_ index: Int) -> UIImage {
		return thumbnails[index].thumbNailImage
	}
	
	mutating func getProfileImage(_ index: Int) -> UIImage {
		return thumbnails[index].profileImage
	}
	
	mutating func getThumbnailTitle(_ index: Int) -> String {
		return thumbnails[index].title
	}
	
	mutating func getThumbnailAuthor(_ index: Int) -> String {
		return thumbnails[index].author
	}
	
	mutating func getThumbnailViews(_ index: Int) -> String {
		return thumbnails[index].views
	}
	
	mutating func getThumbnailCreatedDate(_ index: Int) -> String {
		return thumbnails[index].createdDate
	}
	
	func makeImage(imageName: String) -> UIImage {
		if let image = UIImage(named: imageName) {
			return image
		} else {
			NSLog("failed image unwrapping")
			return UIImage()
		}
	}
}

extension HomeManager: ChannelManager {
	mutating func getChannelImage(_ index: Int) -> UIImage {
		return channels[index].image
	}
	
	mutating func getChannelTitle(_ index: Int) -> String {
		return channels[index].title
	}
}
