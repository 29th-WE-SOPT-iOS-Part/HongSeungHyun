//
//  RankingVC.swift
//  29th-week3-seminar
//
//  Created by Noah on 2021/10/29.
//

import UIKit

class RankingVC: UIViewController {

	@IBOutlet weak var rankTableView: UITableView!
	
	var appContentList = [AppContentData]()
	
	override func viewDidLoad() {
        super.viewDidLoad()
		initAppContentList()
		registerXib()
		rankTableView.separatorStyle = .none
		rankTableView.dataSource = self
		rankTableView.delegate = self
    }
	
	func registerXib() {
		let xibName = UINib(nibName: RankingTableViewCell.identifier, bundle: nil)
		rankTableView.register(xibName, forCellReuseIdentifier: RankingTableViewCell.identifier)
	}
	
	func initAppContentList() {
		appContentList.append(contentsOf: [
			AppContentData(appName: "질병관리청", description: "전자예방접종증명서", appIconName: "coovIcon"),
			AppContentData(appName: "카카오톡", description: "소셜 네트워킹", appIconName: "kakaoIcon"),
			AppContentData(appName: "YouTube", description: "동영상과 음악", appIconName: "youtubeIcon"),
			AppContentData(appName: "네이버", description: "검색과 콘텐츠, 쇼핑, 내도구", appIconName: "naverIcon"),
			AppContentData(appName: "Instagram", description: "사진 및 비디오", appIconName: "instagramIcon"),
			AppContentData(appName: "쿠팡", description: "스마트한 쇼핑", appIconName: "coupangIcon"),
			AppContentData(appName: "배달의 민족", description: "대한민국 1등 배달앱", appIconName: "baeminIcon"),
			AppContentData(appName: "당근마켓", description: "중고거래", appIconName: "karrotIcon"),
			AppContentData(appName: "Netflix", description: "지금 바로 시청하세요", appIconName: "netflixIcon"),
			AppContentData(appName: "무신사", description: "브랜드 패션 쇼핑", appIconName: "musinsaIcon")
			])
	}
}

// 테이블 뷰의 동작과 모양을 관리
extension RankingVC: UITableViewDelegate {
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 80
	}
}

// 테이블을 만들 때 필요한 정보를 제공
extension RankingVC: UITableViewDataSource {
	// section 마다 몇개의 row를 넣어야하는지 지정하는 함수
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return appContentList.count
	}
	
	// indexPath의 프로퍼티 Section, Row
	// indexPath를 활용해 TableViewCell별로 데이터를 다르게 지정해줄 수 있다.
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: RankingTableViewCell.identifier) as? RankingTableViewCell else { return UITableViewCell() }
		
		cell.setData(rank: indexPath.row + 1, appData: appContentList[indexPath.row])
		return cell
	}
}
