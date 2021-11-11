//
//  LoginResponseDataModel.swift
//  29th-week4-seminar
//
//  Created by Noah on 2021/11/11.
//

// MARK: - LoginResponseData
struct LoginResponseData: Codable {
	let status: Int
	let success: Bool
	let message: String
	let data: LoginResultData?
}

// MARK: - LoginResultData
struct LoginResultData: Codable {
	let id: Int
	let name, email: String
}
