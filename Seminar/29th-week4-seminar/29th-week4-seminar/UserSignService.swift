//
//  UserSignService.swift
//  29th-week4-seminar
//
//  Created by Noah on 2021/11/11.
//

import Alamofire

struct UserSignService {
	typealias Ne = (NetworkResult<Any>) -> (Void)
	// MARK: singleton
	static let shared = UserSignService()
	
	func login(email: String,
			   password: String,
			   completion: @escaping(NetworkResult<Any>) -> (Void)) {
		let url = APIConstants.loginURL
		let header: HTTPHeaders = [
			"Content-Type" : "application/json"
		]
		let body: Parameters = [
			"email": email,
			"password": password
		]
		
		let dataRequest = AF.request(url,
									 method: .post,
									 parameters: body,
									 encoding: JSONEncoding.default,
									 headers: header)
		dataRequest.responseData { DataResponse in
			switch DataResponse.result {
				case.success:
					guard let statusCode = DataResponse.response?.statusCode else { return }
					guard let value = DataResponse.value else { return }
					let networkResult = self.judgeLoginStatus(by: statusCode, value)
					completion(networkResult)
				case .failure(let err):
					NSLog("\(err)")
					completion(.networkFail)
			}
		}
	}
	
	func readUserData(userId: Int,
					  completion: @escaping (NetworkResult<Any>) -> (Void)) {
		let url = APIConstants.readUserURL + "\(userId)"
		let header: HTTPHeaders = [
			"Content-Type" : "application/json"
		]
		
		let dataRequest = AF.request(url,
									 method: .get,
									 encoding: JSONEncoding.default,
									 headers: header)
		dataRequest.responseData { dataResponse in
			switch dataResponse.result {
				case .success:
					guard let statusCode = dataResponse.response?.statusCode else { return }
					guard let value = dataResponse.value else { return }
					let networkResult = self.judgeLoginStatus(by: statusCode, value)
					completion(networkResult)
				case .failure(let err):
					print(err)
					completion(.networkFail)
			}
		}
	}
	
	private func judgeLoginStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
		switch statusCode {
			case 200: return isValidLoginData(data: data)
			case 400: return .pathErr
			case 500: return .serverErr
			default: return .networkFail
		}
	}
	
	private func isValidLoginData(data: Data) -> NetworkResult<Any> {
		let decoder = JSONDecoder()
		guard let decodedData = try? decoder.decode(LoginResponseData.self, from: data) else { return .pathErr }
		return .success(decodedData)
	}
}
