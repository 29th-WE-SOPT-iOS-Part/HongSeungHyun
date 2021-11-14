//
//  SignUpRequest.swift
//  29th-assignment
//
//  Created by Noah on 2021/11/14.
//

import Foundation

struct SignUpRequest: Codable {
	let email: String
	let name: String
	let password: String
}
