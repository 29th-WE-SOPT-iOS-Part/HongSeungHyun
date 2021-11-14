//
//  NetworkRequest.swift
//  29th-assignment
//
//  Created by Noah on 2021/11/14.
//

import Foundation

struct Network {
	
	static let shared = Network()
	private init() {}
		
	func requestLogin(userEmail: String, userPw: String, completion: @escaping (NetworkResult<Any>) -> ()) {
		let config = URLSessionConfiguration.default
		let session = URLSession(configuration: config)
		let encoder = JSONEncoder()
		let requestData = try? encoder.encode(AuthRequest(email: userEmail, password: userPw))
		// request url
		var request = URLRequest(url: APIConstants.loginURL)
		request.httpMethod = "POST"
		request.setValue(APIConstants.ContentType.json.rawValue, forHTTPHeaderField: "Content-Type")
		request.httpBody = requestData
		
		let dataTask = session.dataTask(with: request) { (data, response, error) in
			guard error == nil else { return }
			
			guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { return }
			guard let resultData = data else { return }
			let networkResult = self.judgeStatus(by: statusCode, resultData)
			DispatchQueue.main.async {
				completion(networkResult)
			}
		}
		dataTask.resume()
	}
	
	func requestSignUp(userEmail: String, userName: String, userPw: String, completion: @escaping (NetworkResult<Any>) -> ()) {
		let config = URLSessionConfiguration.default
		let session = URLSession(configuration: config)
		let encoder = JSONEncoder()
		let requestData = try? encoder.encode(SignUpRequest(email: userEmail, name: userName, password: userPw))
		// request url
		var request = URLRequest(url: APIConstants.loginURL)
		request.httpMethod = "POST"
		request.setValue(APIConstants.ContentType.json.rawValue, forHTTPHeaderField: "Content-Type")
		request.httpBody = requestData
		
		let dataTask = session.dataTask(with: request) { (data, response, error) in
			guard error == nil else { return }
			
			guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { return }
			print(statusCode)
			guard let resultData = data else { return }
			let networkResult = self.judgeStatus(by: statusCode, resultData)
			print(networkResult)
			DispatchQueue.main.async {
				completion(networkResult)
			}
		}
		dataTask.resume()
	}
	
	private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
		switch statusCode {
			case 200: return .success(decodeData(data: data))
			case 400: return .requestErr(decodeData(data: data))
			case 500: return .serverErr
			default: return .networkFail
		}
	}
	
	private func decodeData(data: Data) -> AuthResponse {
		let decoder = JSONDecoder()
		guard let decodedData = try? decoder.decode(AuthResponse.self, from: data) else { return AuthResponse(status: 400, success: false, message: "fail", data: nil) }
		return decodedData
	}
}
