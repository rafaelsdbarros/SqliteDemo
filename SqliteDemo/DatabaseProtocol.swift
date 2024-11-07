//
//  DatabaseProtocol.swift
//  SqliteDemo
//
//  Created by Rafael on 27/09/23.
//

import Foundation

protocol DatabaseProtocol {
    associatedtype T
    static func createTable() -> Void
    static func insert(item: T) -> Int64?
    static func deleteById(item: T) -> Void
    static func findAll() -> [T]?
}
