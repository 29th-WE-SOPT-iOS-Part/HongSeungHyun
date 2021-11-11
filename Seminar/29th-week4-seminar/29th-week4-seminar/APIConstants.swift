//
//  APIConstants.swift
//  29th-week4-seminar
//
//  Created by Noah on 2021/11/11.
//

struct APIConstants {
	//MARK: Base URL
	static let baseURL = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api"
	
	//MARK: Feature URL
	static let loginURL = baseURL + "/user/login"
	static let readUserURL = baseURL + "/user/"
	
}
