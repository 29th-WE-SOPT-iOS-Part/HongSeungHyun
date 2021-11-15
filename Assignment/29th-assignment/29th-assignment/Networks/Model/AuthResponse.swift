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
	let userId: Int
	let name, email: String
	
	enum CodingKeys: String, CodingKey {
		case userId = "id"
		case name, email
	}
}
