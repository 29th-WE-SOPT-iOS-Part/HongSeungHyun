//
//  NetworkRequest.swift
//  29th-assignment
//
//  Created by Noah on 2021/11/14.
//

import Foundation

struct UserSignService {
	
	static let shared = UserSignService()
	private init() {}
		
	func requestLogin(userEmail: String, userPw: String, completion: @escaping (Result<AuthResponse, NetworkError<AuthResponse>>) -> ()) {
		let session = makeUrlSession()
		let requestData = makeRequestData(requestType: APIConstants.RequestType.login, dataList: userEmail, userPw)
		let request = makeUrlRequest(requestData: requestData, requestType: APIConstants.RequestType.login)
		
		let dataTask = session.dataTask(with: request) { (data, response, error) in
			guard error == nil, let resultData = data else { return completion(.failure(.networkFail)) }
			
			if let statusCode = (response as? HTTPURLResponse)?.statusCode {
				let result  = judgeStatus(by: statusCode, resultData)
				DispatchQueue.main.async {
					completion(result)
				}
			}
		}
		dataTask.resume()
	}
	
	private func judgeStatus(by statusCode: Int, _ data: Data) -> Result<AuthResponse, NetworkError<AuthResponse>> {
		guard let response = decodeData(data: data) else { return .failure(.networkFail) }
		switch statusCode {
		case 200:
			return .success(response)
		case 400:
			return .failure(.requestErr(response))
		case 500:
			return .failure(.serverErr)
		default:
			return .failure(.networkFail)
		}
	}
	
	private func decodeData(data: Data) -> AuthResponse? {
		let decoder = JSONDecoder()
		guard let decodedData = try? decoder.decode(AuthResponse.self, from: data) else { return nil }
		return decodedData
	}
}

extension UserSignService {
	private func makeUrlSession() -> URLSession {
		let config = URLSessionConfiguration.default
		let session = URLSession(configuration: config)
		return session
	}
	
	private func makeUrlRequest(requestData: Data?, requestType: APIConstants.RequestType) -> URLRequest {
		var request = URLRequest(url: APIConstants.loginURL)
		
		switch requestType {
		case .login, .signUp:
			request.httpMethod = APIConstants.HttpMethod.post.rawValue
		default:
			request.httpMethod = APIConstants.HttpMethod.get.rawValue
		}
		
		request.setValue(APIConstants.ContentType.json.rawValue, forHTTPHeaderField: "Content-Type")
		request.httpBody = requestData
		
		return request
	}
	
	private func makeRequestData(requestType: APIConstants.RequestType, dataList: String...) -> Data? {
		switch requestType {
		case .login:
			let requestData = try? JSONEncoder().encode(AuthRequest(email: dataList[0], name: nil, password: dataList[1]))
			return requestData
		case .signUp :
			let requestData = try? JSONEncoder().encode(AuthRequest(email: dataList[0], name: dataList[1], password: dataList[2]))
			return requestData
		default:
			return nil
		}
	}
}
