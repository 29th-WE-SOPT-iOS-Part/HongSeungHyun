//
//  NetworkError.swift
//  29th-assignment
//
//  Created by Noah on 2021/11/14.
//

import Foundation

enum NetworkResult<T> {
	case success(T)
	case requestErr(T)
	case pathErr
	case serverErr
	case networkFail
}
