//
//  GestureVC.swift
//  29th-week7-seminar
//
//  Created by Noah on 2021/12/24.
//

import UIKit

class GestureVC: UIViewController {

	@IBOutlet weak var testView: UIView?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		initGesture()
    }
	
	func initGesture() {
		/// 제스쳐 인식기 초기화 및 생성
		let tapRecognizer = UITapGestureRecognizer(target: self,
												   action: #selector(tapView(gestureRecognizer:)))
		/// 뷰에 제스쳐 인식기 연결
		testView?.addGestureRecognizer(tapRecognizer)
	}
	
	/// action method
	@objc func tapView(gestureRecognizer: UIGestureRecognizer) {
		print("uiView 안에서 tap")
	}
}
