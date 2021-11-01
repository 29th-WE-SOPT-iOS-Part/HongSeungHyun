//
//  CellProtocol.swift
//  29th-assignment
//
//  Created by Noah on 2021/10/31.
//

protocol CellProtocol {
	static var identifier: String { get }
	func getCellConfigureAt(_ index: Int)
}
