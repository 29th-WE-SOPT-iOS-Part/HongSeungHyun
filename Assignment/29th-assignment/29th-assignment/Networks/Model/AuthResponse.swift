//
//  AuthResponse.swift
//  29th-assignment
//
//  Created by Noah on 2021/11/14.
//

import Foundation

struct AuthResponse: Codable {
	let status: Int
	let success: Bool
	let message: String
	let data: LoginResultData?
}

struct LoginResultData: Codable {
	let id: Int
	let name, email: String
}
