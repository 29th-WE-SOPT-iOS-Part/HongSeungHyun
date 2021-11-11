//
//  NetworkResult.swift
//  29th-week4-seminar
//
//  Created by Noah on 2021/11/11.
//

enum NetworkResult<T> {
	case success(T)
	case requestErr(T)
	case pathErr
	case serverErr
	case networkFail
}
