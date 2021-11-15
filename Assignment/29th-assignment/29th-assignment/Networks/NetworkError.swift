//
//  NetworkError.swift
//  29th-assignment
//
//  Created by Noah on 2021/11/14.
//

import Foundation

enum NetworkError<T>: Error {
	case requestErr(T)
	case pathErr
	case serverErr
	case networkFail
}
