//
//  APIConstants.swift
//  29th-assignment
//
//  Created by Noah on 2021/11/14.
//

import Foundation

struct APIConstants {
	static var baseURL: URL {
		guard let url = URL(string: Bundle.main.infoDictionary?["API_URL"] as? String ?? "") else {
			fatalError("invalid url")
		}
		return url
	}
	
	static let loginURL = baseURL.appendingPathComponent("/user/login")
	static let signUpURL = baseURL.appendingPathComponent("/user/signup")
	static let getUserURL = baseURL.appendingPathComponent("/user/")
	
	enum HTTPHeaderField: String {
		case authentication = "Authorization"
		case contentType = "Content-Type"
		case acceptType = "Accept"
		case acceptEncoding = "Accept-Encoding"
		case xAuthToken = "x-auth-token"
	}
	
	enum ContentType: String {
		case json = "application/json"
	}
	
	enum RequestType: String {
		case login = "로그인"
		case signUp = "회원가입"
		case getUser
	}
	
	enum HttpMethod: String {
		case post = "POST"
		case get = "GET"
	}
}
