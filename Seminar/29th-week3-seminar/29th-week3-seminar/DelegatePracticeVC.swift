//
//  DelegatePractice.swift
//  29th-week3-seminar
//
//  Created by Noah on 2021/10/29.
//

import UIKit

class DelegatePracticeVC: UIViewController {

	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var partImageView: UIImageView!
	@IBOutlet weak var partPickerView: UIPickerView!
	
	var partList = [PartData]()
	
	override func viewDidLoad() {
        super.viewDidLoad()
		initPartData()
		initPartLayout()
		textField.delegate = self
		partPickerView.dataSource = self
		partPickerView.delegate = self
    }
	
	func initPartData() {
		partList.append(contentsOf: [
			PartData(imageName: "wesoptiOSPart", partName: "iOS"),
			PartData(imageName: "wesoptAndroidPart", partName: "Android"),
			PartData(imageName: "wesoptWebPart", partName: "Web"),
			PartData(imageName: "wesoptServerPart", partName: "Server"),
			PartData(imageName: "wesoptDesignPart", partName: "Design"),
			PartData(imageName: "wesoptPlanPart", partName: "Plan")
		])
	}
	
	func initPartLayout() {
		partImageView.image = partList[0].makeImage()
		textField.text = partList[0].partName
	}

}

extension DelegatePracticeVC: UITextFieldDelegate {
	func textFieldDidBeginEditing(_ textField: UITextField) {
		print("textFieldDidBeginEditing")
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		print("textFieldEndEditing")
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		print("textFieldShouldReturn")
		textField.endEditing(true)
		return true
	}
}

extension DelegatePracticeVC: UIPickerViewDataSource {
	// PickerView의 컴포넌트 숫자를 지정해 주는 메소드
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	// PickerView의 각 컴포넌트에서 행의 갯수를 지정해주는 메소드
	// partList 데이터의 갯수 만큼의 행이 필요
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return partList.count
	}
	
}

// 각 행을 채우는 동작과 선택되었을 때 동작하는 부분
extension DelegatePracticeVC: UIPickerViewDelegate {
	// PickerView의 각 행(row)의 title을 지정해주는 메소드
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		// partList에서 row번째에 있는 PartData의 partName으로 title 설정
		return partList[row].partName
	}
	
	// PickerView에서 행(row)를 선택했을 때 수행할 동작을 지정해주는 메소드
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		// partList에서 row번째에 있는 PartData의 UIImage를 가져오는 함수를 호출하여
		// partImageView의 image로 설정
		partImageView.image = partList[row].makeImage()
		
		// partList에서 row번째에 있는 PartData의 partName을 가져와
		// textField의 text로 지정합니다.
		textField.text = partList[row].partName
	}
}
